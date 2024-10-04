Return-Path: <linux-next+bounces-4107-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB9990205
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 13:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9357E1F215D1
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 11:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE088156F34;
	Fri,  4 Oct 2024 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZbQgtt0b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1C137903
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040993; cv=none; b=oLLR8mFcboooI5LrIV6SAxVmmf/JgQnn4nZkc/0GO+kOEKGj82PQs1xD0y0eVJh21A5ET4/wGRFOoqSDn1uYa1cudEKvHAT6OwriIkYkJKc1S3bqMNNKBLeptsh0sLjiBbPwYgTUi9qIVQcJ2GgXi3jJMELU5FL4jSR2YBJcNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040993; c=relaxed/simple;
	bh=0E8vXpa1P4oiHPdU4nkOxDCOFdFuyh6RE5LxFNmXcEI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=k/MwzF2W6/oISfX+QYsOkYNXQ1KN4BSmTOJQbdpc332f4d2QYdryyqC2ejjE5xCxjoNOtoliqNKW5of6SUgu8ZHkouMsmU/7kLaAbJE2+8eW4STLugK0O9wMm+/X14KPOBM1eIcb2Mmt8qLa84xLC8DznOX7R8k1oKlcFo53xtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZbQgtt0b; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b7eb9e81eso23076835ad.2
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2024 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1728040990; x=1728645790; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P9/Lg5h5SnS9DILlAgOYsVS6tLep5zlnOMb9J4Gip2U=;
        b=ZbQgtt0b8LeJ5bInNDb/VrhsSlyNWRozs9WXhCe/T+vxFlXgcAl0XD06lF6eZlb3AR
         N8Cdr4MSX+sjXw8P84SYfQtasXtQxk4vGvs2GZHN8HBBRKdMxuGqIEbaxewIAnPj34IU
         mIbok5cDO1/GAfNmDWP0XVQtPgcUnIQ/BjlxNTsR38pghpY6v2RX1BTb4H0mNkC7DJLG
         zVUeqTNG9JpmBL1D+5UJARlhNA2nWdtHuflsDww7N8TVjulwEdM3O3HQeTscbCWYhE6I
         cHAHCc6IzwDib56+04ju2CJF7VhXoX9ZoAVB6t9Y9flnY/J2oeu4utqg7SrEDHypaCo+
         JFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040990; x=1728645790;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9/Lg5h5SnS9DILlAgOYsVS6tLep5zlnOMb9J4Gip2U=;
        b=v07iUkfBqXEqHCPcz0qUx9q+VkEAH68yM+/AQ32KWBePf22tCPMooGcB0fYgiGEH1H
         qEJvBe3XV7JiVp1KjI55it4FsMFDTUzCwz0E/eeqFV6LWEHO3cJd8UOv+/4h1lx7Tef7
         Mwy7DT5RuvEzgQgDLeBlAHiphLp6f+BzBycgsyBEwiYCQk35fb3zfc4HPfy9cuM+1tZu
         O7pYpxMlli0iBuZpGjBLV2LrR7RGIWoHtrl0MhV8pREaT2ZykifofH0+q5fXz2q48GTW
         RHXOSoO2JYTkQVMJkLbJZrRYqnj/f/2plgLb7ojIyTCVRVhgE7jdgcnOg/AugEZs+fcq
         5mwg==
X-Gm-Message-State: AOJu0YzY1YCvqr27SKVPIjrazmOwrAGLxmojMJXJJpHsJWgR8ZxnJlFt
	ltnsHpvMW7r6QQOgWJ4Hia9/FeEixs4OqxcET5cTRDxdaZ74iAWIydyn3Nq+kiyPULnoXbdVxer
	H
X-Google-Smtp-Source: AGHT+IG4u51JkcmdAOCcNan8Y1wyEppePJWLEwlxyHfPl+cpyg1sHvm40q/Ss9Xe6PFDUKccMnFDBg==
X-Received: by 2002:a05:6a20:c6ce:b0:1d3:e39:f69c with SMTP id adf61e73a8af0-1d6dfa3a882mr3031113637.15.1728040989185;
        Fri, 04 Oct 2024 04:23:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9dde84csm2957683b3a.139.2024.10.04.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:23:08 -0700 (PDT)
Message-ID: <66ffd01c.050a0220.21b529.c40b@mx.google.com>
Date: Fri, 04 Oct 2024 04:23:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241004
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 206 runs, 38 regressions (next-20241004)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 206 runs, 38 regressions (next-20241004)

Regressions Summary
-------------------

platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre | clang-17 | multi_v7_=
defconfig           | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre | clang-17 | defconfig=
                    | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre | gcc-12   | defconfig=
                    | 1          =

jetson-tk1                   | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre | gcc-12   | tegra_def=
config              | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron  | gcc-12   | defconfig=
+debug              | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron  | gcc-12   | multi_v7_=
defconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron  | gcc-12   | multi_v7_=
defconfig+kselftest | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron  | gcc-12   | defconfig=
+debug              | 1          =

meson-g12a-u200              | arm64  | lab-baylibre | gcc-12   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

qemu_i386                    | i386   | lab-broonie  | gcc-12   | i386_defc=
onfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie  | gcc-12   | i386_defc=
onfig+debug         | 1          =

qemu_riscv64                 | riscv  | lab-broonie  | clang-17 | defconfig=
                    | 1          =

qemu_riscv64                 | riscv  | lab-broonie  | gcc-12   | defconfig=
                    | 1          =

qemu_riscv64                 | riscv  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie  | clang-17 | defconfig=
                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie  | gcc-12   | defconfig=
                    | 1          =

qemu_smp8_riscv64            | riscv  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

qemu_x86_64                  | x86_64 | lab-broonie  | gcc-12   | x86_64_de=
fconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie  | gcc-12   | x86_64_de=
fconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie  | gcc-12   | x86_64_de=
fconfig+debug       | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip      | gcc-12   | shmobile_=
defconfig           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie  | gcc-12   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie  | gcc-12   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie  | gcc-12   | defconfig=
                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie  | gcc-12   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | sunxi_def=
config              | 1          =

zynqmp-zcu102                | arm64  | lab-cip      | gcc-12   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241004/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241004
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      58ca61c1a866bfdaa5e19fb19a2416764f847d75 =



Test Regressions
---------------- =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff981b66b4940608c8685b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff981b66b4940608c86=
85c
        failing since 44 days (last pass: next-20240716, first fail: next-2=
0240820) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9c3f1f590a41fdc86868

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/clang-17/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9c3f1f590a41fdc86=
869
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre | gcc-12   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff92f57a07d3dbdbc8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/gcc-12/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/gcc-12/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff92f57a07d3dbdbc86=
86e
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff961701e77baedbc86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff961701e77baedbc86=
86a
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9a759ef1a040d5c86865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9a759ef1a040d5c86=
866
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm    | lab-baylibre | gcc-12   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9449673b0bd293c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
tegra_defconfig/gcc-12/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
tegra_defconfig/gcc-12/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9449673b0bd293c86=
857
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9633f6da8a7b2bc86860

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9633f6da8a7b2bc86=
861
        new failure (last pass: next-20240930) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron  | gcc-12   | multi_v7_=
defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9429eca5c105b2c86878

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9429eca5c105b2c86=
879
        failing since 37 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron  | gcc-12   | multi_v7_=
defconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff943d93e8aba3dbc8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff943d93e8aba3dbc86=
86d
        failing since 37 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95568edb7b03b1c8686f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95568edb7b03b1c86=
870
        new failure (last pass: next-20240930) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95d89b165dc2a3c86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95d89b165dc2a3c86=
859
        failing since 35 days (last pass: next-20240828, first fail: next-2=
0240829) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95571d7e380cd9c86874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95571d7e380cd9c86=
875
        new failure (last pass: next-20240930) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9584f4e91e749ac86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9584f4e91e749ac86=
859
        failing since 11 days (last pass: next-20240829, first fail: next-2=
0240923) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95a7fe3900900cc86869

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95a7fe3900900cc86=
86a
        new failure (last pass: next-20240930) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_i386                    | i386   | lab-broonie  | gcc-12   | i386_defc=
onfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff939fb1e629b30cc86871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff939fb1e629b30cc86=
872
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_i386-uefi               | i386   | lab-broonie  | gcc-12   | i386_defc=
onfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff93a0ee3419975dc8686f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/i386=
/i386_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff93a0ee3419975dc86=
870
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv  | lab-broonie  | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9b7398ffdb5d49c86880

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9b7398ffdb5d49c86=
881
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv  | lab-broonie  | gcc-12   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff92af7a07d3dbdbc8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff92af7a07d3dbdbc86=
85e
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_riscv64                 | riscv  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff99a9b7352b0c46c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff99a9b7352b0c46c86=
856
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie  | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9b75ca52e2be87c86871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/clang-17/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9b75ca52e2be87c86=
872
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie  | gcc-12   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff92b19505ae7ad3c8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff92b19505ae7ad3c86=
85e
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_smp8_riscv64            | riscv  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff99b84e7f21cc71c868d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff99b84e7f21cc71c86=
8d4
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie  | gcc-12   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff94e0ebc1d61f01c868ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff94e0ebc1d61f01c86=
8eb
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie  | gcc-12   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff94dfebc1d61f01c868e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff94dfebc1d61f01c86=
8e8
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie  | gcc-12   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff94e4ebc1d61f01c868f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-12 (gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/x86_=
64/x86_64_defconfig+debug/gcc-12/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff94e4ebc1d61f01c86=
8f5
        new failure (last pass: next-20241003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip      | gcc-12   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff90f725f95ca7bec86862

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff90f725f95ca7bec86=
863
        failing since 3 days (last pass: next-20240930, first fail: next-20=
241001) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95f01ea61a521dc8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95f01ea61a521dc86=
85f
        new failure (last pass: next-20240930) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie  | gcc-12   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff974405365f4c1bc8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff974405365f4c1bc86=
86d
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie  | gcc-12   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ffa0bae27b051ab8c8697d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ffa0bae27b051ab8c86=
97e
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie  | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ffb211826f3facfec86a0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ffb211826f3facfec86=
a0b
        new failure (last pass: next-20240930) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie  | gcc-12   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/66ffb37ad5843573b1c8688b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig/gcc-12/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ffb37ad5843573b1c86=
88c
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie  | gcc-12   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ffb3b9afe96384a1c86994

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ffb3b9afe96384a1c86=
995
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff98a71024a706d9c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff98a71024a706d9c86=
856
        failing since 1 day (last pass: next-20240829, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95ca6aef8e6d18c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95ca6aef8e6d18c86=
856
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff973405365f4c1bc86858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff973405365f4c1bc86=
859
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff9b79ca52e2be87c86874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-12/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff9b79ca52e2be87c86=
875
        failing since 1 day (last pass: next-20241001, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre | gcc-12   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff99fc97cd90257ac8687e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm/=
sunxi_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm/=
sunxi_defconfig/gcc-12/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff99fc97cd90257ac86=
87f
        failing since 1 day (last pass: next-20241002, first fail: next-202=
41003) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64  | lab-cip      | gcc-12   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66ff95824ccec6d99ec86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241004/arm6=
4/defconfig+debug/gcc-12/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66ff95824ccec6d99ec86=
856
        failing since 4 days (last pass: next-20240927, first fail: next-20=
240930) =

 =20

