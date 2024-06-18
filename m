Return-Path: <linux-next+bounces-2594-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4822F90DC37
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 21:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0640B281D51
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 19:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFCE15ECF9;
	Tue, 18 Jun 2024 19:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fbQZvJir"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422531BF50
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737909; cv=none; b=H6o4sgaft2KKFItMJSjC/LImWHA2gU6e8bA/UGixri9aTDztc3LhtZncCpDyxBZIy4WhvcZLAfnCDpVnvIyMlB9g7WMoH3SVvZvXP4pCTvDCSvuuvXy+9uQsbtg3yD58jL1XgiOrLGTKdOvE0Aewwlauviz0Z6N89J9iXmZogx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737909; c=relaxed/simple;
	bh=c8ka4keqSLIkUt6Qko0TKLAqYtvEsUlM2PCgCUIIFcM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=r8IkhcDheUSm3XPK9iHG+wD/tsR+eApEwcKzwCwL49qi3Y++c4nUp3knZVsktDzG8kAxvLzLjKK7uTciejw6oNRl3hEVG84y4DqJTGiM6LrY9kLWBwrifAY9iGXejrzZkF6ePR9ZODPNM8RA/wHF5mFZ2NS91Ib7MuslxIjhp3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fbQZvJir; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-706264e1692so533751b3a.1
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718737907; x=1719342707; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n7kB1WSfoPE3MK0ZRlPHrKD9fK22Q/19b0P+5J2vIPQ=;
        b=fbQZvJirj2JQgTd3t03WmS3oRwU9Cg4IN0X6w75UooMZvlDWh2b2yJm6rM8xH7zJAW
         h3pcmzfeZt7HclA1Lj7u9J1sQKX/fb/EajUwsG8B6QKBf34xjDTe1em5Enc0hBoHFUIH
         aSiGQIUDrIuCZsSCjC9ueerX2nEnj+UhoSXnp43OYPb/bo/rf53shBwlNC+xI8yTohp0
         H/bE8qaQoohZhedZ3cFnIyBrrEwgfBrXt+Jmw8FEgYFwIqeRVOpuIMP2Sx40Z1sV8xdD
         VH/9EuP9u0akAQwoRJn/8gLqR7ilUNfrq060wn2kLPfmz5a1Yd80OqMp8Q0vYCr8DIol
         kFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718737907; x=1719342707;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7kB1WSfoPE3MK0ZRlPHrKD9fK22Q/19b0P+5J2vIPQ=;
        b=csP8hsheKsC+2jaIn9N/PR0XwJVJftNMAbvZrhkSTN7ifNp1RTzK2PCgtGC9kiS8q6
         aWbk8f/hzCts0fJoM4lrfRq8azDgK4Gbsy+smVxhtmphOgMP2TgMrBFbrMyK1rEaDXRR
         rt5Q+bSR7qzyXd69iir74unPij2D3klRbu0zk1+0aphIR5+Efglvr33pk6kniyJzCaZc
         1F3dqtvyRUabWcpohTM7iF/dP0tslRPLyFFw/3jM8Oe9zy3iogaZd9wbh4kAV32zQeIq
         GWeLw8jueeUD3L2KhHZE265SrPQvnFUhmmH+nHXSOiBftWcq832H9lzRWzGDkiEU4+9m
         PY1Q==
X-Gm-Message-State: AOJu0YzfHz4hJoIhCEpWbbkT1DPQZK5nmMMCLwtmho18T2deC2Gxal9S
	DH4lw8zG+IFuAGJesALUCZvPWyRerDa5DL4YgDkQDijU1rpi3f5xCKk4pVYRvaGzNHe+cqRwiHW
	e1d2thfBX
X-Google-Smtp-Source: AGHT+IH9wk3r26GXxsDY0kWUrqlEGjtSzDXM9+5xXLnxbVtGLYOUXDKdUVmiAQ1YeRemsri7Q/mYUg==
X-Received: by 2002:a05:6a20:a128:b0:1b8:c2b0:fda2 with SMTP id adf61e73a8af0-1bcbb5d35abmr618150637.43.1718737907021;
        Tue, 18 Jun 2024 12:11:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee3ba489csm8492461a12.87.2024.06.18.12.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 12:11:46 -0700 (PDT)
Message-ID: <6671dbf2.630a0220.6745d.7ca4@mx.google.com>
Date: Tue, 18 Jun 2024 12:11:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc4-262-g1ce98b2c2d5b0
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 77 runs,
 2 regressions (v6.10-rc4-262-g1ce98b2c2d5b0)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 77 runs, 2 regressions (v6.10-rc4-262-g1ce98b2=
c2d5b0)

Regressions Summary
-------------------

platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
beaglebone-black | arm  | lab-cip      | gcc-10   | multi_v7_defconfig | 1 =
         =

jetson-tk1       | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.10-rc4-262-g1ce98b2c2d5b0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.10-rc4-262-g1ce98b2c2d5b0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1ce98b2c2d5b02485349f988412fc240eb62b76f =



Test Regressions
---------------- =



platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
beaglebone-black | arm  | lab-cip      | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6671aeb7460e9f686b7e7088

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
62-g1ce98b2c2d5b0/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
62-g1ce98b2c2d5b0/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone=
-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6671aeb7460e9f68=
6b7e708d
        new failure (last pass: v6.3-10703-gb3f869e79cdf0)
        1 lines

    2024-06-18T15:58:31.839746  / # =

    2024-06-18T15:58:31.847491  =

    2024-06-18T15:58:31.950792  / # #
    2024-06-18T15:58:31.959672  #
    2024-06-18T15:58:32.061538  / # export SHELL=3D/bin/sh
    2024-06-18T15:58:32.071671  export SHELL=3D/bin/sh
    2024-06-18T15:58:32.173278  / # . /lava-1151985/environment
    2024-06-18T15:58:32.183634  . /lava-1151985/environment
    2024-06-18T15:58:32.285425  / # /lava-1151985/bin/lava-test-runner /lav=
a-1151985/0
    2024-06-18T15:58:32.295410  /lava-1151985/bin/lava-test-runner /lava-11=
51985/0 =

    ... (9 line(s) more)  =

 =



platform         | arch | lab          | compiler | defconfig          | re=
gressions
-----------------+------+--------------+----------+--------------------+---=
---------
jetson-tk1       | arm  | lab-baylibre | gcc-10   | multi_v7_defconfig | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/6671ab4a5595b19e707e70d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
62-g1ce98b2c2d5b0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.10-rc4-2=
62-g1ce98b2c2d5b0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6671ab4a5595b19e707e7=
0d1
        new failure (last pass: v6.3-10703-gb3f869e79cdf0) =

 =20

