Return-Path: <linux-next+bounces-1258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6385DC66
	for <lists+linux-next@lfdr.de>; Wed, 21 Feb 2024 14:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8F32855EC
	for <lists+linux-next@lfdr.de>; Wed, 21 Feb 2024 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFF97BB0B;
	Wed, 21 Feb 2024 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="svjpIHCJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505576C99
	for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523570; cv=none; b=oW1rwBSAlUwaiEz6rfRO2D1fcgDlY2W5FhyYcD8lJM2rqYnS/uZ1hlIj13j2U1CjqZMrRsu++StJ+VppKNBTlRvMRTFyRO9kRljbvk83vk17tsM6UDTaBpAzvl3OjfSOF+eNfy8DDBFjHJduL7V2lhCfuM8zM8qnzITK5QvJpRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523570; c=relaxed/simple;
	bh=+NrbazxuwOi1MQXO/34LzsdJyGqg45ffqcB2SqdDTN0=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=c7cCIWCsZJrK8DNFadGasoJqqdn4tZKcHsTHN3Tt+oIhDAgsAqDJYTfIQ8TONLD1Srw+LKUjccFocFa9eXi3y5n+WPWQG6TjKJFq9TR5fQXE3b1LGmYxtbO/1quUHVU2YywV7npWgreA8PE7Jgekb43ikZsFQ+MZ+q3frQ7h8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=svjpIHCJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso5617149b3a.2
        for <linux-next@vger.kernel.org>; Wed, 21 Feb 2024 05:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708523565; x=1709128365; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK/xW+cFSYJKg7iNskZJCyeL1/a0Bc8Fu00Vwp+8oKk=;
        b=svjpIHCJvE0ed2Fabbep+KLaIKsZT685Gop1AI7I7m7w0AMXGJcApeD1tcV5lk3qip
         b5Ks2n5GvqWpEx03R/YwPUP02vW/29JDicA5r0sc1rS1gWElmPyZ83zzYxJssgxqxYLl
         dR9k39MAKY9MlIZmJkHySvsfUAvMmC6p8z9ODVtYcHpqMh1u6rqfC7TJXySdDNlm7u4r
         ewq+wg1W5b2TTGoCgpJPtNXt8qE4SQwMRk6uQfjR2RlDUmRoEj7c+RxDRUBPREJ0kau4
         j65FcTiNiQUAIcI1R5n6ehAmCUjNbAYPHli33vX7Mih4hvFPZdRYF6Vlq7PLmjj6pUP6
         UzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708523565; x=1709128365;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK/xW+cFSYJKg7iNskZJCyeL1/a0Bc8Fu00Vwp+8oKk=;
        b=W1V6KzNi191iUZM86GJtlaeo5uURTij7gjXWmuExkTv/CXRrK8oW3hthl+k/eqGcvu
         j4X9MaWPygi+twDANTTnklkFBTwckmoP/EY3VBcyz7JkThF5aYX5DE7daz/wjChUZKLm
         ZT5Gu7t5z3pYK0g7Y4vXLlaw1ox314njaYA6fTQt2ObYGEL80e35Jo4LchRZ3ca092s8
         2215hHzJUVgJ0H/yJTjHLJTUXLQ+B9MJR1xhqfQQGYLOlzsfe8aoukkAlQjP6XRbmVe2
         dTpdOYT9OfQTL/fjkGiiqkWGUd+gAbOKCtmB/xHjNJwHHry2X/yrXdaqcGtyPIlMn1jT
         bbQw==
X-Gm-Message-State: AOJu0YysFG/D4wWAiLlxvQVULowYm8e2OL92tBxd58iuk34wCvIR8qm8
	mwszuTXeoCvGxjclGAhDW4Ope4dCP7SG3fxJUi7NXFSZ9LarEknOo9h5tdLYKpjtiRIYWu/8kI6
	WrGo=
X-Google-Smtp-Source: AGHT+IGeoHhdAViXmILa08rOU/f8cUJt/OvtjxlXEvzlAq3eGZQEMrsVVjQ+NxgXE3wmxbW0jU00sg==
X-Received: by 2002:a05:6a21:1014:b0:1a0:c655:723 with SMTP id nk20-20020a056a21101400b001a0c6550723mr1240237pzb.29.1708523564002;
        Wed, 21 Feb 2024 05:52:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090adb5100b0029a04d96d02sm1559684pjx.11.2024.02.21.05.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:52:43 -0800 (PST)
Message-ID: <65d6002b.170a0220.1f0d.3a5e@mx.google.com>
Date: Wed, 21 Feb 2024 05:52:43 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20240221
X-Kernelci-Report-Type: test
Subject: next/master baseline: 399 runs, 49 regressions (next-20240221)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 399 runs, 49 regressions (next-20240221)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+debug              | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+kselftest          | 1          =

imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+kselftest          | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+kselftest          | 2          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240221/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240221
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4893c639cc3659cefaa675bf1e59f4e7571afb5c =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c06b310420fd2663705f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c06b310420fd26637=
060
        failing since 261 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5be003cd44057966370d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5be003cd4405796637=
0d1
        failing since 329 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5be1d17de2e5b65637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5be1d17de2e5b65637=
013
        new failure (last pass: next-20240220) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c31c05671bd34d63704a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c31c05671bd34d637=
04b
        new failure (last pass: next-20240219) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c3e4ab1474a98663704c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c3e4ab1474a986637=
04d
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64 | lab-pengutronix | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c4c03a71d9aab463701f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c4c03a71d9aab4637=
020
        new failure (last pass: next-20240220) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c58225666fd9b9637027

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c58225666fd9b9637=
028
        failing since 103 days (last pass: next-20231103, first fail: next-=
20231110) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-j721e-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c55afec98246c0637053

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c55afec98246c0637=
054
        failing since 110 days (last pass: next-20231025, first fail: next-=
20231103) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65d5c39bf7b4ed3ad9637021

  Results:     89 PASS, 6 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65d5c39bf7b4ed3=
ad9637025
        new failure (last pass: next-20240219)
        13 lines

    2024-02-21T09:34:00.465485  kern  :alert : Unable to handle kernel pagi=
ng request at virtual<8>[   20.403194] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>
    2024-02-21T09:34:00.465579   address ffff801ffd92d000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65d5c39bf7b4ed3=
ad9637026
        new failure (last pass: next-20240219)
        2 lines

    2024-02-21T09:34:00.505725  kern  :alert : Mem abort info:
    2024-02-21T09:34:00.505924  kern  :alert :   ESR =3D 0x0000000096000005
    2024-02-21T09:34:00.506233  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-02-21T09:34:00.506335  kern  :alert :   SET =3D 0, FnV<8>[   20.42=
8732] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D2>
    2024-02-21T09:34:00.506441   =3D 0
    2024-02-21T09:34:00.506537  kern  :ale<8>[   20.439703] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 433090_1.5.2.4.1>
    2024-02-21T09:34:00.506630  rt :   EA =3D 0, S1PTW =3D 0
    2024-02-21T09:34:00.506720  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2024-02-21T09:34:00.506810  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c502f49d17eb1b637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c502f49d17eb1b637=
013
        failing since 68 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65d5c57b557a92723c637017

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c57b557a92723c63701e
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:06.554586  / # #
    2024-02-21T09:42:06.656318  export SHELL=3D/bin/sh
    2024-02-21T09:42:06.657092  #
    2024-02-21T09:42:06.758466  / # export SHELL=3D/bin/sh. /lava-433109/en=
vironment
    2024-02-21T09:42:06.759147  =

    2024-02-21T09:42:06.860333  / # . /lava-433109/environment/lava-433109/=
bin/lava-test-runner /lava-433109/1
    2024-02-21T09:42:06.861479  =

    2024-02-21T09:42:06.902262  / # /lava-433109/bin/lava-test-runner /lava=
-433109/1
    2024-02-21T09:42:06.924336  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:42:06.924709  + <8>[   20.624066] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433109_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d5c57b557a92723c637022
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:09.034056  /lava-433109/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d5c57b557a92723c637024
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:10.093917  /lava-433109/1/../bin/lava-test-case
    2024-02-21T09:42:10.094325  <8>[   23.774424] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-21T09:42:10.094568  /lava-433109/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d5c57b557a92723c637029
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:11.171810  /lava-433109/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d5c57b557a92723c63702a
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:11.174239  <8>[   24.889650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T09:42:12.230180  /lava-433109/1/../bin/lava-test-case
    2024-02-21T09:42:12.230316  <8>[   25.911499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-21T09:42:12.230404  /lava-433109/1/../bin/lava-test-case
    2024-02-21T09:42:12.230477  <8>[   25.929394] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-21T09:42:12.230547  /lava-433109/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65d5c5df448dc3d3b263707a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c5df448dc3d3b2637081
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:43:36.566155  / # #
    2024-02-21T09:43:36.667183  export SHELL=3D/bin/sh
    2024-02-21T09:43:36.667830  #
    2024-02-21T09:43:36.769196  / # export SHELL=3D/bin/sh. /lava-433121/en=
vironment
    2024-02-21T09:43:36.769645  =

    2024-02-21T09:43:36.870860  / # . /lava-433121/environment/lava-433121/=
bin/lava-test-runner /lava-433121/1
    2024-02-21T09:43:36.871465  =

    2024-02-21T09:43:36.879845  / # /lava-433121/bin/lava-test-runner /lava=
-433121/1
    2024-02-21T09:43:36.936562  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:43:36.937150  + <8>[   20.715674] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433121_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d5c5df448dc3d3b2637085
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:43:39.043347  /lava-433121/1/../bin/lava-test-case
    2024-02-21T09:43:39.043568  <8>[   22.825360] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-21T09:43:39.043706  /lava-433121/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d5c5df448dc3d3b2637087
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:43:40.101656  /lava-433121/1/../bin/lava-test-case
    2024-02-21T09:43:40.101807  <8>[   23.864188] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-21T09:43:40.101902  /lava-433121/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d5c5df448dc3d3b263708c
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:43:41.177909  /lava-433121/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d5c5df448dc3d3b263708d
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:43:41.180980  <8>[   24.977149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T09:43:42.235716  /lava-433121/1/../bin/lava-test-case
    2024-02-21T09:43:42.235854  <8>[   25.999096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-21T09:43:42.235920  /lava-433121/1/../bin/lava-test-case
    2024-02-21T09:43:42.235976  <8>[   26.016766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-21T09:43:42.236032  /lava-433121/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c52aeb2838810b637054

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c52aeb2838810b637=
055
        failing since 68 days (last pass: next-20231205, first fail: next-2=
0231215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65d5c58f557a92723c63707f

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c58f557a92723c637086
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:15.693710  / # #
    2024-02-21T09:42:15.794513  export SHELL=3D/bin/sh
    2024-02-21T09:42:15.794806  #
    2024-02-21T09:42:15.895342  / # export SHELL=3D/bin/sh. /lava-433110/en=
vironment
    2024-02-21T09:42:15.895616  =

    2024-02-21T09:42:15.996160  / # . /lava-433110/environment/lava-433110/=
bin/lava-test-runner /lava-433110/1
    2024-02-21T09:42:15.996606  =

    2024-02-21T09:42:16.008122  / # /lava-433110/bin/lava-test-runner /lava=
-433110/1
    2024-02-21T09:42:16.049916  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:42:16.069027  + <8>[   20.967292] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433110_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d5c58f557a92723c637099
        failing since 71 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-02-21T09:42:18.502733  /lava-433110/1/../bin/lava-test-case
    2024-02-21T09:42:18.503172  <8>[   23.392237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T09:42:18.503480  /lava-433110/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65d5c607b506f4aca8637013

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c607b506f4aca863701a
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:44:18.373673  / # #
    2024-02-21T09:44:18.475601  export SHELL=3D/bin/sh
    2024-02-21T09:44:18.476357  #
    2024-02-21T09:44:18.577424  / # export SHELL=3D/bin/sh. /lava-433120/en=
vironment
    2024-02-21T09:44:18.578116  =

    2024-02-21T09:44:18.679397  / # . /lava-433120/environment/lava-433120/=
bin/lava-test-runner /lava-433120/1
    2024-02-21T09:44:18.680378  =

    2024-02-21T09:44:18.687692  / # /lava-433120/bin/lava-test-runner /lava=
-433120/1
    2024-02-21T09:44:18.753612  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:44:18.754094  + <8>[   20.885210] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 433120_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d5c607b506f4aca863702d
        failing since 70 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-21T09:44:21.182763  /lava-433120/1/../bin/lava-test-case
    2024-02-21T09:44:21.183424  <8>[   23.306155] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-21T09:44:21.183678  /lava-433120/1/../bin/lava-test-case
    2024-02-21T09:44:21.183935  <8>[   23.323943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2024-02-21T09:44:21.184183  /lava-433120/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c0ecc0a92c872963701e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c0ecc0a92c8729637=
01f
        failing since 62 days (last pass: next-20231115, first fail: next-2=
0231220) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c5051e499854b2637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c5051e499854b2637=
019
        new failure (last pass: next-20240212) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c5e6ab79ce65e5637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c5e6ab79ce65e5637=
019
        failing since 379 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c492be1bdefcbc637031

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c492be1bdefcbc637=
032
        failing since 379 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c4b38c80e8a6ac63702d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c4b38c80e8a6ac637=
02e
        failing since 379 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5beb79920a1f01a63709c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5beb79920a1f01a637=
09d
        new failure (last pass: next-20240220) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5beb664732f638163703b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5beb664732f6381637=
03c
        new failure (last pass: next-20240220) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5beca6e273cd62c637021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5beca6e273cd62c637=
022
        new failure (last pass: next-20240220) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c86421a655815e63709b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c86421a655815e637=
09c
        failing since 7 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/65d5c4cd5a97d0d655637022

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65d5c4cd5a97d0d=
655637025
        new failure (last pass: next-20240212)
        2 lines

    2024-02-21T09:38:54.890922  kern  :alert : [006b6b6bd6d6d6d6] address b=
etween user and kernel address ranges
    2024-02-21T09:38:54.937871  kern  :emerg : Internal error: Oops: 000000=
0096000004 [#1] PREEMPT SMP
    2024-02-21T09:38:54.940532  kern  :emerg : Code: b4000113 b940be60 f940=
6261 8b000022 (38606820) =

    2024-02-21T09:38:54.987849  <8>[  175.230785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2024-02-21T09:38:54.988386  + set +x
    2024-02-21T09:38:54.988744  <8>[  175.246452] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1096498_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/65d5c4cd5a97d0d=
655637026
        new failure (last pass: next-20240212)
        12 lines

    2024-02-21T09:38:54.851738  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 006b6b6bd6d6d6d6
    2024-02-21T09:38:54.852244  kern  :alert : Mem abort info:
    2024-02-21T09:38:54.852597  kern  :alert :   ESR =3D 0x0000000096000004
    2024-02-21T09:38:54.852925  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2024-02-21T09:38:54.853246  kern  :alert :   SET =3D 0, FnV =3D 0
    2024-02-21T09:38:54.853551  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2024-02-21T09:38:54.853845  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2024-02-21T09:38:54.854148  kern  :alert : Data abort info:
    2024-02-21T09:38:54.887906  kern  :alert <8>[  175.129803] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2024-02-21T09:38:54.888441  :   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D=
 0x00000000 =

    ... (2 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c4c65a97d0d655637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c4c65a97d0d655637=
013
        failing since 131 days (last pass: next-20230125, first fail: next-=
20231013) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c476475294d718637074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c476475294d718637=
075
        failing since 376 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c4a38c80e8a6ac637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d5c4a38c80e8a6ac637=
013
        failing since 376 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5cbcc28f7e1e65a63704e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5cbcc28f7e1e65a637057
        failing since 259 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-21T10:08:53.792627  / # #
    2024-02-21T10:08:53.895012  export SHELL=3D/bin/sh
    2024-02-21T10:08:53.895881  #
    2024-02-21T10:08:53.997273  / # export SHELL=3D/bin/sh. /lava-3935774/e=
nvironment
    2024-02-21T10:08:53.998115  =

    2024-02-21T10:08:54.099662  / # . /lava-3935774/environment/lava-393577=
4/bin/lava-test-runner /lava-3935774/1
    2024-02-21T10:08:54.100849  =

    2024-02-21T10:08:54.106197  / # /lava-3935774/bin/lava-test-runner /lav=
a-3935774/1
    2024-02-21T10:08:54.242879  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T10:08:54.243569  + cd /lava-3935774/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | clang-17 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5cbd128f7e1e65a637059

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5cbd128f7e1e65a637062
        failing since 259 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-21T10:09:06.166620  + set +x
    2024-02-21T10:09:06.168360  [   20.764036] <LAVA_SIGNAL_ENDRUN 0_dmesg =
459793_1.5.2.4.1>
    2024-02-21T10:09:06.277682  / # #
    2024-02-21T10:09:06.379464  export SHELL=3D/bin/sh
    2024-02-21T10:09:06.380275  #
    2024-02-21T10:09:06.481545  / # export SHELL=3D/bin/sh. /lava-459793/en=
vironment
    2024-02-21T10:09:06.482346  =

    2024-02-21T10:09:06.583646  / # . /lava-459793/environment/lava-459793/=
bin/lava-test-runner /lava-459793/1
    2024-02-21T10:09:06.584870  =

    2024-02-21T10:09:06.587514  / # /lava-459793/bin/lava-test-runner /lava=
-459793/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5bde03cd4405796637013

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5bde03cd440579663701c
        failing since 259 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-21T09:09:36.957726  / # #
    2024-02-21T09:09:37.060400  export SHELL=3D/bin/sh
    2024-02-21T09:09:37.061143  #
    2024-02-21T09:09:37.162397  / # export SHELL=3D/bin/sh. /lava-3935405/e=
nvironment
    2024-02-21T09:09:37.163284  =

    2024-02-21T09:09:37.264733  / # . /lava-3935405/environment/lava-393540=
5/bin/lava-test-runner /lava-3935405/1
    2024-02-21T09:09:37.266079  =

    2024-02-21T09:09:37.281418  / # /lava-3935405/bin/lava-test-runner /lav=
a-3935405/1
    2024-02-21T09:09:37.401105  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:09:37.401713  + cd /lava-3935405/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c3014a67455cab6370b7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c3014a67455cab6370c0
        failing since 259 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-21T09:31:27.100180  <8>[   15.714451] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2024-02-21T09:31:27.100382  + set +x
    2024-02-21T09:31:27.100572  <8>[   15.725159] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3935610_1.5.2.4.1>
    2024-02-21T09:31:27.204541  / # #
    2024-02-21T09:31:27.305612  export SHELL=3D/bin/sh
    2024-02-21T09:31:27.305986  #
    2024-02-21T09:31:27.406823  / # export SHELL=3D/bin/sh. /lava-3935610/e=
nvironment
    2024-02-21T09:31:27.407245  =

    2024-02-21T09:31:27.508261  / # . /lava-3935610/environment/lava-393561=
0/bin/lava-test-runner /lava-3935610/1
    2024-02-21T09:31:27.509788   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c5aeae3a24f5c5637041

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c5aeae3a24f5c563704a
        failing since 259 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-21T09:42:46.892235  / # #
    2024-02-21T09:42:46.993582  export SHELL=3D/bin/sh
    2024-02-21T09:42:46.994041  #
    2024-02-21T09:42:47.094791  / # export SHELL=3D/bin/sh. /lava-3935720/e=
nvironment
    2024-02-21T09:42:47.095264  =

    2024-02-21T09:42:47.196089  / # . /lava-3935720/environment/lava-393572=
0/bin/lava-test-runner /lava-3935720/1
    2024-02-21T09:42:47.196902  =

    2024-02-21T09:42:47.239908  / # /lava-3935720/bin/lava-test-runner /lav=
a-3935720/1
    2024-02-21T09:42:47.327364  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-21T09:42:47.327821  + cd /lava-3935720/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c03ffc474d8ea763705a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c03ffc474d8ea7637063
        failing since 259 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-21T09:19:40.074246  + set +x[   20.687990] <LAVA_SIGNAL_ENDRUN =
0_dmesg 459737_1.5.2.4.1>
    2024-02-21T09:19:40.074628  =

    2024-02-21T09:19:40.183503  / # #
    2024-02-21T09:19:40.285257  export SHELL=3D/bin/sh
    2024-02-21T09:19:40.285941  #
    2024-02-21T09:19:40.387067  / # export SHELL=3D/bin/sh. /lava-459737/en=
vironment
    2024-02-21T09:19:40.387743  =

    2024-02-21T09:19:40.488838  / # . /lava-459737/environment/lava-459737/=
bin/lava-test-runner /lava-459737/1
    2024-02-21T09:19:40.489804  =

    2024-02-21T09:19:40.492326  / # /lava-459737/bin/lava-test-runner /lava=
-459737/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c3609b1c3a4a126370b4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c3609b1c3a4a126370bd
        failing since 259 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-21T09:32:41.742354  + set +x
    2024-02-21T09:32:41.744085  [   22.531067] <LAVA_SIGNAL_ENDRUN 0_dmesg =
459767_1.5.2.4.1>
    2024-02-21T09:32:41.851529  / # #
    2024-02-21T09:32:41.952978  export SHELL=3D/bin/sh
    2024-02-21T09:32:41.953540  #
    2024-02-21T09:32:42.054350  / # export SHELL=3D/bin/sh. /lava-459767/en=
vironment
    2024-02-21T09:32:42.054932  =

    2024-02-21T09:32:42.156506  / # . /lava-459767/environment/lava-459767/=
bin/lava-test-runner /lava-459767/1
    2024-02-21T09:32:42.157314  =

    2024-02-21T09:32:42.159838  / # /lava-459767/bin/lava-test-runner /lava=
-459767/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5c693b1d3186d6c637035

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d5c693b1d3186d6c63703e
        failing since 259 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-21T09:46:39.215109  + set +x[   19.036063] <LAVA_SIGNAL_ENDRUN =
0_dmesg 459781_1.5.2.4.1>
    2024-02-21T09:46:39.215399  =

    2024-02-21T09:46:39.322915  / # #
    2024-02-21T09:46:39.424376  export SHELL=3D/bin/sh
    2024-02-21T09:46:39.424877  #
    2024-02-21T09:46:39.525805  / # export SHELL=3D/bin/sh. /lava-459781/en=
vironment
    2024-02-21T09:46:39.526284  =

    2024-02-21T09:46:39.627194  / # . /lava-459781/environment/lava-459781/=
bin/lava-test-runner /lava-459781/1
    2024-02-21T09:46:39.627958  =

    2024-02-21T09:46:39.634101  / # /lava-459781/bin/lava-test-runner /lava=
-459781/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d5be5d340d546e31637064

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240221/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/65d5be5d340d546=
e31637067
        new failure (last pass: next-20240220)
        1 lines

    2024-02-21T09:11:39.527494  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#3 stuck for 44s! [kworker/u16:2:57]
    2024-02-21T09:11:39.735486  <8>[  113.662747][  T197] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =20

