Return-Path: <linux-next+bounces-4304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D589A0836
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 13:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ADFB284530
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 11:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767418C920;
	Wed, 16 Oct 2024 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="v1U5cFU2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594F15C147
	for <linux-next@vger.kernel.org>; Wed, 16 Oct 2024 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077494; cv=none; b=LOcsSw1gnPWl2ZJABcJpZTwGEluFmn1cCSqFDte35pADh2D0RNPD/vT8o3cf0GiaX67yIcRyWOui97BqtagtvXlDPuwQJ32SLU5pPTMy4Opz3qL8cbGQZrM7Wal2GHHPFw6c0cuWI9COYlKNAnIRyaSK8o43+xxfHmavFy3njpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077494; c=relaxed/simple;
	bh=w3TbyB/v+f4BzZ7QtII3+9WuiNzWZ0iiA1NJ3727hQU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=dlOJENlDBPmFJS4w4assrvnZChO10IR9YytHi6eZN2YD+K6VEiQxOw73C7CpJv8ws+ysyUa2fn0H7MDbYgUh26fU+onjYwRkKOYXxdQbVf7ytMOKx32F0A35DkTui43Gzm6t90JggE9ix8M5R4KyD+3xYmUEbAnb8EWwFIfE1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=v1U5cFU2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20caea61132so42614445ad.2
        for <linux-next@vger.kernel.org>; Wed, 16 Oct 2024 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1729077491; x=1729682291; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SMtRwHpp/EOAq0gEnEzz203zOiJdjDUB+mV5uLbimoo=;
        b=v1U5cFU2t7zXoWMkl1mmXw0QTtYBfuel517dcimudQ3ibWJ7j7mm/y4X3mqXY9SJPj
         V0ghA/dUwHfrxPLJiTuSv2oRVx3jznskkz6ljevc3GmgQ8h6FFvrEcgY9ye9y+gsgwe9
         v2zHWbyCCgvVbYbyn3rH8sQhdwIKJpMfW+/vjUWwFv3l4yKZdmw59SUptORYeQpiwFoJ
         7R8D+BebCuH5INHuPVsyZUhg1SOXu//BZpoqy6GbqpjOFyH15tNzNSc7qC9nhh2ufp3+
         akqFMcq9yu10qykdKmKrG6NBMNzsL1JpQ5cs3WsHEKgewPAXsf/9vOU2Eb43t/2TkXJE
         FP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729077491; x=1729682291;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMtRwHpp/EOAq0gEnEzz203zOiJdjDUB+mV5uLbimoo=;
        b=uEY1HLHfQSb8wcJ7Is1BoWwGsTb4gU1qr3ovLQbdg1k25Jkl1GbNQlISl8jamDDfi1
         f8nVMWG40Lz5J2cBY/BsVzTrTZl2AadrN4WynKEmsGxfEu8TnOvftFgNeIUiE7vQ4Mak
         8Z4pHImQToYIDVCtEiMfAWK01DPR3N2v/zajPh5SosGA18rL4YbW0vq/QL7LjMNvJ2ja
         /rBNWkFCPEGONtwuojF1Kjrkv6cwLrCfPwsIr6ALAju1erhrwf3tFkPnxlbizh111J5B
         pxm2LsH3/r5em2RlC9C9G2S0IjrtNh2YZsUPeVeb28YvDzE2UggGAZl/vbW4uHAY05tI
         wAPg==
X-Gm-Message-State: AOJu0YzlZH4M78nWL55rv9fkWOYYicTNcBueLCkxVmjeANHeFtlzjf4j
	f5PiBTRWbgvLrNDh6pHBb8h8z17GC+lhsjCsCQpxMBfpSNrrHKyb91R1g0gogfTB6NsAAJwJOWh
	g7tA=
X-Google-Smtp-Source: AGHT+IHuP7NpQJD2xk4no2BUmSpQI4AaRJ6t4h+tD7nL8UjyHUXqEKD+qFEIq1CdR+jho1CLuLcR4w==
X-Received: by 2002:a17:902:ec83:b0:20c:af5d:2ed0 with SMTP id d9443c01a7336-20cbb294bffmr236544735ad.48.1729077491308;
        Wed, 16 Oct 2024 04:18:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f9db77sm26891505ad.98.2024.10.16.04.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:18:11 -0700 (PDT)
Message-ID: <670fa0f3.170a0220.1bc141.9bbb@mx.google.com>
Date: Wed, 16 Oct 2024 04:18:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20241016
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 170 runs, 3 regressions (next-20241016)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 170 runs, 3 regressions (next-20241016)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
jetson-tk1                   | arm  | lab-baylibre | gcc-12   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm  | lab-kontron  | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =

kontron-kswitch-d10-mmt-8g   | arm  | lab-kontron  | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
241016/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20241016
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      15e7d45e786a62a211dd0098fee7c57f84f8c681 =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
jetson-tk1                   | arm  | lab-baylibre | gcc-12   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/670f68699216d4dca0c8685f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241016/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20241016/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-12/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670f68699216d4dca0c86=
860
        failing since 4 days (last pass: next-20241008, first fail: next-20=
241011) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm  | lab-kontron  | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/670f6ef33b087b4de8c8685e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241016/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241016/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670f6ef33b087b4de8c86=
85f
        failing since 49 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
kontron-kswitch-d10-mmt-8g   | arm  | lab-kontron  | gcc-12   | multi_v7_de=
fconfig+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/670f6f073b087b4de8c86868

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+kselftest
  Compiler:    gcc-12 (arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20241016/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20241016/arm/=
multi_v7_defconfig+kselftest/gcc-12/lab-kontron/baseline-kontron-kswitch-d1=
0-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/670f6f073b087b4de8c86=
869
        failing since 49 days (last pass: next-20240725, first fail: next-2=
0240827) =

 =20

