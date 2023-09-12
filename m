Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE6579D35B
	for <lists+linux-next@lfdr.de>; Tue, 12 Sep 2023 16:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbjILOOX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Sep 2023 10:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjILOOW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Sep 2023 10:14:22 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904ECCF
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 07:14:18 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68fb5bd8f02so2209778b3a.0
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694528057; x=1695132857; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DjMZdB+55DZ/0J40TMA7EJLZ0Stgt5KMByqKTRk0v+w=;
        b=CB1fpr6XeYMgpvFycOsODaAxzKHt0fpZqGnf0yMuj3ZVa5pYytlTaZktSvEg4DIw/I
         ct0DgPpEzQ6dI9yHJdqxKVirulxG8IH2ecQbhrJDHq1gLK0aZkwZ6CMTuov2Q+Ujaf+N
         xNcGhc+nbCKa78HWw3WaegoFvObgH1nly45FboK+m2IsY2ZOKL59ch0f3EUOqfnw94qi
         PbFgNoNHzFriaZfmRQo6canCmCxZkvhBiwNE8xEyjUdCKZ+oU06apRTa7UcVRgvlV5Ms
         0PGIZmpyn+u6DAG6l39V5IEXy7RroS90YYrEsnrKXpMbbGr2RpAogyH5WYGxXZaSWajT
         3FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694528057; x=1695132857;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjMZdB+55DZ/0J40TMA7EJLZ0Stgt5KMByqKTRk0v+w=;
        b=SLOTIk80JqMuIrpy67isutntRHUyalEqixhBXTCNeiKD0FDxVRm6bqhNaMb12WysQz
         +3mehHI1khpcJtgA9TtbMJINXlDqCYsYRm0g4rFrwBPgSarNL6yJvSDBZupqynpdWlPr
         nnxxRVRzDfr1WTBAtRy1k4VorWic1I4CrOPHKsEdfCZK9CxYEnj2aaWec88/uyA2cgFa
         BKXg5ySC6thP4UXIdBfduWOVLO2rfVt7C+jTeipkjRjf6Wt0uxYblxYjYcCrN+f1jBv3
         Cu9mutbY/vzs4Jth3dPKiec3dFvQ0wLHYjFCG73MAfnZrZbAF8SYZk1xXnpuISKCs3GC
         4r0g==
X-Gm-Message-State: AOJu0Yz6z14YMKEHFsHzcx724mWmC/FLRM0kJLShS7zYeAKWlfwnUvxp
        GY3JSOjY3kmwMCkBr/g19OBSgSw86KxcAxfLGXY=
X-Google-Smtp-Source: AGHT+IHwP5hMQtuylojuZ59yjltHnfPKvt6NYtrmcoAP4+UeJnvIg3zKeYlFS3Z5lG+a2lVexoACqQ==
X-Received: by 2002:a17:90a:9113:b0:273:4b39:e5b9 with SMTP id k19-20020a17090a911300b002734b39e5b9mr10105520pjo.4.1694528057709;
        Tue, 12 Sep 2023 07:14:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ev1-20020a17090aeac100b00263b4b1255esm9254957pjb.51.2023.09.12.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:14:17 -0700 (PDT)
Message-ID: <65007239.170a0220.f90fd.8079@mx.google.com>
Date:   Tue, 12 Sep 2023 07:14:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-139-gf73758af4eb4
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 52 runs,
 1 regressions (v6.6-rc1-139-gf73758af4eb4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 52 runs, 1 regressions (v6.6-rc1-139-gf73758af=
4eb4)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc1-139-gf73758af4eb4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc1-139-gf73758af4eb4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f73758af4eb4e17b2a02b7c63f0bdc31e9e5db7c =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65004178f4357408e48a0b17

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-13=
9-gf73758af4eb4/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc1-13=
9-gf73758af4eb4/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65004178f4357408e48a0b20
        failing since 7 days (last pass: v6.5-5353-gb22935905f9c, first fai=
l: v6.5-12059-g16fdf769151b)

    2023-09-12T10:46:01.877811  + set<8>[   27.649898] <LAVA_SIGNAL_ENDRUN =
0_dmesg 102278_1.5.2.4.1>
    2023-09-12T10:46:01.878568   +x
    2023-09-12T10:46:01.987320  / # #
    2023-09-12T10:46:03.153279  export SHELL=3D/bin/sh
    2023-09-12T10:46:03.159397  #
    2023-09-12T10:46:04.657601  / # export SHELL=3D/bin/sh. /lava-102278/en=
vironment
    2023-09-12T10:46:04.663692  =

    2023-09-12T10:46:07.382577  / # . /lava-102278/environment/lava-102278/=
bin/lava-test-runner /lava-102278/1
    2023-09-12T10:46:07.389328  =

    2023-09-12T10:46:07.396289  / # /lava-102278/bin/lava-test-runner /lava=
-102278/1 =

    ... (12 line(s) more)  =

 =20
