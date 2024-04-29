Return-Path: <linux-next+bounces-2097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CE8B587C
	for <lists+linux-next@lfdr.de>; Mon, 29 Apr 2024 14:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C641F20F3E
	for <lists+linux-next@lfdr.de>; Mon, 29 Apr 2024 12:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F53134BF;
	Mon, 29 Apr 2024 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1O6Eo6jC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B883612D
	for <linux-next@vger.kernel.org>; Mon, 29 Apr 2024 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714393603; cv=none; b=OMYN7lpVDEYEu3X3AC8ByiOwW4jNYpws64HXGIsj2WRLtc5iEONk4jv5Nm4vwXeui5DX4zxPwAna403Zoc8Fe6yYsFynM+kd/XY444DgpFgjNfnYlMMdovCnQGutBD4BRHNWmSdOCTT80c/AjqDu3DTzdTgUBhCqevMVKshfyOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714393603; c=relaxed/simple;
	bh=I/334fDT/Vq6LKmyBdDZhIW3o9yE2f9LmvG1MjilOxg=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nI6FvRFfAcD5HhXXyj1psXzrnyTqKoUKYKTAnQYITj7xha/mZib/wzv9wBMCF8fcamgSCkmS/lHmtuZUJGukDUFBs/9K3IXrmwX4TSDgHrdJfAiIlYQyWzH4KG0HebzzgCpZ09fAYanTEMSiUjfUMh+XSQGarnADHmo/6QDXE5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1O6Eo6jC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e8f68f8e0dso30934195ad.3
        for <linux-next@vger.kernel.org>; Mon, 29 Apr 2024 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714393601; x=1714998401; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+kPpgMO7akQ1U0nI8eMh6tO8QHFeyMUwPtPOAr5q5ig=;
        b=1O6Eo6jC47z9WfVL0BGEtfWHhvIRu2f4hkS8smffQ6fuWgMsh0aF1sVC+zUlO9dZP1
         Yp3olzKwY7Ra/OdbgZF81EkTi8rf6tVt99XeOMkwRJDHMOYKbt82PmbsSDFLr8kkoXsX
         f6Oa23J5dQu0KMoOBqVwDmOLyV2qzqO+Gr7t7kw6yQMR+l4VFefuC/agkMf050pvuygU
         DIpsw33MNi8QqYniWeV7G32k+aHg/wScMChukiXEzIvJPWaPcwnqBambaELW8Cwt475M
         fRCRmhu39JxxNQngZq5QAYdu5zI+wg//7CE0XbFhVm0/AGLMmvVGStCmxfmKH7c4dnbr
         t56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714393601; x=1714998401;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kPpgMO7akQ1U0nI8eMh6tO8QHFeyMUwPtPOAr5q5ig=;
        b=pSftKfIp6+0YgBxiHu+CGWwz/fMYML870eJfL1RXlmEvTeu7eNU+50vW+ewzSXuCKN
         ZjdVGfSDd9SJlzgFoEnGaUzWYTH19+ZG922ZplO2apx54iKArtKsK4us4HSkP8huZoFH
         aCsEhvD3elIfM+L98MWETKWkiOfJYMGYnJlqSVSire3bBIzlJmCH9OJpv9CPcQXHg/1m
         Wjq3+0tqGrf/Xb2w9rGXqqF/ua5xeJUiteUOTiRfTcJ035jjwn3otyGTSCleraAtWmPN
         pSdHWx3c8Qwi5SPamdFv5GrSLhIAqHybG5qKmZSeBH2+UOU4ymQqhCQYmEitG/TXp0On
         8uNg==
X-Gm-Message-State: AOJu0Yx8mMYGeVDhP4J39R9OfFgSGKtyFUbp56ilfvjvuThzJnGrDDDJ
	krBlaynhRay+w3Bh836NfiWBcUB5Pv0Nwk00FFDEck+q/TH7yOyGB5e1x08/wg+KTpfXTYmWMu8
	XntI=
X-Google-Smtp-Source: AGHT+IGhubrNECK6BflfTF1yifYXskPyVJkvWBIrkPMwJvXoM9Zl7thp5TgZeLpGX3AB2JvLwr2l9g==
X-Received: by 2002:a17:903:120d:b0:1e4:5b89:dbfa with SMTP id l13-20020a170903120d00b001e45b89dbfamr6810871plh.41.1714393600753;
        Mon, 29 Apr 2024 05:26:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090322ca00b001e2086fddecsm5326605plg.139.2024.04.29.05.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:26:40 -0700 (PDT)
Message-ID: <662f9200.170a0220.42186.0739@mx.google.com>
Date: Mon, 29 Apr 2024 05:26:40 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240429
X-Kernelci-Report-Type: test
Subject: next/master baseline: 149 runs, 4 regressions (next-20240429)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 149 runs, 4 regressions (next-20240429)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-10   | sama5_defconfig  =
   | 1          =

bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
   | 1          =

beagle-xm             | arm  | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig | 1          =

beaglebone-black      | arm  | lab-cip       | clang-17 | multi_v7_defconfi=
g  | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240429/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240429
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b0a2c79c6f3590b74742cbbc76687014d47972d8 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-10   | sama5_defconfig  =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/662f5739915407f6614c42ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240429/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240429/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/662f5739915407f6614c4=
2f0
        failing since 453 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
bcm2836-rpi-2-b       | arm  | lab-collabora | gcc-10   | bcm2835_defconfig=
   | 1          =


  Details:     https://kernelci.org/test/plan/id/662f5ad2483ba06cb64c42f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240429/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240429/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/662f5ad2483ba06cb64c4=
2f7
        failing since 329 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
beagle-xm             | arm  | lab-baylibre  | gcc-10   | omap2plus_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/662f57db21cc7582da4c42e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240429/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240429/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/662f57db21cc7582da4c4=
2e3
        new failure (last pass: next-20240426) =

 =



platform              | arch | lab           | compiler | defconfig        =
   | regressions
----------------------+------+---------------+----------+------------------=
---+------------
beaglebone-black      | arm  | lab-cip       | clang-17 | multi_v7_defconfi=
g  | 1          =


  Details:     https://kernelci.org/test/plan/id/662f62338ec76574f84c431b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20240429/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240429/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/662f62338ec76574=
f84c431e
        new failure (last pass: next-20240426)
        1 lines

    2024-04-29T09:02:34.312107  / # =

    2024-04-29T09:02:34.323243  =

    2024-04-29T09:02:34.428270  / # #
    2024-04-29T09:02:34.435180  #
    2024-04-29T09:02:34.552837  / # export SHELL=3D/bin/sh
    2024-04-29T09:02:34.563069  export SHELL=3D/bin/sh
    2024-04-29T09:02:34.664872  / # . /lava-1126167/environment
    2024-04-29T09:02:34.674985  . /lava-1126167/environment
    2024-04-29T09:02:34.776938  / # /lava-1126167/bin/lava-test-runner /lav=
a-1126167/0
    2024-04-29T09:02:34.786775  /lava-1126167/bin/lava-test-runner /lava-11=
26167/0 =

    ... (9 line(s) more)  =

 =20

