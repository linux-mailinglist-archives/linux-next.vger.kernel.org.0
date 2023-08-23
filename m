Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498197852D6
	for <lists+linux-next@lfdr.de>; Wed, 23 Aug 2023 10:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbjHWIiI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Aug 2023 04:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbjHWIev (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2023 04:34:51 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7B01FE8
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 01:32:50 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-76d873c6e8aso356054985a.1
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 01:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692779569; x=1693384369;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+dYLei7AoLeYwnza3yaeaaYWuA3ZWQLjJtiXn15qvsg=;
        b=t3QDP237qlD0MHZGncV+RxLXjTG5QUjug3V65+/zT8LhNXMv4/UJDjFQiifuoJeLkg
         FOg54S1uP8Tv3dibYVMejaNePSMBgxWmpUs3o31bQ26a0mdexri/TbxND/6V0vtWdN17
         YsKq2UY6AL13WJIcxdmzTeS279KzvS7nyCQwfSSV8ZS4mA8dz8caSh0J7WsgasYSq2OS
         vnLCaPC4ezTuyMq1ozXlAv3bigqYhW0x+08Uq9bLktMlU2KHJHKGgTeexwqRLGln6EQ0
         HaKho13PQ/ewHLiExAAv2W/ijS510wO4BtZ1CYHNUcOnZwiFFYZEBRNBIn1ebx3N8b3N
         4N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692779569; x=1693384369;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dYLei7AoLeYwnza3yaeaaYWuA3ZWQLjJtiXn15qvsg=;
        b=hF3R2oFc3F/KJfKobTohqNvx8xvxGAtsuM3DrGyEgQ054gYDxwnpapBIS10yUQvlpL
         qtYt7wHeksIstoyQi3WKRvXOu6kBUU0ggszfrNvxm6N7j3Wyxz/YWBuPtJFjcF6Ly1U+
         BMZxImMAzHED/nzxnU0ASx9zFYqTkB4rgKoD/QVQSYxPNIv9FYfN4rP6KFa74cVdjXHX
         VpVfIF/g+1aA6A6YOHi5jY2Q3+nxPS3Y4/9DMKDfQ4nCr/3cAe3rvpuVlrDt6QwkScxj
         neqp/RXPoVhfxuHEmeSBd78MNMx4pzqdSo72B24FZrae3Ty4iJ7O1a0m7rm44QYFEqjt
         O6iQ==
X-Gm-Message-State: AOJu0YwlXzp59EK9kVZuAg2h9Ie4/pC/7u4L3tBSIKMNnUdqMCs67O9Y
        9haeTYYLzukdPX2FHVXtrRl4cIo4iNosb2Y7TB4=
X-Google-Smtp-Source: AGHT+IFUhCGa00l9vHs5BIJLnme7oKG5VFkpReX1B+5v7QYZYAyT/8O5Te8VT6Wk7jX8sBVQ58J7vA==
X-Received: by 2002:a05:620a:25d1:b0:76c:da86:3169 with SMTP id y17-20020a05620a25d100b0076cda863169mr13504911qko.40.1692779569582;
        Wed, 23 Aug 2023 01:32:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z19-20020a63e113000000b005646e6634dcsm9303970pgh.83.2023.08.23.01.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 01:32:49 -0700 (PDT)
Message-ID: <64e5c431.630a0220.f0c56.186f@mx.google.com>
Date:   Wed, 23 Aug 2023 01:32:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc7-148-g8221b76fd7de
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 58 runs,
 2 regressions (v6.5-rc7-148-g8221b76fd7de)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 58 runs, 2 regressions (v6.5-rc7-148-g8221b76f=
d7de)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

rk3399-rock-pi-4b        | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc7-148-g8221b76fd7de/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc7-148-g8221b76fd7de
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8221b76fd7defd16b9af1c0a505acbdcbe32e2f1 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64e59399b273f4e70cb1e41a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc7-14=
8-g8221b76fd7de/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc7-14=
8-g8221b76fd7de/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inno=
comm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e59399b273f4e70cb1e=
41b
        new failure (last pass: v6.5-rc7-128-g0b86d65557b6f) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
rk3399-rock-pi-4b        | arm64 | lab-collabora   | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64e594513d9df5c422b1e3b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc7-14=
8-g8221b76fd7de/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc7-14=
8-g8221b76fd7de/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e594513d9df5c422b1e=
3b9
        new failure (last pass: v6.5-rc7-128-g0b86d65557b6f) =

 =20
