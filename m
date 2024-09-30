Return-Path: <linux-next+bounces-4011-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C1989DE5
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 11:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961A128617A
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 09:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2635817A5A4;
	Mon, 30 Sep 2024 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Bn2ip87F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C621188006
	for <linux-next@vger.kernel.org>; Mon, 30 Sep 2024 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727687848; cv=none; b=QNxASTVnVxx/mbdca8ndFN2U2dvMzsVrFetgM3DZ6ABhjDw2uN+ESSPZF29JyWQibGWtuQ/OyhGgW1bvCM/v2G9O9wleC3oR5AmnuwZg06d7pA0lLkdgeb5QhXTI3W+AumbXwIfJHU5pOl2Cf5Zz+ENLbpjuUqloxHcx0dU0Xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727687848; c=relaxed/simple;
	bh=wgUJUeFmbOmN4D79noBXIE75uzcgmJULbdy7hfx5GpM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=QDqYOw8AuR0Fo0QHsrYL2wvyRnzR6EmBEIe3zoW/1e7vBS030o+i0R1SJq4JXouzcZ8vysFjkk2Syb42uXhlHE9Mw/fIPGTBIU8aMqeJAZwQWY38Tq9UBNAxQ3aIe8yH2iT1Y0+P+LkYYiCCUTTfI2oBVsm12VdFwHBby/rX4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Bn2ip87F; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b4a0940e3so24807525ad.0
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2024 02:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1727687844; x=1728292644; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HN+CGd4I3lmGlICbj9rUpZJ1kPJvYjKH60S6zQkV/Po=;
        b=Bn2ip87FAucMZEhow58Wsg6tgy7kznZoiqKykxia+gdZAean1Ham3qgDFVYNEtIZrV
         ulBtNp44RqGnV+ZB7dI4eTj75ZO+y8V5CEymdzMQa1ct3VHUttvWlSCYP/WxXq6JyLL6
         17Lzy9Vq3G1n7ARfUDTqXqRcCjhcR/52MWHa4KV6vA3snD9DGvb0RDt3pn6iIP+h8EJu
         hL41b6Ywn4icX1L9FD48Ws6va+fv0Ctl4qjQ1y236cuCM/nRC411gzi572WpqD5ATo3r
         839NuPl8aAtJuEdMRcwY7/l6yN2g5EhvUZLQQic8YnsPmiXMQlfalyg7hZBgVSzw4muf
         e9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687845; x=1728292645;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HN+CGd4I3lmGlICbj9rUpZJ1kPJvYjKH60S6zQkV/Po=;
        b=TJlQbbMU/4TDGfPTqaNInN1AK5CVSuBrR3IhcHKpLKnat4+lsS0u8hWV6o/Ttqh6iZ
         eUgA272VJqNpkjdBRF+m5T5SCUsvMvxRPTZWihaWN4H7VvlOfC1R/3O0hHGF3I0OKn1A
         wQb7L0id2IAztsTckVaymIr5ey/tryRYvrI+MnOCjBtvOvBViC4ouHiGkZJlbuam3f+N
         KhsG0pUqjXyDIrY6c0bwMakFopYy2WQFdSqJi0D2e7HGkrhRxIxr+CtANCO1u7ygULcd
         rGoeAyCrj2R0tQBoV+E/e5I7Dw3Isdu3bh5yl7lag2ElTVTX72R8JnfxGKa/XJ7j+M4c
         ENwg==
X-Gm-Message-State: AOJu0Yz2IIHggclfXaLv0cZf5DAROIpVB8jRK+vliU0MuQX9wlG+FXRE
	T8DGkNUg+43DSjkYaZktVnjjI0AMUDo19b/I0O/sitsWp4d9ArLD+m1PC/OSJC9ga+3/9QJEgP/
	u
X-Google-Smtp-Source: AGHT+IGynBd3Ak5atPcbgOFA3Rqqs7TOSWqU//3QgLdFE7A9xQcpuQXnKcawH/QeHNb/6nRzaFpUzQ==
X-Received: by 2002:a17:902:ec84:b0:20b:8a93:ef04 with SMTP id d9443c01a7336-20b8a93f4ccmr32428125ad.3.1727687844539;
        Mon, 30 Sep 2024 02:17:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e4a63asm50404975ad.218.2024.09.30.02.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:17:24 -0700 (PDT)
Message-ID: <66fa6ca4.170a0220.31437f.1844@mx.google.com>
Date: Mon, 30 Sep 2024 02:17:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20240930
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 173 runs, 4 regressions (next-20240930)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 173 runs, 4 regressions (next-20240930)

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

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =

zynqmp-zcu102                | arm64 | lab-cip     | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240930/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240930
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cea5425829f77e476b03702426f6b3701299b925 =



Test Regressions
---------------- =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66fa364dfb14d0d3dec869d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240930/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240930/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fa364dfb14d0d3dec86=
9d1
        failing since 33 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/66fa364bfb14d0d3dec869cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240930/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240930/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fa364bfb14d0d3dec86=
9ce
        failing since 33 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66fa34a550dfa35b32c8688f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240930/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240930/arm6=
4/defconfig+debug/gcc-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fa34a550dfa35b32c86=
890
        failing since 6 days (last pass: next-20240829, first fail: next-20=
240923) =

 =



platform                     | arch  | lab         | compiler | defconfig  =
                  | regressions
-----------------------------+-------+-------------+----------+------------=
------------------+------------
zynqmp-zcu102                | arm64 | lab-cip     | gcc-12   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/66fa34db7180a2137dc86861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20240930/arm6=
4/defconfig+debug/gcc-12/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240930/arm6=
4/defconfig+debug/gcc-12/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/66fa34db7180a2137dc86=
862
        new failure (last pass: next-20240927) =

 =20

