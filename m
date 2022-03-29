Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02AFF4EA797
	for <lists+linux-next@lfdr.de>; Tue, 29 Mar 2022 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbiC2GBS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Mar 2022 02:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiC2GBR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Mar 2022 02:01:17 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9548733EAA
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 22:59:34 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y10so11625754pfa.7
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 22:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ndAH/97JY6gt+PzL3QVMcSLLQYPrxTKxr27i9nXNwS8=;
        b=1wq0Nx/q85YlsmisdSqGfkrS+GbVol9mr2kquPMmyDrw3HO6i582M59pVZJp5y+IwL
         MFPQ1CledA9lXHsv40By+3jqE/l+5fr8d0X/OHB0b3VohSvaFlxzjSs4GggxjACK/Q9j
         CS4sQkYuELATPYRm946+0R+sB8EA3JUwAtpqAr4s8b0B/SEo7ltYH+fb9746MTl+wX69
         dKvzLPSlwc8yBBI2yuHCf0Ql0JjxE7z2vTSt/lYRKx6r1zli0oP1Om9FmpV0xpeZtpO1
         qoViJE6hPbC9PbncI1O91A/l+LzUym84Ag0gdp7yqHfV+6NWYjqI0tMofxD/57ow+BT0
         cTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ndAH/97JY6gt+PzL3QVMcSLLQYPrxTKxr27i9nXNwS8=;
        b=vcAqW+oI421Uu9EMZtJZhg0lNfk1lCAOs1HuPGJ+0E9Qnwu6WYYrzWQzqUtrIe9XWe
         NtYcuGlaVWJG/vhU6JZPOgRUpyh1P99oZhg8actoei3GNo4Ujd0QdDHsAk+6RE1lAW74
         +IQlUjo3voWXi6M6/ulX+2Sp4y4c90rIP4EQBvnZclTny4uRJwPHK5mGgXz0lPmCreVo
         OqvbjCyPp8w+4nQXrzE0R3Y/OpKG1/FJy+ghyJ8yU0e+cm3l3j2rFDvp06QAuWU5ai90
         8GvDj1MOunhrmIcmX1BM2FnG7BWhdE6YKD1aE4MozdfL7q49LCng/974MKrFXcClW+Wd
         7nAA==
X-Gm-Message-State: AOAM531xDwpWyswW4Hs996Cfam3BsQCXD9srs6PARO05koktjK8vyaYP
        H44dw52wj5JBH4llfrpN/Vz0jNF7mTEtaWK020A=
X-Google-Smtp-Source: ABdhPJwyRmn+V0kHi4+EuN+QozcVEq+RMrBvdfUNHrf7JmXSTAzZeVyrQXBLBOiAkXMnTQMqBZfRfg==
X-Received: by 2002:a65:6941:0:b0:381:fea7:f3d8 with SMTP id w1-20020a656941000000b00381fea7f3d8mr848692pgq.235.1648533573882;
        Mon, 28 Mar 2022 22:59:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w79-20020a627b52000000b004fd8d1e5489sm256702pfc.87.2022.03.28.22.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 22:59:33 -0700 (PDT)
Message-ID: <6242a045.1c69fb81.8897f.06c2@mx.google.com>
Date:   Mon, 28 Mar 2022 22:59:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-12935-gafa5b5041c02
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 329 runs,
 5 regressions (v5.17-12935-gafa5b5041c02)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 329 runs, 5 regressions (v5.17-12935-gafa5b504=
1c02)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-12935-gafa5b5041c02/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-12935-gafa5b5041c02
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      afa5b5041c02d7d802e884511e7fa8a65c67abfc =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62426f80ddd2462f47ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62426f80ddd2462f47ae0=
67d
        failing since 13 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624274e680f31653c3ae0697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624274e680f31653c3ae0=
698
        failing since 13 days (last pass: v5.17-rc7-200-gfb8a41b34095, firs=
t fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6242829b183fc10fccae0687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6242829b183fc10fccae0=
688
        failing since 14 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624286317f2d8c9ff7ae06cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624286317f2d8c9ff7ae0=
6ce
        failing since 13 days (last pass: v5.17-rc7-200-gfb8a41b34095, firs=
t fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624262be3da276f7ebae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-12935=
-gafa5b5041c02/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624262be3da276f7ebae0=
67d
        new failure (last pass: v5.17-11526-gd877adea8dd9) =

 =20
