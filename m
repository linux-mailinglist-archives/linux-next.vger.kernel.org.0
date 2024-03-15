Return-Path: <linux-next+bounces-1647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A187CBD0
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 12:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2117B1C2143F
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 11:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F95E1A58E;
	Fri, 15 Mar 2024 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nqHXEOAt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669FF1A587
	for <linux-next@vger.kernel.org>; Fri, 15 Mar 2024 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500520; cv=none; b=UE3Rq39DoHbWm+tMc+LMslPy/sdajoeg52q4cxllCfHu0mh7PXZMsOPnhH3reeYeOUOBNOLtipG+edx144uGpUjAnAH2HJJub0l/FVYOapjMs0mIRBGnYXWkERhNheehikCYzbxmE+SimICwWPDn7OXQPMk4mXgYfuRRLuvbF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500520; c=relaxed/simple;
	bh=Wlf36QVCLjieEli+aGI9v/LRfcYiN4KF/wpeMY/FJ+M=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Dp0AnMASPZ/AlX7CCwWHwYxOsbZjE+hPfXy2SLWn57YMrrq99D+mL97gyQ7UpWZGoJgD1E2/tkIkk6+YfGdMwkUve96rMqDNb+2B0QTfLBMJlOA2NObVcemOTIku2u8gmmDkmf93rLXehRJmwTzYCu2wlircyvHMNWvIUzbrylA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nqHXEOAt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so13265305ad.1
        for <linux-next@vger.kernel.org>; Fri, 15 Mar 2024 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710500515; x=1711105315; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y1I0c39/omakQebeXb2cbd7eSTwPboJo4QoGFwzryXw=;
        b=nqHXEOAtK+8NkJAJW4RRB2q0iNjnWcpA4Y8ap0lOTS1Mbn9JPwVTcULCXy7dqipEHQ
         IM5J7eetCleANrsviyRfUuiGIyOcWfG6ug21NPJF6S/dqXLp1rk+n16SiHA28gpDbwz6
         o+Q1R5amMGdsh1csCnG9VyrsPMXeGLugc4Dt71Rl+sVRebC51tDiD/NgCL5C0L/XkHv0
         AA2J/e8sOPxoh0dfXCSYrVNqax3ZlllmXnB3ELdialqqHrPrnNoG5+Fkk+MCboh+SV5u
         PtlusvMwGgUeNrRrP4ou5zysT0xZ99bD42iYJT22bA5NRWn7eiC9b2UtitomVcC0QZmt
         YLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500515; x=1711105315;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1I0c39/omakQebeXb2cbd7eSTwPboJo4QoGFwzryXw=;
        b=EotclrdEBEkFTGXaeJNixUl8lR3UDBarnZqbi3FfeQXxxlZf3MDLy15G5D7Lrjc0T0
         VA7ADQdITAq6O9KXAkCZCCCyhJdmWtvnQx3j3GiQz1dRu3MsnFpEf0GLyyFeMbwAm1sM
         KPspkiftWcF/sdNvsAv5hSrD7aCsnurFLkWCL8Qz6jSYn8F6dhmNvfipLr6ZnAwajT4T
         3EdTjEvmaKCBONYGFdM0raZkYBZbTT0YI8OXzHwTbEAtdLq+ciS7bkyzMwFfZBTboTqK
         7vT1AKr4iKGM5I21PQNKeYwrOdOoS7uhNupcgk19iluyuMs+N3keGDXbsgL0coHrPUMg
         31xA==
X-Gm-Message-State: AOJu0YxWrwA+px2zIPj/47bms496tlZerzFVv7u2FfjcGW2dM1JqDurN
	L+QU9LtZy9hyirB22Jd+IJFAjM5lkhAacMF4HXCine2WBOFaLhjWl2ywXu32lLWnnoraH5ryjhi
	x
X-Google-Smtp-Source: AGHT+IF794KXHpPlFO/ZKDOq5jyi9YgG4MSHGahDjrnfw4yH55vl+5xnahmphbOdKfIdLN9/Ri1HpA==
X-Received: by 2002:a17:902:ecc5:b0:1dc:b308:c3b6 with SMTP id a5-20020a170902ecc500b001dcb308c3b6mr13295510plh.1.1710500514445;
        Fri, 15 Mar 2024 04:01:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id le13-20020a170902fb0d00b001dd6e0a0c1bsm3491529plb.268.2024.03.15.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:01:53 -0700 (PDT)
Message-ID: <65f42aa1.170a0220.e125d.a402@mx.google.com>
Date: Fri, 15 Mar 2024 04:01:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20240315
X-Kernelci-Report-Type: test
Subject: next/master baseline: 285 runs, 47 regressions (next-20240315)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 285 runs, 47 regressions (next-20240315)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

acer-chromebox-cxi5-brask    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | clang-17 | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3588-rock-5b               | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | clang-17 | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240315/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240315
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a1e7655b77e3391b58ac28256789ea45b1685abb =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f4f479990cc2f04c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f4f479990cc2f04c4=
2db
        failing since 15 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f40496fb66d54f4c438f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f40496fb66d54f4c4=
390
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f3fbc52bee735c4c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cbv514-1h-=
34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cbv514-1h-=
34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f3fbc52bee735c4c4=
2de
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f3ffc52bee735c4c42e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f3ffc52bee735c4c4=
2e9
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi5-brask    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f40ec52bee735c4c4308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi5-brask.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi5-brask.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f40ec52bee735c4c4=
309
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f428c1d253b27d4c4309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f428c1d253b27d4c4=
30a
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f3e996fb66d54f4c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C433TA-AJ0=
005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C433TA-AJ0=
005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f3e996fb66d54f4c4=
2de
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f406c52bee735c4c42f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C436FA-Fli=
p-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C436FA-Fli=
p-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f406c52bee735c4c4=
2f5
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f4014dfaac1bef4c430b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-cx9400-vol=
teer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-cx9400-vol=
teer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f4014dfaac1bef4c4=
30c
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f3e196cbb2c5894c435a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f3e196cbb2c5894c4=
35b
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f411c1d253b27d4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f411c1d253b27d4c4=
2e3
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f4d68ff64ff9c64c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f4d68ff64ff9c64c4=
2db
        failing since 15 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f4ef8ff64ff9c64c4324

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f4ef8ff64ff9c64c4=
325
        failing since 15 days (last pass: next-20240226, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f3df96cbb2c5894c4357

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f3df96cbb2c5894c4=
358
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f4eb8ff64ff9c64c431e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-14-G1-s=
ona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-14-G1-s=
ona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f4eb8ff64ff9c64c4=
31f
        failing since 7 days (last pass: next-20240306, first fail: next-20=
240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3ef08643323306e4c42e5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3ef08643323306e4c42ee
        new failure (last pass: next-20240228)

    2024-03-15T06:47:17.911228  + set[   15.916320] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1034742_1.5.2.3.1>
    2024-03-15T06:47:17.911398   +x
    2024-03-15T06:47:18.016893  / # #
    2024-03-15T06:47:18.118431  export SHELL=3D/bin/sh
    2024-03-15T06:47:18.118882  #
    2024-03-15T06:47:18.219650  / # export SHELL=3D/bin/sh. /lava-1034742/e=
nvironment
    2024-03-15T06:47:18.220156  =

    2024-03-15T06:47:18.320988  / # . /lava-1034742/environment/lava-103474=
2/bin/lava-test-runner /lava-1034742/1
    2024-03-15T06:47:18.321619  =

    2024-03-15T06:47:18.324579  / # /lava-1034742/bin/lava-test-runner /lav=
a-1034742/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f9bb3f330bd0924c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f9bb3f330bd0924c4=
2dd
        failing since 583 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f9bc1abe7e796b4c42df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f9bc1abe7e796b4c4=
2e0
        failing since 570 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f407c52bee735c4c42f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f407c52bee735c4c4=
2f9
        new failure (last pass: next-20240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f09030dfc87cc74c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f09030dfc87cc74c4=
2dc
        failing since 703 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3eaebe643ff16d24c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3eaebe643ff16d24c4=
2dc
        new failure (last pass: next-20240304) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/65f3e9e51422a1f2144c42e5

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3e9e51422a1f2144c42ec
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:17.511327  <8>[   20.218556] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 443337_1.5.2.4.1>
    2024-03-15T06:25:17.616929  / # #
    2024-03-15T06:25:17.719044  export SHELL=3D/bin/sh
    2024-03-15T06:25:17.719655  #
    2024-03-15T06:25:17.821000  / # export SHELL=3D/bin/sh. /lava-443337/en=
vironment
    2024-03-15T06:25:17.821710  =

    2024-03-15T06:25:17.923282  / # . /lava-443337/environment/lava-443337/=
bin/lava-test-runner /lava-443337/1
    2024-03-15T06:25:17.924463  =

    2024-03-15T06:25:17.942903  / # /lava-443337/bin/lava-test-runner /lava=
-443337/1
    2024-03-15T06:25:17.987373  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65f3e9e51422a1f2144c42f0
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:20.094549  /lava-443337/1/../bin/lava-test-case
    2024-03-15T06:25:20.094992  <8>[   22.791308] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2024-03-15T06:25:20.095420  /lava-443337/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
f3e9e51422a1f2144c42f2
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:21.155755  /lava-443337/1/../bin/lava-test-case
    2024-03-15T06:25:21.156198  <8>[   23.830167] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2024-03-15T06:25:21.156472  /lava-443337/1/../bin/lava-test-case
    2024-03-15T06:25:21.156689  <8>[   23.848485] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f3e9e51422a1f2144c42f7
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:22.234203  /lava-443337/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65f3e9e51422a1f2144c42f8
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:22.237508  <8>[   24.948576] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-15T06:25:23.273637  /lava-443337/1/../bin/lava-test-case
    2024-03-15T06:25:23.274129  <8>[   25.970585] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2024-03-15T06:25:23.274434  /lava-443337/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3ed581492bd79a74c4302

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3ed581492bd79a74c4309
        failing since 21 days (last pass: next-20240221, first fail: next-2=
0240222)

    2024-03-15T06:40:03.977104  <8>[   20.253642] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 443354_1.5.2.4.1>
    2024-03-15T06:40:04.082191  / # #
    2024-03-15T06:40:04.184348  export SHELL=3D/bin/sh
    2024-03-15T06:40:04.185072  #
    2024-03-15T06:40:04.286477  / # export SHELL=3D/bin/sh. /lava-443354/en=
vironment
    2024-03-15T06:40:04.287205  =

    2024-03-15T06:40:04.388536  / # . /lava-443354/environment/lava-443354/=
bin/lava-test-runner /lava-443354/1
    2024-03-15T06:40:04.389689  =

    2024-03-15T06:40:04.408735  / # /lava-443354/bin/lava-test-runner /lava=
-443354/1
    2024-03-15T06:40:04.452856  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/65f3e9e794a755749d4c42db

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3e9e794a755749d4c42e2
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:31.456944  / # #
    2024-03-15T06:25:31.559235  export SHELL=3D/bin/sh
    2024-03-15T06:25:31.560039  #
    2024-03-15T06:25:31.661474  / # export SHELL=3D/bin/sh. /lava-443339/en=
vironment
    2024-03-15T06:25:31.662256  =

    2024-03-15T06:25:31.763821  / # . /lava-443339/environment/lava-443339/=
bin/lava-test-runner /lava-443339/1
    2024-03-15T06:25:31.765037  =

    2024-03-15T06:25:31.783559  / # /lava-443339/bin/lava-test-runner /lava=
-443339/1
    2024-03-15T06:25:31.838501  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-15T06:25:31.838938  + <8>[   20.922585] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 443339_1.5.2.4.5> =

    ... (11 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65f3e9e794a755749d4c42f5
        failing since 93 days (last pass: next-20231207, first fail: next-2=
0231212)

    2024-03-15T06:25:34.267061  /lava-443339/1/../bin/lava-test-case
    2024-03-15T06:25:34.267507  <8>[   23.338603] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2024-03-15T06:25:34.267866  /lava-443339/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f540a14ad6f4684c42e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f540a14ad6f4684c4=
2e1
        new failure (last pass: next-20240307) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3eaf2e643ff16d24c4329

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3eaf2e643ff16d24c4=
32a
        new failure (last pass: next-20240304) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/65f3f17813a5775da64c42e0

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65f3f17813a5775da64c42fb
        failing since 28 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-15T06:58:50.063395  <8>[   30.062951] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-15T06:58:51.082180  /lava-13060051/1/../bin/lava-test-case

    2024-03-15T06:58:51.095478  <8>[   31.095727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65f3f17813a5775da64c42fc
        failing since 28 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-15T06:58:49.030880  <8>[   29.029969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-driver-present RESULT=3Dpass>

    2024-03-15T06:58:50.051649  /lava-13060051/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f284bca40050e54c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f284bca40050e54c4=
2e4
        new failure (last pass: next-20240308) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f8a913375565be4c42f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f8a913375565be4c4=
2f8
        failing since 15 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f8a8c11a5612ba4c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f8a8c11a5612ba4c4=
2de
        failing since 15 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f8ed023fb1b0b74c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f8ed023fb1b0b74c4=
2dd
        failing since 15 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f8a9c11a5612ba4c42e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f8a9c11a5612ba4c4=
2e4
        failing since 15 days (last pass: next-20240122, first fail: next-2=
0240228) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3e979b688c958dc4c42e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3e979b688c958dc4c4=
2e8
        failing since 0 day (last pass: next-20240312, first fail: next-202=
40314) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f0f3668c4d3faf4c431d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f0f3668c4d3faf4c4=
31e
        failing since 478 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3efef731e235ebe4c4310

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3efef731e235ebe4c4=
311
        failing since 478 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3588-rock-5b               | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3ee59bc32c632154c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3588-rock-5b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3588-rock-5b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3ee59bc32c632154c4=
2db
        new failure (last pass: next-20240314) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3ef2efb8f49b4ec4c42e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3ef2efb8f49b4ec4c42f2
        failing since 288 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-15T06:48:00.930231  <8>[   14.461416] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3955096_1.5.2.4.1>
    2024-03-15T06:48:01.034970  / # #
    2024-03-15T06:48:01.136187  export SHELL=3D/bin/sh
    2024-03-15T06:48:01.136638  #
    2024-03-15T06:48:01.237597  / # export SHELL=3D/bin/sh. /lava-3955096/e=
nvironment
    2024-03-15T06:48:01.238033  =

    2024-03-15T06:48:01.338810  / # . /lava-3955096/environment/lava-395509=
6/bin/lava-test-runner /lava-3955096/1
    2024-03-15T06:48:01.339527  =

    2024-03-15T06:48:01.379938  / # /lava-3955096/bin/lava-test-runner /lav=
a-3955096/1
    2024-03-15T06:48:01.486332  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3ef1f643323306e4c4344

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3ef1f643323306e4c434d
        failing since 288 days (last pass: next-20230530, first fail: next-=
20230601)

    2024-03-15T06:47:43.599668  + set +x
    2024-03-15T06:47:43.601400  [   20.575021] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462581_1.5.2.4.1>
    2024-03-15T06:47:43.710179  / # #
    2024-03-15T06:47:43.811813  export SHELL=3D/bin/sh
    2024-03-15T06:47:43.812450  #
    2024-03-15T06:47:43.913445  / # export SHELL=3D/bin/sh. /lava-462581/en=
vironment
    2024-03-15T06:47:43.913993  =

    2024-03-15T06:47:44.014990  / # . /lava-462581/environment/lava-462581/=
bin/lava-test-runner /lava-462581/1
    2024-03-15T06:47:44.015900  =

    2024-03-15T06:47:44.018338  / # /lava-462581/bin/lava-test-runner /lava=
-462581/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3eb461cc6f12a3b4c42da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3eb461cc6f12a3b4c42e3
        failing since 282 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-15T06:31:18.453625  / # #
    2024-03-15T06:31:18.556570  export SHELL=3D/bin/sh
    2024-03-15T06:31:18.557428  #
    2024-03-15T06:31:18.658814  / # export SHELL=3D/bin/sh. /lava-3955042/e=
nvironment
    2024-03-15T06:31:18.659898  =

    2024-03-15T06:31:18.761391  / # . /lava-3955042/environment/lava-395504=
2/bin/lava-test-runner /lava-3955042/1
    2024-03-15T06:31:18.762721  =

    2024-03-15T06:31:18.778320  / # /lava-3955042/bin/lava-test-runner /lav=
a-3955042/1
    2024-03-15T06:31:18.914866  + export 'TESTRUN_ID=3D1_bootrr'
    2024-03-15T06:31:18.915585  + cd /lava-3955042/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3eb4a2458d80a004c4337

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f3eb4a2458d80a004c4340
        failing since 282 days (last pass: next-20230525, first fail: next-=
20230607)

    2024-03-15T06:31:22.229554  + set +x
    2024-03-15T06:31:22.231506  [   22.299325] <LAVA_SIGNAL_ENDRUN 0_dmesg =
462577_1.5.2.4.1>
    2024-03-15T06:31:22.339856  / # #
    2024-03-15T06:31:22.441521  export SHELL=3D/bin/sh
    2024-03-15T06:31:22.442088  #
    2024-03-15T06:31:22.543082  / # export SHELL=3D/bin/sh. /lava-462577/en=
vironment
    2024-03-15T06:31:22.543642  =

    2024-03-15T06:31:22.644715  / # . /lava-462577/environment/lava-462577/=
bin/lava-test-runner /lava-462577/1
    2024-03-15T06:31:22.645620  =

    2024-03-15T06:31:22.648555  / # /lava-462577/bin/lava-test-runner /lava=
-462577/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65f3f252b18e2dd6134c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240315/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f3f252b18e2dd6134c4=
2db
        new failure (last pass: next-20240308) =

 =20

