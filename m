Return-Path: <linux-next+bounces-3459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B26961806
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 21:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC7FF1F23FCD
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 19:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692861C57B3;
	Tue, 27 Aug 2024 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="06pXxJvW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92D2E62B
	for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724787037; cv=none; b=PQ4KhiMduAMOL/nMyZhTnc2tq+2/krB3fcs/N4HX0SNHhT38CcIMrvkCEH2J8zEJKvxMjr3TntyNUTmK+5glCP2c0AJ7VXSg2mQPYBAPvUmBSg8BhahGeq0mRjq9A2oNAe3DFf4Z8CWuJze2O4ZPvkWynflGhl+uBYCpTT0SSOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724787037; c=relaxed/simple;
	bh=vOUN0SrHNG6lYsM70QaMYIX0cELTTO7GO9IVwvWplYU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=GTIoEdEpYtX5pXpmkRksCJVesasDrpgSNbiRYLFuIE+1T6S7pT7pf4ysWF42wYeDio3xGxMk9Z0awENXiXwyqpWaWgGPhFDP/OubzL5EG/Yd6jkSsGg/Bga1cGoolVIRwgK2c5hP5HVqW2hCIvWR0vMfo13df9VTaTxEODa2v1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=06pXxJvW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d69e2a88e8so2016350a91.2
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2024 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724787034; x=1725391834; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qEGpcza1w/MxMTKmuG2/iT6/aEG8AFQHr90x+1WRwNM=;
        b=06pXxJvWRwqkuMdS164u1KrC79Kd0w4uirKvRDGRRQLtUwWfRRU49bporqQv49rA+z
         1nqn5MhlTv1gmtTE/42bq8ny1WpqrWTABAw7mmYNcex81YrYRx9H1H4QKCWQPEjzWJPq
         h7F66v7YTDisUSbRz2zFTgtQ38u2PWT1EsWzF1qz2BLnDtbmX0OfVKj0w00iM8f8CKaA
         mmT1gGOE9S6nqA68yZztlRZorDeJWGdpABTerKJNI88vCth6+BlMPdVzO+WyAwT4HjJC
         54arGbElj7+DZZoYSiibyF92DlMLB1adLGpa0yVX45ezV6GYp235R6gvfNLuBA3j9Kjj
         wo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724787034; x=1725391834;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEGpcza1w/MxMTKmuG2/iT6/aEG8AFQHr90x+1WRwNM=;
        b=tarXwYHua5yBiYw/OUCdLMEjA75//HYnRWSkAr8w/Ifyut/0wN4qLhU5WXkHe73GcN
         zFRb26hbx+94TnCe5P7Wrx5otV3PFIp4sRHqls37RXsKRR6js78wAW0o06elNg8f4Auw
         l+92eUkKQvN3uL+bA8h+WGn1gZEem14ui6DCFcnWHdhygT50FG815vub5WdBwuyGcsN8
         r65uO0TqGOC+/T1sCV3h1QDenf6l36BUFpvtWSrcSqWYXuFbG3XAVZM1rShb+qO9GUjH
         PQiolGCU/GXGd8pFXvEiicUfDbPlZ5EN5WtD+1dE4z9YbYQbN5dDWf1Jm+8Bt45cxAfD
         /U+A==
X-Gm-Message-State: AOJu0YxhxykkW+2cI90UeW+nAfLyprQtk8QkYItMpsJZ0nFo1qvh40XK
	BMhn+YLTQiwCgu1NvgeK+mLswcRR/8QBMp+CW9IBfmg5TspP6gvxpyI3iNGX332DkEV58NMWVqt
	kMyU=
X-Google-Smtp-Source: AGHT+IGJyn6sfQHSrS+vCjMhPYL11TCfIHkWjy0TBDSEmNetRPvqocoUyKYABeln5rLEmO7ULW25tg==
X-Received: by 2002:a17:90a:b882:b0:2d3:b438:725f with SMTP id 98e67ed59e1d1-2d82592e2e7mr4584248a91.24.1724787033885;
        Tue, 27 Aug 2024 12:30:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb17d9sm14827095a91.43.2024.08.27.12.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:30:33 -0700 (PDT)
Message-ID: <66ce2959.170a0220.375ea5.c3b3@mx.google.com>
Date: Tue, 27 Aug 2024 12:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240827
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 201 runs, 10 regressions (next-20240827)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 201 runs, 10 regressions (next-20240827)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240827/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240827
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6f923748057a4f6aa187e0d5b22990d633a48d12 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdef6f73f4288348c86855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdef6f73f4288348c86=
856
        failing since 6 days (last pass: next-20240716, first fail: next-20=
240820) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf412e1bd5984a3c8685c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf412e1bd5984a3c86=
85d
        new failure (last pass: next-20240725) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf4a1817c6e13cbc8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf4a1817c6e13cbc86=
85f
        new failure (last pass: next-20240725) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdeffefa37de3d76c86870

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdeffefa37de3d76c86=
871
        new failure (last pass: next-20240719) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf0128b49918dabc8689f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf0128b49918dabc86=
8a0
        new failure (last pass: next-20240719) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre | gcc-12   | defconfig+=
kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf103ce69a1961fc86870

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-sm1-khadas-vim3l.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+kselftest/gcc-12/lab-baylibre/baseline-meson-sm1-khadas-vim3l.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf103ce69a1961fc86=
871
        new failure (last pass: next-20240719) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdee4946144c5d1fc868a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdee4946144c5d1fc86=
8a8
        new failure (last pass: next-20240820) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_riscv64                 | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf1ee0fc9c4ce00c86857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf1ee0fc9c4ce00c86=
858
        failing since 41 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64            | riscv | lab-broonie  | gcc-12   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf356dc4325d8e1c8686c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/risc=
v/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf356dc4325d8e1c86=
86d
        failing since 41 days (last pass: next-20240712, first fail: next-2=
0240716) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/66cdf2e4751c31a575c8686d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240827/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240827/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66cdf2e4751c31a575c86=
86e
        failing since 6 days (last pass: next-20240820, first fail: next-20=
240821) =

 =20

