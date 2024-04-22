Return-Path: <linux-next+bounces-1994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3558AC333
	for <lists+linux-next@lfdr.de>; Mon, 22 Apr 2024 05:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFD261C20869
	for <lists+linux-next@lfdr.de>; Mon, 22 Apr 2024 03:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729EBFBEA;
	Mon, 22 Apr 2024 03:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZU/CR/J2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E4FBE8
	for <linux-next@vger.kernel.org>; Mon, 22 Apr 2024 03:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713757587; cv=none; b=t5vrPcwnAWfqwz1dg9GCskWomOTyHYb0RJ1Xt8FVnC7AUFd6bKIJNCfCwlNfdjNftGrZfoC/doUYSEXvWAp+7FHCM9vwbQ5apB8IrYl45HS8uZQSjM5MJ7T5+NYkreMoPXFhclW581ov0FdLh0RzkU9GKLxcYj5M/YhMATt8W+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713757587; c=relaxed/simple;
	bh=xxXoG8aiVS1NPuH4NHCo8CS29fTi6HhPWwQ6EgGeahY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=W2QC1Z+PSNqteL3ujrYVqsebupELwhgTgDcaIO9KwwMbmyQigkIjnugSDhJypg7bjGQtNP5VryY/BlK9q0c6rYCjRdDVSCHt07B9R6CuQtQEPRZeS92b9B/EebpK06GbfnsIbtGqhjMChLcqkKYv76emQpcY/AKaZJWgOQPbscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZU/CR/J2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ecee1f325bso3209888b3a.2
        for <linux-next@vger.kernel.org>; Sun, 21 Apr 2024 20:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1713757585; x=1714362385; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j3OJXzqCYdLbNg3b0oAT5IOGMhJBVUV1qh8R7SX9VRU=;
        b=ZU/CR/J2ULXp8BRm/v5Wg3OKcJaXEE+WS/g1mST7MCWL8KHU0PxjsP35x7EDOFTx7r
         icklmKYImTSQDluowky7Wi1ue0W+ODOzFzjKJpw2FWhZqOE+Jzy9wm9+qO1aDdXTx0jn
         zgGE4tS8VSpr9Uy2fZmYQd9a4gKfBoXfGWuB6LlsKgwIDPsw6wvZ+h3zPw7zuYmF822y
         eLC/jkK4DAaz8+nEMUdu+NTRwVzRH8CCyzMwrtTwKJ5AYC2JV6RogUp4B51ZgyTBlWgo
         3pwCNaeM+f2LyMvJus4ZSAxrG1T5ENba3tG+GHwIYrjU9k8xLS0YfprGzKqR/zevQIYX
         Ihmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713757585; x=1714362385;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3OJXzqCYdLbNg3b0oAT5IOGMhJBVUV1qh8R7SX9VRU=;
        b=PsOwtyNcDjcvAkOaieXEgBsSBdF0fwTUZ1KzVEqA/Mi2h5rm0v4dkYSxMsFi2PuK3k
         bnK2HeurQCp/hHII9sCOdkQHYB/YHjTcsLTBlMKZ1qupSkhB/ZnECP4zCgXNH6HsuNZB
         1WEaHMEzrUM8t/5ro4s1bJquRnOXuPVLnI6dJsMLRWga3mO9hFlEpPSfBgSxZzz2SpI7
         BnSNquucgLrg9yBMW4kts3wIXQEVVae7ge9KBj+WqJBzasQf5rtod+YSGTe3/l6nZd7F
         tQp+9bFM4Q0gqFPQWOYJgKpxYMKsDsNM7ERZqMnrDZtJr3AJejqgJ+WYxAjY4nHFMv0j
         kqYg==
X-Gm-Message-State: AOJu0YzJJ6e+luYGM2NfXdAvmXyYVYa6LSIG5EhFl9MliWhWD8NVLC4h
	el7Tnze3ZbgCuA2g/wWfhUPcpVXxtnDcUt2+DZIO9iInhuYpt4SkNoCGe5/2nJCENljXjh0Ecvu
	w
X-Google-Smtp-Source: AGHT+IFJJOgJ6sY5ta1SL8iNHub5Z2TNkMdqtyDi7bBlhyDfFqZBF9SAIFD44f+EuKjrQyLB/inIDA==
X-Received: by 2002:a05:6a00:1401:b0:6ec:db05:36d2 with SMTP id l1-20020a056a00140100b006ecdb0536d2mr13738604pfu.4.1713757584742;
        Sun, 21 Apr 2024 20:46:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fa34-20020a056a002d2200b006e5571be110sm6792113pfb.214.2024.04.21.20.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 20:46:24 -0700 (PDT)
Message-ID: <6625dd90.050a0220.970b4.780f@mx.google.com>
Date: Sun, 21 Apr 2024 20:46:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.9-rc5-180-ga8bde578ceefc
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 83 runs,
 3 regressions (v6.9-rc5-180-ga8bde578ceefc)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes baseline: 83 runs, 3 regressions (v6.9-rc5-180-ga8bde578=
ceefc)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
beaglebone-black      | arm   | lab-cip      | gcc-10   | multi_v7_defconfi=
g | 1          =

jetson-tk1            | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig        =
  | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.9-rc5-180-ga8bde578ceefc/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.9-rc5-180-ga8bde578ceefc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a8bde578ceefc2a1b029ea8748d14ca341248e7b =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
beaglebone-black      | arm   | lab-cip      | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6625ad37a374f16bf04c42db

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-18=
0-ga8bde578ceefc/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-18=
0-ga8bde578ceefc/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/6625ad37a374f16b=
f04c42e0
        new failure (last pass: v6.9-rc4-348-g59f179085dbf)
        1 lines

    2024-04-22T00:19:58.997243  / # =

    2024-04-22T00:19:59.008761  =

    2024-04-22T00:19:59.110427  / # #
    2024-04-22T00:19:59.120665  #
    2024-04-22T00:19:59.221473  / # export SHELL=3D/bin/sh
    2024-04-22T00:19:59.232694  export SHELL=3D/bin/sh
    2024-04-22T00:19:59.333377  / # . /lava-1122903/environment
    2024-04-22T00:19:59.344563  . /lava-1122903/environment
    2024-04-22T00:19:59.445231  / # /lava-1122903/bin/lava-test-runner /lav=
a-1122903/0
    2024-04-22T00:19:59.456494  /lava-1122903/bin/lava-test-runner /lava-11=
22903/0 =

    ... (9 line(s) more)  =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
jetson-tk1            | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/6625acb25f16a706374c42fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-18=
0-ga8bde578ceefc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-18=
0-ga8bde578ceefc/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson=
-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6625acb25f16a706374c4=
2fc
        failing since 27 days (last pass: v6.8-7223-gd5f8ee808c59, first fa=
il: v6.9-rc1-83-g2c54eea3a68ea) =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron  | gcc-10   | defconfig        =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/6625acc12b1b8dbaf74c42ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-18=
0-ga8bde578ceefc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.9-rc5-18=
0-ga8bde578ceefc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230703.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6625acc12b1b8dbaf74c4=
2ef
        new failure (last pass: v6.9-rc4-426-gfc92a30222b8e) =

 =20

