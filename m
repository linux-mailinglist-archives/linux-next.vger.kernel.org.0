Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013637A5AE8
	for <lists+linux-next@lfdr.de>; Tue, 19 Sep 2023 09:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbjISHaw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Sep 2023 03:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjISHav (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Sep 2023 03:30:51 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BDCFC
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 00:30:43 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-564af0ac494so3881168a12.0
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695108642; x=1695713442; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zCKhOrfWJcdVmdNyTcqfXaBk4GhEfnU5a8sfeQKqMF8=;
        b=kO7WBMGAfQXxBqCHGYW56D12yGo0os/GyJvib4D44c4PQZoJecOXpf8J06YWL14eYA
         4MaEYrwiduNs8L45GpccqVvAjBb3cglSTLNmaIxq24YbQo7B6dfL/iT3YbWGBSCdeXlx
         275QvLJi1enVRq2A8MSvoiMZeK7AQYcngTf0XtSpYhbu+quHVefHV3Bb4CoDqgTRxBKX
         vnemsvutFFy9vjcrAyrzLxeAx5TDH1kYJ8z9joei3v/g3hSOG7XxUNcY88oj+HFY3fPM
         WBhE6ukap2OlV1d6QNKF0PQmtMPFPyMVLuEaTdt2NTZMo7MexRZzqODfWOhkcH6jwUli
         j0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695108642; x=1695713442;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCKhOrfWJcdVmdNyTcqfXaBk4GhEfnU5a8sfeQKqMF8=;
        b=D9P2oyNnO8TNzCt+qqoS1mdUoITzQ742Rhtt31xqH5usuwbObKj+JWo0SILmHKYbre
         VFtganmlgniWALiv2HU+3rBdl+Q/Tn86xZcpT51pyolyhFi0pOTwVjg+FRpgE8wkVn1g
         9AxuiZNysWDFm6KwzC8ZG1SVn641VX9MeZJy0RuG499T7cvKiy29/iO3f1H4NkjoYJPu
         FXksOegaOj/vyZU3QoK+BWnbj/aqfsngu++62QlCH5vgU5Do9jvWu/w048JJ01WQbszO
         8iJCLKUciHYfJpMp6CV68YrRRP3+6UKg2Mj05KlTVobpO0eHHbiGcCo63D5MulLoSk43
         81EQ==
X-Gm-Message-State: AOJu0Yy6LGu4WyAzU6zzOFKigFp/Cyj1SK7YFktZxJ7TLmRwgGFpnAky
        y5zaV6nnQTGLAmtsRyDbTHwffYZwFiGzu3neE3eeeQ==
X-Google-Smtp-Source: AGHT+IH5dt7fq+iJonwCS7i6e6E96NdrUonWW6FRMhevEtQZ0m3nQR54vT/fiI8xRVjOKYX8pFhqpw==
X-Received: by 2002:a05:6a21:608:b0:154:9943:7320 with SMTP id ll8-20020a056a21060800b0015499437320mr8995069pzb.28.1695108642357;
        Tue, 19 Sep 2023 00:30:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902ced200b001bba669a7eesm9370994plg.52.2023.09.19.00.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 00:30:41 -0700 (PDT)
Message-ID: <65094e21.170a0220.2ef9.1eb4@mx.google.com>
Date:   Tue, 19 Sep 2023 00:30:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-378-g8b1a1f0d8311
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 53 runs,
 2 regressions (v6.6-rc2-378-g8b1a1f0d8311)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 53 runs, 2 regressions (v6.6-rc2-378-g8b1a1f0d=
8311)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
imx8mp-evk        | arm64 | lab-broonie   | gcc-10   | defconfig | 1       =
   =

rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc2-378-g8b1a1f0d8311/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc2-378-g8b1a1f0d8311
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8b1a1f0d83112d21cc4216344b11ebcc06c293af =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
imx8mp-evk        | arm64 | lab-broonie   | gcc-10   | defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/65091be2b86f5d3b9c8a0ad7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-37=
8-g8b1a1f0d8311/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-37=
8-g8b1a1f0d8311/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65091be2b86f5d3b9c8a0ae0
        failing since 14 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-19T03:55:52.039448  + set<8>[   27.745575] <LAVA_SIGNAL_ENDRUN =
0_dmesg 116399_1.5.2.4.1>
    2023-09-19T03:55:52.039885   +x
    2023-09-19T03:55:52.155181  / # #
    2023-09-19T03:55:53.321243  export SHELL=3D/bin/sh
    2023-09-19T03:55:53.327376  #
    2023-09-19T03:55:54.826040  / # export SHELL=3D/bin/sh. /lava-116399/en=
vironment
    2023-09-19T03:55:54.832107  =

    2023-09-19T03:55:57.555588  / # . /lava-116399/environment/lava-116399/=
bin/lava-test-runner /lava-116399/1
    2023-09-19T03:55:57.562359  =

    2023-09-19T03:55:57.574641  / # /lava-116399/bin/lava-test-runner /lava=
-116399/1 =

    ... (12 line(s) more)  =

 =



platform          | arch  | lab           | compiler | defconfig | regressi=
ons
------------------+-------+---------------+----------+-----------+---------=
---
rk3399-rock-pi-4b | arm64 | lab-collabora | gcc-10   | defconfig | 1       =
   =


  Details:     https://kernelci.org/test/plan/id/65091cbd05ee2d5d798a0a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-37=
8-g8b1a1f0d8311/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-37=
8-g8b1a1f0d8311/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65091cbd05ee2d5d798a0=
a5a
        new failure (last pass: v6.6-rc2-351-g529304bb5b40) =

 =20
