Return-Path: <linux-next+bounces-2577-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C590C2F0
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 06:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36BAA1C20B59
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 04:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F63B134BD;
	Tue, 18 Jun 2024 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="tz+A08bh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593E134AC
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718686333; cv=none; b=rkylKXgXBRzH6fDIDMmn5JNFzUuSjjttKLZ4HLHfLU2Ab9eu1S0lQ5YpLlB+NgiG9QxU2WMRi4f96ku2OoxGa2OL0HjF1KbYxDjv/JgexqnO6UpHTHmn89s8tHFy+6eX4/nAB5LbW17G839F3+AHkXFni/CHAVN1V+r/n8BMTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718686333; c=relaxed/simple;
	bh=THr2ZNao50BX7pOiqe0ateIT4kaLoceB/AVazJ2cosU=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=P4W+N0cH34X9b8/ZOm+D9Wza5iLRuaZbqAoeITVRu5mNz9VZYTD6qh6R3gJrOI3NxU09bQzxx5qAW5ZSciQr4XAXFQ8H+Kido4HTwtGLgf+f7Rm71CFcQ+LiByVzYT055llEkxkkqTytYpnpcjvf1inTMnGWu5HH2sktUtbFBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=tz+A08bh; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7046211e455so3641015b3a.3
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2024 21:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718686330; x=1719291130; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OQC4A4mXubkvd7k0/8Tw4bP8UZPGN40eaRuFbnQSRCY=;
        b=tz+A08bhhTw3JtBN4HH3/mTe7gkQ3HnPf76n7r3pC15NmeQiq9+gCbJdUJbWIqdivE
         Cwcy+xVMg60tb2WlZc1AmTSKV0n/VJXP0Sn7ffrirOz7GKx7lTc+fjrSviMyzqnaaRmw
         d20DRVollczJxzJ+e0KXPFUuknn+GyaD7DbU/Ef5Ixw/khLYiYmknvALSa1wNrG6KSYr
         UjGLZJJMeJwE92zhQMA/MLYt/dnxZrxl7MwERmHmjDtL0B0Dh7wc6fMZCdySWceW9QrK
         8gRS9TnnRUlDEL+nj8ClIKP3VASls516oE04DBoCnVV4MD8+PYPZcnpCAakVXxSP4ZYq
         KNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718686330; x=1719291130;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQC4A4mXubkvd7k0/8Tw4bP8UZPGN40eaRuFbnQSRCY=;
        b=tXrNEHz1rVur9FGkah0HOOr95shHX7DRAkn61pYb3WXnCxGUUTOk/HUKdfoALkTGBt
         p6/LYkJTYqbAaQu5t177RP+D+fiYn2bESnZxI9V+ocYfNfFvDTaYw8Yn8CERPPdkKX5D
         VpUG1NyMYFpvT7SRZdr0PcDrHrc7l0dzx3tNwMlS5AFyyMYZS/6hiZPzYNbcL8xTmofA
         GMtsxKIQgp/n9GXb4DstL7rzt2k4p1a2FvKtrEz8HGDcQuiPIeFWJaEWq8Wipt4tQ4lR
         PHU0uprJ46VCMao9QngpVKUCFF/cnPeLn2viSLwVLpIwa0gGt7ft50JSXBO7OPAygKJd
         Dcfw==
X-Gm-Message-State: AOJu0Yx1vCvZyz0CmH+oxp/T54V+d79mwx6PX7SzsFfyRenX3OCQKuTz
	rfC6BAsYLv6CLkbee4jyXBkWbcjZml1rO2T4Nn0X+pmvTLqoSo+rL3v+Ci94e7ptgM8z0ldrYQI
	GpYjWrpnd
X-Google-Smtp-Source: AGHT+IHmlJl0wh7MwQSJMviC+XepI2BtocgVuz7185Dvfey/SjkK5DvanmAwxUUHjAXn1QOdAS6WwQ==
X-Received: by 2002:a05:6a00:114c:b0:705:bd9d:a7ce with SMTP id d2e1a72fcca58-705d71a67bcmr13630726b3a.25.1718686330558;
        Mon, 17 Jun 2024 21:52:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf36be7sm6216704a12.1.2024.06.17.21.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 21:52:10 -0700 (PDT)
Message-ID: <6671127a.650a0220.16eac.f9ba@mx.google.com>
Date: Mon, 17 Jun 2024 21:52:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.3-10703-gb3f869e79cdf0
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 77 runs,
 4 regressions (v6.3-10703-gb3f869e79cdf0)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 4 regressions (v6.3-10703-gb3f869e79c=
df0)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
 | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-10703-gb3f869e79cdf0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-10703-gb3f869e79cdf0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b3f869e79cdf0e15e03b2e77ca14e825c18d933e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6670e22efa42e5b04f7e708b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf0/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf0/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6670e22efa42e5b04f7e7=
08c
        new failure (last pass: v6.10-rc3-296-g575f43b2d19d) =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | gcc-10   | defconfig=
 | 2          =


  Details:     https://kernelci.org/test/plan/id/6670e1b1ab773a62c57e708e

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf0/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi=
-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf0/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi=
-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6670e1b1ab773a6=
2c57e7091
        new failure (last pass: v6.10-rc3-296-g575f43b2d19d)
        2 lines

    2024-06-18T01:23:54.518560  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2024-06-18T01:23:54.519015  kern  :emerg : Code: 97fc2d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2024-06-18T01:23:54.519275  <8>[   28.525972] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2024-06-18T01:23:54.519501  + set +x

    2024-06-18T01:23:54.519756  <8>[   28.528121] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 14405574_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6670e1b1ab773a6=
2c57e7092
        new failure (last pass: v6.10-rc3-296-g575f43b2d19d)
        12 lines

    2024-06-18T01:23:54.494651  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2024-06-18T01:23:54.495141  kern  :alert :   CM =3D 0, WnR =3D 0

    2024-06-18T01:23:54.495394  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000046aa000

    2024-06-18T01:23:54.495610  kern  :alert : [0000000000000008] pgd=3D080=
0000078795003, p4d=3D0800000078795003, pud=3D0800000078794003, pmd=3D000000=
0000000000

    2024-06-18T01:23:54.495856  <8>[   28.504171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
 | regressions
-----------------------------+-------+---------------+----------+----------=
-+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/6670e2a3e7c40f4b297e7164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf0/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libret=
ech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-10703-=
gb3f869e79cdf0/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libret=
ech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6670e2a3e7c40f4b297e7=
165
        new failure (last pass: v6.10-rc3-296-g575f43b2d19d) =

 =20

