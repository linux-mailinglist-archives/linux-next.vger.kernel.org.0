Return-Path: <linux-next+bounces-1636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0048A87BDD9
	for <lists+linux-next@lfdr.de>; Thu, 14 Mar 2024 14:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA37F283B2C
	for <lists+linux-next@lfdr.de>; Thu, 14 Mar 2024 13:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8A31E874;
	Thu, 14 Mar 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="E9lzrNcv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DDF4691
	for <linux-next@vger.kernel.org>; Thu, 14 Mar 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710423482; cv=none; b=RC9EPgESC0yMxUBOVJRHl7n6Vxkltz1q6aoOxssgTGU59WlZFE2HvR7D7mONYcmUcKMst3jy1UEz2UUfQBev8qn2AVGddc9rh6iz9RPpzMYkRB4dXKWo8MuL51lGk9odZ42fqaqK4tA/vDZFMOlkLrA6yba9VTk0swt2vElcs7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710423482; c=relaxed/simple;
	bh=12Q0e90NaBEZBcs8J6QsDli4SY39UEsM1+sZp3e5sXE=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=pii5Y7jv0kaOyT5bNB+X94zDq1mUWhMyYzgfWAof++CQI1Wll+HuW8e/FRwW/OmiBRNZa0b4VcvaIbe14tRtodZqVPjraaU/wbJ15Wyh75VBFaLMXnDsZBdYq8jYbhCmg/z6lblSF7hyfsNDwy7ea9vzOGGh6MUFjgLXeUeNXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=E9lzrNcv; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6c0098328so862018b3a.3
        for <linux-next@vger.kernel.org>; Thu, 14 Mar 2024 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1710423479; x=1711028279; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U6X1mpeLQYqo15JhleV0uZEnDgXRvocNTGMiu4izW2k=;
        b=E9lzrNcvIBdPPrtS+bt1rVq8vAraZJ91K8wcvi3abTOoG7JK1s9cQ6zrnlhLakyX5d
         FWCzHHWOCaWoPQUCh9aXdZqO5ScBqT/Za/kKpVGlx/LsfCNoCmLeSsB6FUy973fAROmx
         l8qfFmtTl19koIoB9S4xttjVgaHPtkW0u9H3LXbrZXapVSXh/RIo7gx+63cfoqqSrpvY
         txi9iyIw/yMCEldIiBrr9UX/THACAvYBPdxjICfwEkwM69auAPKHpPDfRNQc8asH1Okm
         OYXM1/WkUsD/ru9mbEr58BFUUR0bnvczqowxaM2qdhu4WwO9X2Ac9ZxdMRTqkzECtrUd
         YmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423479; x=1711028279;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6X1mpeLQYqo15JhleV0uZEnDgXRvocNTGMiu4izW2k=;
        b=mFYNJCsluNwPO8RohAJDyh5UwnHXyJRMy2sgL4LCrjP3RiteC+OD03MS9fPQubYtmQ
         Offbw4q53nX7thoHnc89vQyyFmE016ozMlVmrn97H/k26Xfg8XoNFzQuon1HvPbWvGco
         yNIYr4JEySCBXIJnTfcbibyk3FRCKgkM+uPOMEaDyLkiDFJrqU0jDazxh3fgo8gBNLo2
         LOdyaaLMjj4TxLNmir3xe6Kl5NlcCiyqnPyFeaZ1yLzAphbUtMkpH/gKCZYevZ5vuDDw
         /JV1DSDE2FfHWdvj0SAh7n7HSrOlu3e5CvshDmgNT1g5ybDSiySmfz+XzO1Ak8v2j+pw
         ZM3w==
X-Gm-Message-State: AOJu0Yw3Wry3KVjnwJAIkmOKU3FCmAHsjOaZeNo1o0T2wzS/lfYIDKc+
	naJS3a9cvkOSlzuncS1jVQvBJ7wPkU1jZ0407aaUXXV/IKtMkVISzngVLU/4pbQbqiIQmzWUW3J
	v
X-Google-Smtp-Source: AGHT+IGJiQu72gtI7HvSdOvl8hqpSvo/Hb82ag8PhQIRjDDCyiAMmpWSVPhZxo5GjYncqxlqXa0yGA==
X-Received: by 2002:a05:6a00:170b:b0:6e6:97b9:1ec3 with SMTP id h11-20020a056a00170b00b006e697b91ec3mr1678240pfc.13.1710423479226;
        Thu, 14 Mar 2024 06:37:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n9-20020a63ee49000000b005dc4f9cecdcsm692094pgk.86.2024.03.14.06.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 06:37:58 -0700 (PDT)
Message-ID: <65f2fdb6.630a0220.e5bdb.178f@mx.google.com>
Date: Thu, 14 Mar 2024 06:37:58 -0700 (PDT)
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
X-Kernelci-Kernel: next-20240314
X-Kernelci-Report-Type: test
Subject: next/master baseline: 132 runs, 5 regressions (next-20240314)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 132 runs, 5 regressions (next-20240314)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | bcm2835_defconf=
ig            | 1          =

juno-uboot             | arm64 | lab-broonie   | gcc-10   | defconfig      =
              | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 1          =

meson-sm1-khadas-vim3l | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

r8a7743-iwg20d-q7      | arm   | lab-cip       | gcc-10   | shmobile_defcon=
fig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
240314/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20240314
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9bb9b28d0568991b1d63e66fe75afa5f97ad1156 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65f2b9bb7075265e224c42dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240314/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240314/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f2b9bb7075265e224c4=
2de
        failing since 283 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
juno-uboot             | arm64 | lab-broonie   | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f2bdfc92bf14748f4c42da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240314/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240314/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f2bdfc92bf14748f4c4=
2db
        failing since 8 days (last pass: next-20240229, first fail: next-20=
240305) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/65f2bd4e74b65ac74b4c4312

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240314/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240314/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65f2bd4e74b65ac74b4c4319
        failing since 20 days (last pass: next-20240221, first fail: next-2=
0240222)

    2024-03-14T09:02:44.765227  <8>[   20.379376] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 442999_1.5.2.4.1>
    2024-03-14T09:02:44.867915  / # #
    2024-03-14T09:02:44.969109  export SHELL=3D/bin/sh
    2024-03-14T09:02:44.969932  #
    2024-03-14T09:02:45.071108  / # export SHELL=3D/bin/sh. /lava-442999/en=
vironment
    2024-03-14T09:02:45.071464  =

    2024-03-14T09:02:45.172562  / # . /lava-442999/environment/lava-442999/=
bin/lava-test-runner /lava-442999/1
    2024-03-14T09:02:45.172983  =

    2024-03-14T09:02:45.179839  / # /lava-442999/bin/lava-test-runner /lava=
-442999/1
    2024-03-14T09:02:45.236065  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
meson-sm1-khadas-vim3l | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65f2c0340e51818a0f4c42db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240314/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240314/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f2c0340e51818a0f4c4=
2dc
        new failure (last pass: next-20240312) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a7743-iwg20d-q7      | arm   | lab-cip       | gcc-10   | shmobile_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65f2c46801a465833a4c42fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20240314/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20240314/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65f2c46801a465833a4c4=
2fd
        new failure (last pass: next-20240312) =

 =20

