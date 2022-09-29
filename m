Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3125EEBB4
	for <lists+linux-next@lfdr.de>; Thu, 29 Sep 2022 04:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbiI2C33 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Sep 2022 22:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbiI2C32 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2022 22:29:28 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9E111C165
        for <linux-next@vger.kernel.org>; Wed, 28 Sep 2022 19:29:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cv6so42906pjb.5
        for <linux-next@vger.kernel.org>; Wed, 28 Sep 2022 19:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=QzUpr47UULdX0l/xlmTdKe8lMY5jZpJ/arS8U5fnbdg=;
        b=qVaEkyAwCswHOygLsDDqSjvfb6aCuoFd3FDQcHhb+VB4bVN29+yOQFqFkarySZeWYf
         JxJwzkM2qRG4NEE5kKwUUQpCaVg21OBldBOwwCGSolebhqty0B1+MU3UUB9H5Tzyc0pl
         BHcksHlVMdCCXVwVaXlTpAs6Sxq5VvtUAm7nhgC+aEUIfhc+PbzEfzL4DtXUhoHzIdtx
         iULLc5Y218094GXXBjMEefw/yTZQXCk0SwsgFUapUHXsSpHQo9dFlfCba6ywjdmuj+qj
         NbV0PO9Bds9XgvlmnaVUYdRYvjxWc22s+l2OS/ln1ET+FHl2GLUQ7BryK4d8qHW4F9sc
         9XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=QzUpr47UULdX0l/xlmTdKe8lMY5jZpJ/arS8U5fnbdg=;
        b=2gFz2PsIOZKct9bRPOXEh/hyAVhY73ElD2+5O1x6ohpiVH7N4a12QwT/EPP9yf+Mye
         CVGm7Y709rgBPPpg7Gpt9l0W7VlPbv77wkkmaZKh7yQ2IvOHDzNh3xsQqXNZkyPJpQyD
         nDMSZgjtO/mI2SrQMiXGjHGnfGSk9m22oLC9QNcbJ9DVjZIhgnghK14PB+nBSil6Gkk+
         x1V2bBdaqdaqrTswdr390LuH7kZlEVURu18WBBiRSW8WNWgl+7neApQY9pz6QLNCKYxS
         DdYsEc7Zgiasz1URJylGjLeC/YE7Uhym02SQzp5mYB2cF4S6mFCK1vYV4Nm613pjuIEq
         M4Iw==
X-Gm-Message-State: ACrzQf0fGXLQgOdeTA9Jy/+O0CKSUszaIFpvEsa0vKKwrukenDWDVdM7
        7ItgQL3xy0Xd82Yl0o5RCJuNfUfzfBCT+PfW
X-Google-Smtp-Source: AMsMyM4t9q0vT1W3Ezhf6r6oSitUBovzbiiSKRDJI2YBFXSSfz2mTPSuxX5ChMeAWYltrjJJC+G6sw==
X-Received: by 2002:a17:90b:1b4c:b0:202:c05f:6e7b with SMTP id nv12-20020a17090b1b4c00b00202c05f6e7bmr1137975pjb.200.1664418566694;
        Wed, 28 Sep 2022 19:29:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r9-20020a635d09000000b004393cb720afsm4335567pgb.38.2022.09.28.19.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:29:25 -0700 (PDT)
Message-ID: <63350305.630a0220.42911.784c@mx.google.com>
Date:   Wed, 28 Sep 2022 19:29:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220928
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 144 runs, 6 regressions (next-20220928)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 144 runs, 6 regressions (next-20220928)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
          | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config    | 2          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | tegra_def=
config    | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220928/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220928
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      de90d455a35e474a184c898e66a6a108c3a99434 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6334cb0b192c365584ec4ec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220928/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220928/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6334cb0b192c365584ec4=
ec1
        new failure (last pass: next-20220927) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config    | 2          =


  Details:     https://kernelci.org/test/plan/id/6334d54585b3d30525ec4ea6

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220928/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220928/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6334d54585b3d30=
525ec4ea9
        new failure (last pass: next-20220921)
        45 lines

    2022-09-28T23:14:05.898173  kern  :alert : Register r3 information: NUL=
L pointer
    2022-09-28T23:14:05.898611  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c16ea400 pointer offset 16 size 1024
    2022-09-28T23:14:05.898998  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf000000 allocated at load_module+0x99c/0x=
1e28
    2022-09-28T23:14:05.899399  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c2a2d400 pointer offset 0 size 1024
    2022-09-28T23:14:05.937254  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2d0cc00 pointer offset 64 size 512
    2022-09-28T23:14:05.938434  kern  :alert : Register r8 information: sla=
b task_struct start c1d5eb40 pointer offset 0
    2022-09-28T23:14:05.938914  kern  :alert : Register r9 information: sla=
b kmalloc-512 start c2d0cc00 pointer offset 64 size 512
    2022-09-28T23:14:05.939322  kern  :alert : Register r10 information: NU=
LL pointer
    2022-09-28T23:14:05.939710  kern  :alert : Register r11 information: NU=
LL pointer
    2022-09-28T23:14:05.940138  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6334d54585b3d30=
525ec4eaa
        new failure (last pass: next-20220921)
        16 lines

    2022-09-28T23:14:05.851541  kern  :alert : 8<--- cut here ---
    2022-09-28T23:14:05.852924  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-09-28T23:14:05.853606  kern  :alert : [00000000] *pgd=3Df9e3c835
    2022-09-28T23:14:05.854092  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c2a2d400 pointer offset 0 size 1024
    2022-09-28T23:14:05.854551  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0cec000 allocated at kernel_clone+0x8c/0x=
398
    2022-09-28T23:14:05.894614  kern  :alert : Register r2 information: N<8=
>[   48.826573] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-09-28T23:14:05.895539  ULL pointer   =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6334c82793f88f4c77ec4eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220928/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220928/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6334c82793f88f4c77ec4=
eba
        failing since 36 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | tegra_def=
config    | 2          =


  Details:     https://kernelci.org/test/plan/id/6334d49334b70aa2d0ec4ebe

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220928/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220928/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6334d49434b70aa=
2d0ec4ec1
        new failure (last pass: next-20220921)
        45 lines

    2022-09-28T23:10:57.199712  lert : [00000000] *pgd=3Df743e835
    2022-09-28T23:10:57.200222  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c37fa800 pointer offset 0 size 1024
    2022-09-28T23:10:57.210252  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0f70000 allocated at kernel_clone+0x8c/0x=
398
    2022-09-28T23:10:57.221424  kern  :alert : Register r2 information: NUL=
L pointer
    2022-09-28T23:10:57.221930  kern  :alert : Register r3 information: NUL=
L pointer
    2022-09-28T23:10:57.232803  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c1709400 pointer offset 16 size 1024
    2022-09-28T23:10:57.243969  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf280000 allocated at load_module+0x99c/0x=
1e28
    2022-09-28T23:10:57.254604  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c37fa800 pointer offset 0 size 1024
    2022-09-28T23:10:57.255114  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2d6fe00 pointer offset 64 size 512
    2022-09-28T23:10:57.265785  kern  :alert : Register r8 information: sla=
b task_struct start c1cbc000 pointer offset 0 =

    ... (52 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6334d49434b70aa=
2d0ec4ec2
        new failure (last pass: next-20220921)
        16 lines

    2022-09-28T23:10:57.177925  kern  :alert : 8<--- cut here ---
    2022-09-28T23:10:57.178431  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2022-09-28T23:10:57.188809  kern  :a<8>[   59.866845] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =20
