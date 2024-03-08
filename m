Return-Path: <linux-next+bounces-1558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE5876168
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 10:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65AA51F2280E
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E04537E4;
	Fri,  8 Mar 2024 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UB5vDYXo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021BB537F5
	for <linux-next@vger.kernel.org>; Fri,  8 Mar 2024 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891858; cv=none; b=PgvASz8knx3xk+UWmH/hDx7AqqTqkbldeGAUKg75fNzAW4Nm65RkLsZVO339dt8sNjXNVsnUea4rsWQy0RHZZsnTPcm1j+c/EgbAws2vwM8ZRpbAtexqhdoj258VTpQo0NiOSg0BD5O46qBfLgYs546sHgQaOWAIr2RiII+1eY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891858; c=relaxed/simple;
	bh=mY7Nzagb1k+UBebjMbh3MC7Ts/R9S70zTIBuwyWftiY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Xn+Cc0WJJNndOVcfRwL/IOZ84995AzeqVTiyvfizV4Ve+TsBdihkXObTfLafbf2AvRQMcnC1SzSYkemfwdnY8yJMZTRBRfFn9WfyoPIudlUTr5dErKGw3tRKOphoq6XRdVlXsTe9Zg8W09Faax/kT33XLaUrBLn0msu50e+b7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=UB5vDYXo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dd6198c4e2so9419525ad.2
        for <linux-next@vger.kernel.org>; Fri, 08 Mar 2024 01:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709891855; x=1710496655; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gHM+y/8KDYMmgYBtwFMe2xfdXeSQKLiFhKwHPLgJmIA=;
        b=UB5vDYXoWVNrGNMcESexCByAo5Q7lPnpxPMNIA5mIA4Wb38TQXZajJFwLblFWJcV8s
         eaN0NpD9qRuIdv9jFPG2PmEclBheqCnxULaJxuBFjNyEGhX6Ln2f/7ae+9aPHEjVfdTg
         Jx6aNy/Ob6sGWfeAyjwuYPS6J/+PGhiiEHwYBS009qk2pnLrAojGb2+AyZ+Z9g9MUwpB
         gKqNIq1jx4GwOAnEj/qpKpcbMSsQiJ7poG8WpIsBCbySBursSZ71SJj+JgWjlgHlsY5z
         D6H7rEOz0PgJX4CThXQvdcFY6EYAZozk1Y0q3ZJs9EsgGH6BVDv+rcAP4+OYMdn58jN2
         qOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891855; x=1710496655;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHM+y/8KDYMmgYBtwFMe2xfdXeSQKLiFhKwHPLgJmIA=;
        b=cgnnS9MNeJhvaopTw+a04ijDLJK4IIbjBXoG/CzjlH5vrWWDoey2Krlmd57RhjaQ99
         R4zJnDoZPBtDg47aDaojEJEgXg55Cm+C+aXqWHd3zSadjr7Sik2l/A6h+lY7mXnyMPL3
         ReypsQhWeVvBWy22zUzhanJLDCoR2GPPs5B5++yMBvxnw2w1w3KajvPETVNSzYOaMGoe
         Z9CPy430MqFY7Q1IFNPHVpxGtHqYUr7hqon0ceIaoo4r9vhiwcQkQsuwhGCM/GCruT29
         JyXD/lj1AKtjx3XdEgPOLVpg5F2VNGzHWpJUXfmN/U+TIY5B4q0ud8DxyDu97NwEgnGZ
         l+0A==
X-Gm-Message-State: AOJu0YyGLCK0rDTX4njur3Oh3HjqGQeBJl4tgE+rguXMjuHT9r90i/my
	jFsk7PezPIOMKI7nHUevsHZjPg9nh7YLAbAGBSbr5xUFkPKKis2mToWKFChDa1y32VKYvUkM3Li
	egOs=
X-Google-Smtp-Source: AGHT+IEf3thoP8ZxyLRivSVQqcAiRjFGVsyjUCQpeWdX62KEMzu9kxZGIGgGlya+CMXhmTaEos2sQg==
X-Received: by 2002:a17:902:ea05:b0:1dc:f157:51bc with SMTP id s5-20020a170902ea0500b001dcf15751bcmr13084550plg.3.1709891854263;
        Fri, 08 Mar 2024 01:57:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903244900b001dd667505d7sm1035237pls.85.2024.03.08.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 01:57:33 -0800 (PST)
Message-ID: <65eae10d.170a0220.23e12.3254@mx.google.com>
Date: Fri, 08 Mar 2024 01:57:33 -0800 (PST)
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
X-Kernelci-Kernel: next-20240308
X-Kernelci-Report-Type: test
Subject: next/master baseline: 143 runs, 33 regressions (next-20240308)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 143 runs, 33 regressions (next-20240308)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-s90...libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-roc-pc                | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240308/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240308
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8ffc8b1bbd505e27e2c8439d326b6059c906c9dd =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa957f4a2b0bc784c430d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-R721T-grun=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa957f4a2b0bc784c4=
30e
        failing since 8 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa84addb98f655f4c42e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cb317-1h-c=
3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa84addb98f655f4c4=
2e1
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cbv514-1h-34uz-brya     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa85ec2881bde904c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cbv514-1h-=
34uz-brya.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cbv514-1h-=
34uz-brya.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa85ec2881bde904c4=
2ee
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa846ddb98f655f4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa846ddb98f655f4c4=
2db
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi5-brask    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa85fddb98f655f4c42f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi5-brask.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-chromebox-=
cxi5-brask.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa85fddb98f655f4c4=
2f2
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cp514-3wh-r0qs-guybrush | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa8c8107de274794c42ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-acer-cp514-3wh-=
r0qs-guybrush.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa8c8107de274794c4=
300
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa84f98ddae06f14c42ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C433TA-AJ0=
005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C433TA-AJ0=
005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa84f98ddae06f14c4=
2ee
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa85fddb98f655f4c42f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C436FA-Fli=
p-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-C436FA-Fli=
p-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa85fddb98f655f4c4=
2f5
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa9697e03b5f67e4c42dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-cx9400-vol=
teer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-asus-cx9400-vol=
teer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa9697e03b5f67e4c4=
2dd
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa997bd04e8e82b4c4303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa997bd04e8e82b4c4=
304
        failing since 277 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa862ddb98f655f4c42fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa862ddb98f655f4c4=
2fb
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa89848c56eee234c42fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-dell-latitude-5=
400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa89848c56eee234c4=
2fc
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa97500268c58144c42de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-11A-G6-EE-gr=
unt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa97500268c58144c4=
2df
        failing since 8 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa9eafb972461914c42f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-14-db0003na-=
grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa9eafb972461914c4=
2f4
        failing since 8 days (last pass: next-20240226, first fail: next-20=
240228) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa899107de274794c42eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-12b-ca0=
010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa899107de274794c4=
2ec
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+x86-board   | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa966f4a2b0bc784c4317

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-board
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-14-G1-s=
ona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/x86_=
64/x86_64_defconfig+x86-board/gcc-10/lab-collabora/baseline-hp-x360-14-G1-s=
ona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa966f4a2b0bc784c4=
318
        new failure (last pass: next-20240306) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa11d661b1a51dc4c42e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa11d661b1a51dc4c4=
2ea
        new failure (last pass: next-20240307) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-s90...libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa0a29fd223b8444c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-sm=
1-s905d3-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-sm=
1-s905d3-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa0a29fd223b8444c4=
2e5
        failing since 3 days (last pass: next-20240223, first fail: next-20=
240304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/65ea9e3393967f415f4c43c4

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65ea9e3393967f415f4c43df
        failing since 20 days (last pass: next-20240213, first fail: next-2=
0240216)

    2024-03-08T05:13:06.295465  <8>[   30.498341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-08T05:13:07.317105  /lava-12985251/1/../bin/lava-test-case

    2024-03-08T05:13:07.327438  <8>[   31.530373] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65ea9e3393967f415f4c43e0
        failing since 20 days (last pass: next-20240213, first fail: next-2=
0240216)

    2024-03-08T05:13:05.268780  <8>[   29.471568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-driver-present RESULT=3Dpass>

    2024-03-08T05:13:06.284793  /lava-12985251/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/65ea9f259e4990b2c54c4463

  Results:     27 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.armv8-pmu-a72-probed: https://kernelci.org/test/case/id=
/65ea9f259e4990b2c54c447e
        failing since 21 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-08T05:17:02.911333  <8>[   32.176564] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a53-probed RESULT=3Dfail>

    2024-03-08T05:17:03.930675  /lava-12985327/1/../bin/lava-test-case

    2024-03-08T05:17:03.941570  <8>[   33.208455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Darmv8-pmu-a72-probed RESULT=3Dfail>
   =


  * baseline.bootrr.armv8-pmu-a53-probed: https://kernelci.org/test/case/id=
/65ea9f259e4990b2c54c447f
        failing since 21 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-08T05:17:02.899652  /lava-12985327/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f213056e7c1404c467b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8192-=
asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ea9f213056e7c1404c4=
67c
        new failure (last pass: next-20240305) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8195-cherry-tomato-r2      | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f3800fcc88e5e4c4337

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8195-cherry-to=
mato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65ea9f3800fcc88e5e4c4340
        failing since 21 days (last pass: next-20240214, first fail: next-2=
0240215)

    2024-03-08T05:16:35.845630  + set +x

    2024-03-08T05:16:35.848534  <8>[   18.264640] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 12985347_1.5.2.3.1>

    2024-03-08T05:16:35.957597  / # #

    2024-03-08T05:16:36.060214  export SHELL=3D/bin/sh

    2024-03-08T05:16:36.060983  #

    2024-03-08T05:16:36.162445  / # export SHELL=3D/bin/sh. /lava-12985347/=
environment

    2024-03-08T05:16:36.163203  =


    2024-03-08T05:16:36.163632  / # <6>[   18.528532] mediatek-drm-dp 1c500=
000.edp-tx: Failed to do AUX transfer: -110

    2024-03-08T05:16:36.265148  . /lava-12985347/environment/lava-12985347/=
bin/lava-test-runner /lava-12985347/1

    2024-03-08T05:16:36.266340  =

 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f83489577b09a4c42ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ea9f83489577b09a4c4=
2ef
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f70c76de8a1644c43d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ea9f70c76de8a1644c4=
3d3
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f7ac76de8a1644c43d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ea9f7ac76de8a1644c4=
3d8
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f61a3e43e93fc4c437b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ea9f61a3e43e93fc4c4=
37c
        failing since 3 days (last pass: next-20240226, first fail: next-20=
240304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65eaa384355677dfb14c42e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eaa384355677dfb14c4=
2e5
        new failure (last pass: next-20240307) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65eab7ec43bf5d34854c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65eab7ec43bf5d34854c4=
2db
        new failure (last pass: next-20240307) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9e298c963c77994c430f

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/65ea9e298c963c77994c4330
        new failure (last pass: next-20240305)

    2024-03-08T05:12:43.552016  /lava-12985241/1/../bin/lava-test-case

    2024-03-08T05:12:43.562077  <8>[   32.481276] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9f4c1897b77f9d4c439d

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/65ea9f4c1897b77f9d4c43be
        new failure (last pass: next-20240305)

    2024-03-08T05:16:50.381049  /lava-12985397/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65ea9fedd1e9fc31434c43bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65ea9fedd1e9fc31434c4=
3bd
        new failure (last pass: next-20240305) =

 =20

