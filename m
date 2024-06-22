Return-Path: <linux-next+bounces-2640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB291312F
	for <lists+linux-next@lfdr.de>; Sat, 22 Jun 2024 02:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445931F2369A
	for <lists+linux-next@lfdr.de>; Sat, 22 Jun 2024 00:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA5615CB;
	Sat, 22 Jun 2024 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qf0cpFag"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD01392
	for <linux-next@vger.kernel.org>; Sat, 22 Jun 2024 00:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719016480; cv=none; b=gOx8CP1hrcPNgUzSFEZ4EoAVRTna8soALeaAMsvppqZdlWGnQRXXgxYzQePzZdXTGVcjVnoKa0YKpVS3hRxvgf1Z7Xir8/Q3E8r0CakA/axTziWYlPST4xAivSDfOWG2NV4XPhlnGbFqRzhK9zaiO8ZxXKlO4YnlHYx43IMNJOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719016480; c=relaxed/simple;
	bh=ShCa7+YoMGB/aCctfgHEKA7IhMcS44DQE+NIvD0SMtk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=JkibhcSdxpN1OzObzUykGTWX+t4XXe8WIfLxTPSL6ZLt2tKWgb3kl1OyI6uZAbdgFZfFIcCCMQVuOJ/n5OzpSpN2eTLSXIU4mqUhS45B5zv4woRQswwR3Ye7N8wEVX05c8AehwSDj/rQo4rAiiUT3WnxC8y+I1k6sTpId187+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qf0cpFag; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c19d338401so1304654eaf.0
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 17:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719016475; x=1719621275; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x1DRdGjJVuhBnD1SpI+Yr/ezz9xF6fbbfV2tgWOrRWM=;
        b=qf0cpFag8CxIVckqfcU+0s2ORISi6bG1G/vHoGw6gLH22AfpWqQgJxlu/bQlHog6bZ
         RScN3OI+YDXcvP2l0W1tPdCNOmcZSk/bDmjqOsKiCeoEJDRUKCZAGtSXv1ZjvRuxFENi
         LC4jbCfcyYIeqLnzYs7muLnHqK3ZEg+GtZZxNhaDgXwJs58Da6mQheqB+yChfj2vjG3a
         Es6Y8OrNNXw02R0TTX1dELO6HaSGIvdqnc+XETAMCN/ZcXJ5pRoF0SuUcVvmxklBFWp/
         xdneSw5v5n5u0KhPoa0LknQQ+r8AidB8V37WT1p5O4u9/tfIYmEbymg1awQHbHHVz5gz
         8w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719016475; x=1719621275;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1DRdGjJVuhBnD1SpI+Yr/ezz9xF6fbbfV2tgWOrRWM=;
        b=tbiFmZcjhSBngPLRZ+G2JpLejxpCCn956pDiTKi8kYUg1FsYXNBLP3va0yXSnHz1VA
         rs85Mio06psZV84PZjh+Ttrz9WPaRJK659Dv7r6Im4i3gGh8Aexin6DWLWZwX2jVby6t
         YTU6K95v23/rQab5U1B2eNm9vW66a4rgkETA3WbLW01nq5GcgeL7UHsNobqj/c32YNoO
         rTIuVUgthJh8Oc0vG310HnN9hbCJPE8MBvvgRz3d/5k2m7inu0kNUJdlUpgJnloBfHht
         RPngwrzxbULxv9Fb0Bgd+sn3a9ysOuTn65lKPs9mz5+iDDk4E2NbeL46fceqoOKs0o7D
         kceQ==
X-Gm-Message-State: AOJu0Yy/+qc3EGEvFBiGfoa0Tv83Tdk+7kQzhU5kzu3rkeg7Of0CJziT
	5/DEBpYUWr3owENxH+zeULhfVUfD9SW3tjV4lElSdJmwr8OfwkjFfXUvnX86HBUFN6sNHKLT6gm
	tkfY=
X-Google-Smtp-Source: AGHT+IFtbEvkxde46wudtk36dMKgQVKeUX3vqz+5f5yG7XQDwuU00VdGTl/CMLh2O4C2bX7It5Yj0g==
X-Received: by 2002:a05:6870:a101:b0:254:ad5e:da49 with SMTP id 586e51a60fabf-25c94d05a5cmr10327317fac.41.1719016474736;
        Fri, 21 Jun 2024 17:34:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70651194776sm2013950b3a.67.2024.06.21.17.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 17:34:34 -0700 (PDT)
Message-ID: <66761c1a.050a0220.50102.67e9@mx.google.com>
Date: Fri, 21 Jun 2024 17:34:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20240621
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 296 runs, 35 regressions (next-20240621)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 296 runs, 35 regressions (next-20240621)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cp514-2h-1130g7-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240621/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240621
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f76698bd9a8ca01d3581236082d786e9a6b72bb7 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e70e03e311f8397e7098

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e70e03e311f8397e7=
099
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e56749907ad53c7e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e56749907ad53c7e7=
08b
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e52f51ffbda1867e70d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cbv514-1h-34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cbv514-1h-34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e52f51ffbda1867e7=
0d5
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e52d51ffbda1867e70cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e52d51ffbda1867e7=
0d0
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e53351ea1ca6c87e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi5-brask.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
chromebox-cxi5-brask.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e53351ea1ca6c87e7=
06e
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-2h-1130g7-volteer | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e54951ea1ca6c87e708a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-2h-1130g7-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-2h-1130g7-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e54951ea1ca6c87e7=
08b
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e55f49907ad53c7e707e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-3wh-r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-acer-=
cp514-3wh-r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e55f49907ad53c7e7=
07f
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e52a51ffbda1867e7086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e52a51ffbda1867e7=
087
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e54851ea1ca6c87e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e54851ea1ca6c87e7=
085
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e53551ffbda1867e70db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e53551ffbda1867e7=
0dc
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e62d7a03a0de887e7075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-asus-=
CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e62d7a03a0de887e7=
076
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6675dc4374c5ae63587e736b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675dc4374c5ae63587e7=
36c
        failing since 506 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e30c2a6eab9dc57e70a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e30c2a6eab9dc57e7=
0a2
        failing since 382 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e50f362da091117e7073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e50f362da091117e7=
074
        new failure (last pass: next-20240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6675eb2c80f9346cfe7e7096

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675eb2c80f9346c=
fe7e709b
        new failure (last pass: next-20240620)
        1 lines

    2024-06-21T21:05:32.565123  / # =

    2024-06-21T21:05:32.575141  =

    2024-06-21T21:05:32.680720  / # #
    2024-06-21T21:05:32.686838  #
    2024-06-21T21:05:32.829397  / # export SHELL=3D/bin/sh
    2024-06-21T21:05:32.846812  export SHELL=3D/bin/sh
    2024-06-21T21:05:32.948167  / # . /lava-1154154/environment
    2024-06-21T21:05:32.959030  . /lava-1154154/environment
    2024-06-21T21:05:33.061141  / # /lava-1154154/bin/lava-test-runner /lav=
a-1154154/0
    2024-06-21T21:05:33.070947  /lava-1154154/bin/lava-test-runner /lava-11=
54154/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e5dd78247774857e70e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e5dd78247774857e7=
0e1
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e5b704fe74be307e7108

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-dell-=
latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e5b704fe74be307e7=
109
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e55249907ad53c7e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-11=
A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e55249907ad53c7e7=
078
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e5812a4eaca3837e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-14=
-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e5812a4eaca3837e7=
085
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e64e7ca527b3367e7077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e64e7ca527b3367e7=
078
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e6a30671a30cc57e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e6a30671a30cc57e7=
085
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e56349907ad53c7e7084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-hp-x3=
60-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e56349907ad53c7e7=
085
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e80df921e5265e7e70a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e80df921e5265e7e7=
0a2
        failing since 93 days (last pass: next-20240315, first fail: next-2=
0240320) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...rd+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e5d578247774857e70dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-lenov=
o-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/x86_=
64/x86_64_defconfig+x86-board+kselftest/gcc-10/lab-collabora/baseline-lenov=
o-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e5d578247774857e7=
0dd
        failing since 1 day (last pass: next-20240619, first fail: next-202=
40620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6675dfb74cc8f613ee7e706d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675dfb74cc8f613ee7e7=
06e
        new failure (last pass: next-20240620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e237c9f861f3667e70e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e237c9f861f3667e7=
0e1
        new failure (last pass: next-20240619) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e078246f3af3827e706e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6675e078246f3af3827e7=
06f
        failing since 92 days (last pass: next-20240315, first fail: next-2=
0240321) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e05d8b8ee03ea67e7077

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675e05d8b8ee03e=
a67e707c
        failing since 14 days (last pass: next-20240606, first fail: next-2=
0240607)
        28 lines

    2024-06-21T20:19:05.828066  / # =

    2024-06-21T20:19:05.955964  / # #
    2024-06-21T20:19:06.066975  / # export SHELL=3D/bin/sh
    2024-06-21T20:19:06.179920  / # . /lava-3861854/environment
    2024-06-21T20:19:06.291871  / # /lava-3861854/bin/lava-test-runner /lav=
a-3861854/0
    2024-06-21T20:19:06.411039  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-21T20:19:06.411862  + cd /lava-3861854/0/tests/0_dmesg
    2024-06-21T20:19:06.412266  + cat uuid
    2024-06-21T20:19:06.412580  + UUID=3D3861854_1.5.2.4.1<8>[  180.559838]=
 <LAVA_SIGNAL_STARTRUN 0_dmesg 3861854_1.5.2.4.1>
    2024-06-21T20:19:06.412871   =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e029ed861726227e7073

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675e029ed861726=
227e7078
        failing since 14 days (last pass: next-20240606, first fail: next-2=
0240607)
        25 lines

    2024-06-21T20:18:18.996477  / # =

    2024-06-21T20:18:19.000404  =

    2024-06-21T20:18:19.105258  / # #
    2024-06-21T20:18:19.109065  #
    2024-06-21T20:18:19.211794  / # export SHELL=3D/bin/sh
    2024-06-21T20:18:19.216327  export SHELL=3D/bin/sh
    2024-06-21T20:18:19.317302  / # . /lava-470628/environment
    2024-06-21T20:18:19.322262  . /lava-470628/environment
    2024-06-21T20:18:19.425278  / # /lava-470628/bin/lava-test-runner /lava=
-470628/0
    2024-06-21T20:18:19.429118  /lava-470628/bin/lava-test-runner /lava-470=
628/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e3dae886e0da1a7e7088

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675e3dae886e0da=
1a7e708d
        failing since 14 days (last pass: next-20240605, first fail: next-2=
0240607)
        27 lines

    2024-06-21T20:34:02.155237  / # =

    2024-06-21T20:34:02.267184  / # #
    2024-06-21T20:34:02.395072  / # export SHELL=3D/bin/sh
    2024-06-21T20:34:02.507009  / # . /lava-3861918/environment
    2024-06-21T20:34:02.618953  / # /lava-3861918/bin/lava-test-runner /lav=
a-3861918/0
    2024-06-21T20:34:02.698919  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-21T20:34:02.727733  + cd /lava-3861918/0/tests/0_dmesg
    2024-06-21T20:34:02.728273  + cat uuid
    2024-06-21T20:34:02.729236  + UUID=3D3861918_1.5.2.4.1
    2024-06-21T20:34:02.729620  + set +x =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e8d4049f103e927e706e

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675e8d4049f103e=
927e7073
        failing since 14 days (last pass: next-20240606, first fail: next-2=
0240607)
        29 lines

    2024-06-21T20:55:35.179087  / # =

    2024-06-21T20:55:35.281988  / # #
    2024-06-21T20:55:35.384605  / # export SHELL=3D/bin/sh
    2024-06-21T20:55:35.489115  / # . /lava-3861978/environment
    2024-06-21T20:55:35.508832  / # /lava-3861978/bin/lava-test-runner /lav=
a-3861978/0
    2024-06-21T20:55:35.621066  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-21T20:55:35.622140  + cd /lava-3861978/0/tests/0_dmesg
    2024-06-21T20:55:35.622642  + cat uuid
    2024-06-21T20:55:35.623104  + UUID=3D3861978_1.5.2.4.1
    2024-06-21T20:55:35.623554  <8>[  184.304054] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3861978_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e3ae1b2e601b447e7083

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675e3ae1b2e601b=
447e7088
        failing since 14 days (last pass: next-20240605, first fail: next-2=
0240607)
        25 lines

    2024-06-21T20:33:36.381831  / # =

    2024-06-21T20:33:36.385801  =

    2024-06-21T20:33:36.489271  / # #
    2024-06-21T20:33:36.492835  #
    2024-06-21T20:33:36.595388  / # export SHELL=3D/bin/sh
    2024-06-21T20:33:36.599036  export SHELL=3D/bin/sh
    2024-06-21T20:33:36.701641  / # . /lava-470630/environment
    2024-06-21T20:33:36.705155  . /lava-470630/environment
    2024-06-21T20:33:36.807848  / # /lava-470630/bin/lava-test-runner /lava=
-470630/0
    2024-06-21T20:33:36.811295  /lava-470630/bin/lava-test-runner /lava-470=
630/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6675e8d6e3a0f72cf67e7076

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675e8d6e3a0f72c=
f67e707b
        failing since 14 days (last pass: next-20240606, first fail: next-2=
0240607)
        27 lines

    2024-06-21T20:55:31.245895  / # =

    2024-06-21T20:55:31.249742  =

    2024-06-21T20:55:31.354516  / # #
    2024-06-21T20:55:31.358459  #
    2024-06-21T20:55:31.461841  / # export SHELL=3D/bin/sh
    2024-06-21T20:55:31.468703  export SHELL=3D/bin/sh
    2024-06-21T20:55:31.571573  / # . /lava-470633/environment
    2024-06-21T20:55:31.576463  . /lava-470633/environment
    2024-06-21T20:55:31.677645  / # /lava-470633/bin/lava-test-runner /lava=
-470633/0
    2024-06-21T20:55:31.681161  /lava-470633/bin/lava-test-runner /lava-470=
633/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6675de75589f5575eb7e707a

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675de75589f5575=
eb7e707f
        failing since 14 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-21T20:11:06.594519  / # =

    2024-06-21T20:11:06.722328  / # #
    2024-06-21T20:11:06.850623  / # export SHELL=3D/bin/sh
    2024-06-21T20:11:06.962526  / # . /lava-3861815/environment
    2024-06-21T20:11:07.074288  / # /lava-3861815/bin/lava-test-runner /lav=
a-3861815/0
    2024-06-21T20:11:07.188035  + export 'TESTRUN_ID=3D0_dmesg'
    2024-06-21T20:11:07.188594  + cd /lava-3861815/0/tests/0_dmesg
    2024-06-21T20:11:07.188790  + cat uuid
    2024-06-21T20:11:07.188947  + UUID=3D3861815_1.5.2.4.1
    2024-06-21T20:11:07.189094  <8>[  174.761126] <LAVA_SIGNAL_STARTRUN 0_d=
mesg 3861815_1.5.2.4.1> =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6675de71e694a2b79d7e70a5

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240621/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240621/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6675de71e694a2b7=
9d7e70aa
        failing since 14 days (last pass: next-20240606, first fail: next-2=
0240607)
        10 lines

    2024-06-21T20:11:01.134478  / # =

    2024-06-21T20:11:01.139071  =

    2024-06-21T20:11:01.242583  / # #
    2024-06-21T20:11:01.246329  #
    2024-06-21T20:11:01.348896  / # export SHELL=3D/bin/sh
    2024-06-21T20:11:01.353283  export SHELL=3D/bin/sh
    2024-06-21T20:11:01.454323  / # . /lava-470626/environment
    2024-06-21T20:11:01.457894  . /lava-470626/environment
    2024-06-21T20:11:01.560768  / # /lava-470626/bin/lava-test-runner /lava=
-470626/0
    2024-06-21T20:11:01.564448  /lava-470626/bin/lava-test-runner /lava-470=
626/0 =

    ... (9 line(s) more)  =

 =20

