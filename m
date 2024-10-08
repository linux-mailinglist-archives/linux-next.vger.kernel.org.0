Return-Path: <linux-next+bounces-4144-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E81994A87
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 14:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893C01C24A44
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 12:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A43A1DF279;
	Tue,  8 Oct 2024 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2PqTdFme"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0701DF25E
	for <linux-next@vger.kernel.org>; Tue,  8 Oct 2024 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390820; cv=none; b=LyXxzHwXGwJif0Dr02RnwwagfuGR2ULOHBSFfB2HPqLauQlzgmrGydlYxcAQSyhuMHMKMsJ2ITWFJ4A4UfV8CFA0JiUTkavAOr3qKcaqt2alc35bC49uJo5YMg2snP/mUESoESUWKnJYiVAC/k1WmQ72p03/54OGb//RpMt377Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390820; c=relaxed/simple;
	bh=ZlGjUw97WGOXR/w5w+i3OvYMTp/spksgnqD3Z1rVKzI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=C76cU42Kx2otpbzkZJdgOQ0KS5+1fRVvIQDYaD5MDpCDTQ6BOGdiicKBCz+rJwWpqGlfTBOHkvzG5gO4OOHmpZ8CpAsSzUjWrUbru2zBSEToIe7sxbFM1LMYAMYix12XPJVUoRJGenIQBNdjybJ7w359g6I9ePx2LJghlGlCLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2PqTdFme; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7ea03ecf191so1978528a12.0
        for <linux-next@vger.kernel.org>; Tue, 08 Oct 2024 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1728390817; x=1728995617; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q512TmA74VOYCSVVPqa3Vo6l26qJK+M7zj91YbKTdHA=;
        b=2PqTdFmeqU4+kfB4Z4vmEltwX+CLg9q3gFCnMKD7LHqku/cKttwp/8glJSnQOWpqLQ
         Lu3dUXZXwAmgj0nb1HT8bLQsV5M+PS3KpGnuN3c12vhy1SrMFFF4vrapj25CrjMp5ARj
         Vu+N4xVHyVqhKEnNj6mTkLcQLDEmXb6rxoZo/501Kxe7lQPQwQcJjSDfiV/pDJM4swXD
         ggviuDreBVxLTCJXraWfVcfTm+aii1jZU2GwBT02boGpkTG/dCziLsR39DevIoOZrcA6
         Uq6kxNealhZ26v2NGYCze27MhoOJIY/RSO3+tNMxyU+a4IYivy1b1ApbrZFBFRUnTJ/3
         h20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728390817; x=1728995617;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q512TmA74VOYCSVVPqa3Vo6l26qJK+M7zj91YbKTdHA=;
        b=rAwTYPqnZtN0hYZoB2tOPb23Sf1ByHDLkpYunA3FRK5islqaq9B9QaCj71aR9+D8Hr
         4yjR+9JK3NlpOYHIx15YkkRMY/hdiGnfj/5UYIIq+VaTnFarRx0XUgqJXFcjm4TzjEX2
         p6NzI6gcvFqP1HuIuPnLBhjVofQbUFqtvziwISa2W+noNvx2kIMpwQouzmwP64ODUSV1
         D9ipbJnshaN9AQ5FG09DSPl6OvRJSU4TUXvw1F/FDMthme7GoFR9CJ4LsvBOC///1xpH
         WCKvECzN1Z3OYq+WArHKJvMhRh+xMa6H1bkx9RmuhajHHZShpU3SR9WpC2xeMK2Q5Tzu
         xbOQ==
X-Gm-Message-State: AOJu0YxovW/Yp6WKdwrgpMsXiZqNb8c/1Ma7qnS/VgL3s/Tq3mSB4h6S
	QTkT0VIfSOfDMHqHNhYHHz2A8rf9aAElbGLgKj+05sxJEtE+hTtcyWkyW3DAvCSRNg5VltYqTCh
	s
X-Google-Smtp-Source: AGHT+IEqFMVton8Ojd++ckTbaJZeLWe4Kx4SRgr9sRFBJEymkwGH/zv6HClm04mk2oVGEKjW8qk5Eg==
X-Received: by 2002:a05:6a21:1584:b0:1cf:6c64:fb00 with SMTP id adf61e73a8af0-1d6dfa41704mr24031519637.19.1728390817390;
        Tue, 08 Oct 2024 05:33:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dfea52097sm4216324b3a.103.2024.10.08.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:33:37 -0700 (PDT)
Message-ID: <670526a1.050a0220.ae699.cf9c@mx.google.com>
Date: Tue, 08 Oct 2024 05:33:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241008
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 201 runs, 6 regressions (next-20241008)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 201 runs, 6 regressions (next-20241008)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =

juno-uboot                   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe   | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241008/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241008
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      33ce24234fca4c083e6685a18b460a18ebb5d5c1 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6704f395b077ada6ddc86875

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6704f395b077ada6ddc86=
876
        failing since 48 days (last pass: next-20240716, first fail: next-2=
0240820) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
juno-uboot                   | arm64 | lab-broonie  | gcc-12   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6704ef5db2b0651feac86878

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-12 (aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-juno-uboo=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-12/lab-broonie/baseline-juno-uboo=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6704ef5db2b0651feac86=
879
        new failure (last pass: next-20241004) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6704f1978469c2c580c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6704f1978469c2c580c86=
857
        failing since 41 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
kontron-kswitch-d10-mmt-8g   | arm   | lab-kontron  | gcc-12   | multi_v7_d=
efconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6704f198620cea02ddc86871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6704f198620cea02ddc86=
872
        failing since 41 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip      | gcc-12   | shmobile_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6704ef4db2b0651feac8685d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241008/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241008/arm/=
shmobile_defconfig/gcc-12/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6704ef4db2b0651feac86=
85e
        failing since 7 days (last pass: next-20240930, first fail: next-20=
241001) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe   | clang-17 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6704f35e3f293bb4e9c86856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085813+6009=
708b4367-1~exp1~20231208085906.81))
  Plain log:   https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241008/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6704f35e3f293bb4e9c86=
857
        new failure (last pass: next-20240726) =

 =20

