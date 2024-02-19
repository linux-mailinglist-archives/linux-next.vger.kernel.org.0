Return-Path: <linux-next+bounces-1217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A285A13D
	for <lists+linux-next@lfdr.de>; Mon, 19 Feb 2024 11:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E1EA2812BF
	for <lists+linux-next@lfdr.de>; Mon, 19 Feb 2024 10:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D07325578;
	Mon, 19 Feb 2024 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OXugqhhl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB7225D6
	for <linux-next@vger.kernel.org>; Mon, 19 Feb 2024 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708339485; cv=none; b=jHTZL/jDBc91FSbwxfGWGijZbAs1p6eQfSmwIyX2sMgvMrdOg6FzS0A97/oGMbiEG9rl/1nm23Dth6o+JSi7QH+ciLKP4wmXNY97Kcq8QC7HzAynHeu/LPnHcFSQGu4GlmRM/cEu+NhB/TbQzThFpaAtv2TYzrJ7T4g8KT8ax8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708339485; c=relaxed/simple;
	bh=P0QyKEeKczd6GFC7Fhv+sXWHhAf+I+GgoHK5v9aBSEk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OnyUGRzkGFOnpsCfHxbAVO0eLB5Dnj0fqKvJMlr6z/8Om1OcRdgUN7iBvlzZtQtfwjOUPF3F452MkNQitxv0o7kYIrCK0K/lwhFTIMX5ghRRbRzOpNyRSA7/e6Gy9tryca1gkXXy1WpblFYUsyxUbGvCJns94++AXxyvyGIr0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=OXugqhhl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1db6e0996ceso30004265ad.2
        for <linux-next@vger.kernel.org>; Mon, 19 Feb 2024 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708339480; x=1708944280; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h6aSq3EishVQWwDADj7ehptGuFEZwY46Od2EQW8D4jE=;
        b=OXugqhhl7PHNT6aO5/Fl7PgnDG5OFLdU9V5o8f4ZvRTJ7nSJvruDRJdjIuYga9UeMi
         fqGjw3ex0ZpNrZvfqPN4Q7p/KzFSOQdZx9BNz0WXc1C8OwfPcJjJqgIvdgZNT4yj+MAm
         wu3xj9Up4EMalGlHDrJfEQVNhdFNWazJauSS2hYG5HLXhL4xGmd6aTRXZa81F6PnST7p
         uw4GuD0Vm+8wVKnj2wOrgy1yzuCyImEH1lhwTzp+9Vg3oPiyWgTYqEcdGCdWHkIqy4wX
         Eh4RgBdbS9te1BaHVe/tkfbVtsPCEhejsflQmh287/YFWyTkARAVvoerI57cJTlxX9Bq
         rV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708339480; x=1708944280;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6aSq3EishVQWwDADj7ehptGuFEZwY46Od2EQW8D4jE=;
        b=Yi3iSL5V73KfA+kXIqQmWope6vWZw+lel5tbdqOijxtQatMLZnOL7wnafcQidbMkCP
         VlmHtrL5wMKiIDqTi9Dx1yeXBpWUIYZ2DNgzvIyzqVKDF2s3Fy/Ms8ppJx4LajC4I12F
         d5AaozEdqfodqesvH3cA3vVHWrKNt+XQLS0ZOgE+FXScLmBpgXAoweptSD4OQM+L/sZ6
         bmP0cmev2hG2+V4z2Cor4jZzUWXaWsdYP03GOtf878+S41W975BcWqtJtiULQ8+KftC9
         ZHvIJCVc8JEq7weVRQSbYgWupEm9RzafVf4EEj1ecSbIYS6h9fhJqCihVGonb4ZfLbo7
         7ZiA==
X-Gm-Message-State: AOJu0YzceBiR8h3Yy50DHbeFXAEUY3z0fnkR0bqZrqm8ljCiLarbjIDz
	QgT1y+2r0G28khGtfhUgLEcSLPUvGDVEQKaRxlCnR3vMEbRcQvpD8eKij97g3pqFDGbC3ee9a8r
	e
X-Google-Smtp-Source: AGHT+IGzeYWUVtNlUqTKFvqk7Knqw1YXNJugQkC8UoGAYsIC4Nz+4DvWburlwExboju/PAn1bQwdCw==
X-Received: by 2002:a17:903:491:b0:1db:9759:f716 with SMTP id jj17-20020a170903049100b001db9759f716mr8963216plb.55.1708339479455;
        Mon, 19 Feb 2024 02:44:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s12-20020a170902ea0c00b001d88f0359c1sm4052649plg.278.2024.02.19.02.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:44:38 -0800 (PST)
Message-ID: <65d33116.170a0220.5649d.b670@mx.google.com>
Date: Mon, 19 Feb 2024 02:44:38 -0800 (PST)
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
X-Kernelci-Kernel: next-20240219
X-Kernelci-Report-Type: test
Subject: next/master baseline: 360 runs, 56 regressions (next-20240219)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 360 runs, 56 regressions (next-20240219)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-10   | sama5_defc=
onfig              | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | bcm2835_de=
fconfig            | 1          =

bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                  | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 5          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron   | clang-17 | defconfig =
                   | 2          =

kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =

qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =

r8a7743-iwg20d-q7           | arm   | lab-cip       | gcc-10   | shmobile_d=
efconfig           | 1          =

r8a774a1-hihope-rzg2m-ex    | arm64 | lab-cip       | clang-17 | defconfig =
                   | 1          =

rk3288-rock2-square         | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240219/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240219
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      35a4fdde2466b9d90af297f249436a270ef9d30e =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-10   | sama5_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f3b2375e3d031d637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f3b2375e3d031d637=
013
        failing since 383 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | bcm2835_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f1ad7c3a519206637021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f1ad7c3a519206637=
022
        failing since 259 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b             | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fa979b386abf76637176

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2fa979b386abf76637=
177
        failing since 327 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
jetson-tk1                  | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f47c8bd5b148a6637057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f47c8bd5b148a6637=
058
        failing since 678 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls       | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/65d2f7838ec451f7116370bb

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f7838ec451f7116370c2
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:35.205586  / # #
    2024-02-19T06:38:35.306868  export SHELL=3D/bin/sh
    2024-02-19T06:38:35.307532  #
    2024-02-19T06:38:35.408707  / # export SHELL=3D/bin/sh. /lava-432412/en=
vironment
    2024-02-19T06:38:35.409416  =

    2024-02-19T06:38:35.510821  / # . /lava-432412/environment/lava-432412/=
bin/lava-test-runner /lava-432412/1
    2024-02-19T06:38:35.511756  =

    2024-02-19T06:38:35.518279  / # /lava-432412/bin/lava-test-runner /lava=
-432412/1
    2024-02-19T06:38:35.574950  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-19T06:38:35.575383  + <8>[   20.540016] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432412_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65d2f7838ec451f7116370c6
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:37.683508  /lava-432412/1/../bin/lava-test-case
    2024-02-19T06:38:37.683834  <8>[   22.650205] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-02-19T06:38:37.684054  /lava-432412/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
d2f7838ec451f7116370c8
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:38.747538  /lava-432412/1/../bin/lava-test-case
    2024-02-19T06:38:38.748001  <8>[   23.690111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-02-19T06:38:38.748296  /lava-432412/1/../bin/lava-test-case
    2024-02-19T06:38:38.748515  <8>[   23.708971] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d2f7838ec451f7116370cd
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:39.825168  /lava-432412/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65d2f7838ec451f7116370ce
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:39.828508  <8>[   24.808706] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-19T06:38:40.884023  /lava-432412/1/../bin/lava-test-case
    2024-02-19T06:38:40.884501  <8>[   25.830316] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-02-19T06:38:40.884858  /lava-432412/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron   | clang-17 | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/65d2f7e44538f0dcf86370a5

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f7e44538f0dcf86370ac
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-19T06:40:13.007571  / # #
    2024-02-19T06:40:13.108379  export SHELL=3D/bin/sh
    2024-02-19T06:40:13.108693  #
    2024-02-19T06:40:13.209281  / # export SHELL=3D/bin/sh. /lava-432415/en=
vironment
    2024-02-19T06:40:13.209524  =

    2024-02-19T06:40:13.310048  / # . /lava-432415/environment/lava-432415/=
bin/lava-test-runner /lava-432415/1
    2024-02-19T06:40:13.310660  =

    2024-02-19T06:40:13.319986  / # /lava-432415/bin/lava-test-runner /lava=
-432415/1
    2024-02-19T06:40:13.380534  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-19T06:40:13.380670  + <8>[   21.011469] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 432415_1.5.2.4.5> =

    ... (13 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d2f7e44538f0dcf86370bf
        failing since 69 days (last pass: next-20231208, first fail: next-2=
0231211)

    2024-02-19T06:40:15.823574  /lava-432415/1/../bin/lava-test-case
    2024-02-19T06:40:15.823763  <8>[   23.438696] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-02-19T06:40:15.823870  /lava-432415/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-sl28-var3-ads2      | arm64 | lab-kontron   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/65d2f7818ec451f711637055

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f7818ec451f71163705c
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:32.028110  <8>[   20.502579] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 432409_1.5.2.4.1>
    2024-02-19T06:38:32.133991  / # #
    2024-02-19T06:38:32.236046  export SHELL=3D/bin/sh
    2024-02-19T06:38:32.236808  #
    2024-02-19T06:38:32.338174  / # export SHELL=3D/bin/sh. /lava-432409/en=
vironment
    2024-02-19T06:38:32.338944  =

    2024-02-19T06:38:32.440327  / # . /lava-432409/environment/lava-432409/=
bin/lava-test-runner /lava-432409/1
    2024-02-19T06:38:32.441546  =

    2024-02-19T06:38:32.460921  / # /lava-432409/bin/lava-test-runner /lava=
-432409/1
    2024-02-19T06:38:32.514914  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65d2f7818ec451f71163706f
        failing since 67 days (last pass: next-20231208, first fail: next-2=
0231213)

    2024-02-19T06:38:34.928672  /lava-432409/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7f74d4d194197637030

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7f74d4d194197637=
031
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7ee059eaa4ddf63702e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7ee059eaa4ddf637=
02f
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f0c5d7962cf838637029

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f0c5d7962cf838637=
02a
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7ba5da9e79e8363704e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7ba5da9e79e83637=
04f
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d30017b8da128c0163704a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d30017b8da128c01637=
04b
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2ef8ddb50223c61637047

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2ef8edb50223c61637=
048
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7ea30ab1697aa63701b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7ea30ab1697aa637=
01c
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2       | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fe24771368088663701c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2fe247713680886637=
01d
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7f6059eaa4ddf637036

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7f6059eaa4ddf637=
037
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7ed30ab1697aa63702b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7ed30ab1697aa637=
02c
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f04c014776d7a363701b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f04c014776d7a3637=
01c
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7a65da9e79e83637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7a65da9e79e83637=
015
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2ff9fafe144140a637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2ff9fafe144140a637=
013
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2ef8c96ddc0d529637016

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2ef8c96ddc0d529637=
017
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7ca4538f0dcf8637014

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7ca4538f0dcf8637=
015
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fe177713680886637012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2fe177713680886637=
013
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7e230ab1697aa637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7e230ab1697aa637=
016
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7ec30ab1697aa637025

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7ec30ab1697aa637=
026
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f089d7962cf838637015

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f089d7962cf838637=
016
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f77f8ec451f711637052

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f77f8ec451f711637=
053
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2ff636a4c0b54c4637087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2ff636a4c0b54c4637=
088
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2ef9996ddc0d52963701c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2ef9996ddc0d529637=
01d
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7c98ed72de96b63701e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7c98ed72de96b637=
01f
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3       | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fe237713680886637018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2fe237713680886637=
019
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7bb5da9e79e8363705c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7bb5da9e79e83637=
05d
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7eb30ab1697aa637021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7eb30ab1697aa637=
022
        new failure (last pass: next-20240119) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f01035b010dda963701b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f01035b010dda9637=
01c
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7bd4f1941028f637081

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7bd4f1941028f637=
082
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-broonie   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2ffdbb2c5adc708637098

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2ffdbb2c5adc708637=
099
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2efa196ddc0d529637023

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2efa196ddc0d529637=
024
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f7cb8ed72de96b63703c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f7cb8ed72de96b637=
03d
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64 | lab-collabora | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fe18895d5f5e49637059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2fe18895d5f5e49637=
05a
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7           | arm   | lab-cip       | gcc-10   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f34b3e891280bf637068

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f34b3e891280bf637=
069
        failing since 5 days (last pass: next-20240212, first fail: next-20=
240213) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex    | arm64 | lab-cip       | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fa8c9b386abf7663716b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2fa8c9b386abf76637174
        failing since 175 days (last pass: next-20230710, first fail: next-=
20230828)

    2024-02-19T06:51:41.167174  + set +x
    2024-02-19T06:51:41.170614  <8>[   28.633383] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1095636_1.5.2.4.1>
    2024-02-19T06:51:41.278358  / # #
    2024-02-19T06:51:42.743203  export SHELL=3D/bin/sh
    2024-02-19T06:51:42.764076  #
    2024-02-19T06:51:42.764350  / # export SHELL=3D/bin/sh
    2024-02-19T06:51:44.721090  / # . /lava-1095636/environment
    2024-02-19T06:51:48.325632  /lava-1095636/bin/lava-test-runner /lava-10=
95636/1
    2024-02-19T06:51:48.347191  . /lava-1095636/environment
    2024-02-19T06:51:48.347552  / # /lava-1095636/bin/lava-test-runner /lav=
a-1095636/1 =

    ... (27 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
rk3288-rock2-square         | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f6d6c828597ef7637040

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f6d6c828597ef7637=
041
        failing since 453 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
rk3288-veyron-jaq           | arm   | lab-collabora | gcc-10   | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f55bbfd3527b2f637024

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f55bbfd3527b2f637=
025
        failing since 453 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-orangepi-one-plus | arm64 | lab-clabbe    | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f8bd012d386c3263718e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65d2f8bd012d386c32637=
18f
        new failure (last pass: next-20240216) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f56d3b77e8c339637022

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f56d3b77e8c33963702b
        failing since 257 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-19T06:29:43.687840  + set +x
    2024-02-19T06:29:43.690363  <8>[   14.066000] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3933231_1.5.2.4.1>
    2024-02-19T06:29:43.793393  / # #
    2024-02-19T06:29:43.894369  export SHELL=3D/bin/sh
    2024-02-19T06:29:43.894837  #
    2024-02-19T06:29:43.995738  / # export SHELL=3D/bin/sh. /lava-3933231/e=
nvironment
    2024-02-19T06:29:43.996131  =

    2024-02-19T06:29:44.096916  / # . /lava-3933231/environment/lava-393323=
1/bin/lava-test-runner /lava-3933231/1
    2024-02-19T06:29:44.097463  =

    2024-02-19T06:29:44.139990  / # /lava-3933231/bin/lava-test-runner /lav=
a-3933231/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f5ce7a68286773637094

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f5ce7a6828677363709d
        failing since 257 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-19T06:31:29.509617  / # #
    2024-02-19T06:31:29.612185  export SHELL=3D/bin/sh
    2024-02-19T06:31:29.612980  #
    2024-02-19T06:31:29.714314  / # export SHELL=3D/bin/sh. /lava-3933239/e=
nvironment
    2024-02-19T06:31:29.715154  =

    2024-02-19T06:31:29.816913  / # . /lava-3933239/environment/lava-393323=
9/bin/lava-test-runner /lava-3933239/1
    2024-02-19T06:31:29.818234  =

    2024-02-19T06:31:29.831693  / # /lava-3933239/bin/lava-test-runner /lav=
a-3933239/1
    2024-02-19T06:31:29.911863  + export 'TESTRUN_ID=3D1_bootrr'
    2024-02-19T06:31:29.946076  + cd /lava-3933239/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fa7d9b386abf76637055

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2fa7d9b386abf7663705e
        failing since 257 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-19T06:51:21.130359  <8>[   13.626656] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3933392_1.5.2.4.1>
    2024-02-19T06:51:21.238525  / # #
    2024-02-19T06:51:21.343071  export SHELL=3D/bin/sh
    2024-02-19T06:51:21.344152  #
    2024-02-19T06:51:21.445889  / # export SHELL=3D/bin/sh. /lava-3933392/e=
nvironment
    2024-02-19T06:51:21.446876  =

    2024-02-19T06:51:21.548777  / # . /lava-3933392/environment/lava-393339=
2/bin/lava-test-runner /lava-3933392/1
    2024-02-19T06:51:21.550351  =

    2024-02-19T06:51:21.561621  / # /lava-3933392/bin/lava-test-runner /lav=
a-3933392/1
    2024-02-19T06:51:21.667481  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f5755afccad996637029

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f5755afccad996637032
        failing since 257 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-19T06:29:56.192579  + set +x[   20.799605] <LAVA_SIGNAL_ENDRUN =
0_dmesg 459376_1.5.2.4.1>
    2024-02-19T06:29:56.192905  =

    2024-02-19T06:29:56.300434  / # #
    2024-02-19T06:29:56.401996  export SHELL=3D/bin/sh
    2024-02-19T06:29:56.402571  #
    2024-02-19T06:29:56.503587  / # export SHELL=3D/bin/sh. /lava-459376/en=
vironment
    2024-02-19T06:29:56.504128  =

    2024-02-19T06:29:56.605121  / # . /lava-459376/environment/lava-459376/=
bin/lava-test-runner /lava-459376/1
    2024-02-19T06:29:56.605949  =

    2024-02-19T06:29:56.608751  / # /lava-459376/bin/lava-test-runner /lava=
-459376/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2f5d9ac65bf2ee1637040

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2f5d9ac65bf2ee1637049
        failing since 257 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-02-19T06:31:36.424828  + set +x
    2024-02-19T06:31:36.426597  [   23.038227] <LAVA_SIGNAL_ENDRUN 0_dmesg =
459378_1.5.2.4.1>
    2024-02-19T06:31:36.534870  / # #
    2024-02-19T06:31:36.636513  export SHELL=3D/bin/sh
    2024-02-19T06:31:36.637075  #
    2024-02-19T06:31:36.738050  / # export SHELL=3D/bin/sh. /lava-459378/en=
vironment
    2024-02-19T06:31:36.738567  =

    2024-02-19T06:31:36.839558  / # . /lava-459378/environment/lava-459378/=
bin/lava-test-runner /lava-459378/1
    2024-02-19T06:31:36.840458  =

    2024-02-19T06:31:36.842944  / # /lava-459378/bin/lava-test-runner /lava=
-459378/1 =

    ... (12 line(s) more)  =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65d2fa9f9b386abf76637179

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240219/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65d2fa9f9b386abf76637182
        failing since 257 days (last pass: next-20230517, first fail: next-=
20230607)

    2024-02-19T06:51:52.220628  + set +x[   19.114722] <LAVA_SIGNAL_ENDRUN =
0_dmesg 459395_1.5.2.4.1>
    2024-02-19T06:51:52.220955  =

    2024-02-19T06:51:52.329238  / # #
    2024-02-19T06:51:52.431047  export SHELL=3D/bin/sh
    2024-02-19T06:51:52.431753  #
    2024-02-19T06:51:52.532804  / # export SHELL=3D/bin/sh. /lava-459395/en=
vironment
    2024-02-19T06:51:52.533400  =

    2024-02-19T06:51:52.634411  / # . /lava-459395/environment/lava-459395/=
bin/lava-test-runner /lava-459395/1
    2024-02-19T06:51:52.635364  =

    2024-02-19T06:51:52.638134  / # /lava-459395/bin/lava-test-runner /lava=
-459395/1 =

    ... (12 line(s) more)  =

 =20

