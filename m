Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3599F44266F
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 05:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhKBEoN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 00:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhKBEoN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 00:44:13 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC9EC061714
        for <linux-next@vger.kernel.org>; Mon,  1 Nov 2021 21:41:38 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id r5so14106156pls.1
        for <linux-next@vger.kernel.org>; Mon, 01 Nov 2021 21:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zQ0TWqZNGxYLHQhh9OD83otHnViaVoWx6myHhCNSeW0=;
        b=zmSYQyn+GF6+cw2pfNziTzkYReRGYOgBiofDhj2h2j09E6SzMJWFt4Pl11sNINquwS
         rsj9Hv3QoHtMnZubnIBHezFHKxSlK4EqPIhRaI70j8yhVN2KDaqVQ72vNoUs6sPaTuzF
         uDSk9J1FOqJyRwdUD9JoUv9K4vxaJ9eP6M8dR6hBj1snXpNubD6MwR8oBItZ2kTWzP9s
         74f0ivMNU/6QjX94g9jSAo0yo9Nm2A/8zPMUuVqQuJAqOzqyzUl0SGOMXAkSpNmWVErT
         mRbf+Ri9+yQYPK59zm76je5+Jn27RUJbvE34jeoXiTtzmRUj11QunRgukTYjPGUuzXJa
         Jh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zQ0TWqZNGxYLHQhh9OD83otHnViaVoWx6myHhCNSeW0=;
        b=42F+cH8XgdIwNt88RW041IsBkfDZ9H3HJJjDIt0mnJnlmfdUJVMVrY0p4pdi4Tt87Q
         TtspCkRUJJ/l5+A1UA4dwUsQjyoF4O/XYXQ9EXnxTpkyWvzciuNRZGdw9zaobvl8caDa
         sRPgKdvGRCHmRrQAJ1zBuRTxR6F2gpUq/s9MARXVvE2C84TL3Pa4nTFTztbG0rFL3A4h
         Nrt3ZHPWYWAxX5XEMzhdN4vIlj/AVIcurotoSTwoGYUV8d9ZHLEV3xvvO9TEcqxEjfPQ
         rWSEmfm4cVoUMH2UFpeHVF1TRlHANiGwARxOmixSMdfngdsZYRgTeXYXtpM9CO7YN8rO
         rgFA==
X-Gm-Message-State: AOAM53156RpLuYwWukf4nIE+VQANmuOlL0Ac5TW9HCFsbrs4stZS1KbK
        xEpukEEy+sXzyXegazveaCEsviDGlpwYN6QO
X-Google-Smtp-Source: ABdhPJzXB9moqQZ2gc3e3QMkjBsgP5W+7NtaglpK2fJIfli6IexZgNkgCIUp+sWymFrGT6r5JNAMkg==
X-Received: by 2002:a17:902:e78f:b0:141:8bd3:8bcf with SMTP id cp15-20020a170902e78f00b001418bd38bcfmr28504530plb.56.1635828098074;
        Mon, 01 Nov 2021 21:41:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id oo9sm933344pjb.53.2021.11.01.21.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 21:41:37 -0700 (PDT)
Message-ID: <6180c181.1c69fb81.15f7b.3c6d@mx.google.com>
Date:   Mon, 01 Nov 2021 21:41:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-2033-g53a1f94bc3ad
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 354 runs,
 2 regressions (v5.15-2033-g53a1f94bc3ad)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 354 runs, 2 regressions (v5.15-2033-g53a1f94bc=
3ad)

Regressions Summary
-------------------

platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defc...CONF=
IG_SMP=3Dn | 1          =

rk3328-rock64     | arm64 | lab-baylibre  | gcc-10   | defconfig           =
         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-2033-g53a1f94bc3ad/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-2033-g53a1f94bc3ad
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      53a1f94bc3ad64cbcf2627251b640e858b591100 =



Test Regressions
---------------- =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
rk3288-veyron-jaq | arm   | lab-collabora | gcc-10   | multi_v7_defc...CONF=
IG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6180a757a5735016ba3358e7

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-2033-=
g53a1f94bc3ad/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/ba=
seline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-2033-=
g53a1f94bc3ad/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/ba=
seline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
6180a757a5735016ba335927
        new failure (last pass: v5.15-388-g75f097aa9969)

    2021-11-02T02:49:46.706096  /lava-4887173/1/../bin/lava-test-case<8>[  =
 12.047552] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =



platform          | arch  | lab           | compiler | defconfig           =
         | regressions
------------------+-------+---------------+----------+---------------------=
---------+------------
rk3328-rock64     | arm64 | lab-baylibre  | gcc-10   | defconfig           =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/61808e28f92ea2c4e933593d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-2033-=
g53a1f94bc3ad/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-2033-=
g53a1f94bc3ad/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61808e28f92ea2c4e9335=
93e
        failing since 5 days (last pass: v5.15-rc7-176-gbfbd58926fc5, first=
 fail: v5.15-rc7-202-gc79631111e0b) =

 =20
