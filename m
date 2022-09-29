Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39DE5F015C
	for <lists+linux-next@lfdr.de>; Fri, 30 Sep 2022 01:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiI2XZS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Sep 2022 19:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiI2XZQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2022 19:25:16 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC834DF19
        for <linux-next@vger.kernel.org>; Thu, 29 Sep 2022 16:25:14 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 3so2747869pga.1
        for <linux-next@vger.kernel.org>; Thu, 29 Sep 2022 16:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=2kiLUDevm0tQ5+aykMDenyVT4TErFYgqAkA15hzQEz8=;
        b=qIJMb3qtckudPpB9OGMXf+LIAiiLFSvAB45V8qI9ZbrNO0gCBrGQWWEcfKiFi+SY5h
         h4eLntEBuSAo/C+my8++URcNnkraDP0iKcbXbWxB2OlwY7KSBEO+xUucJGhmyFd6HnhC
         r9+OeGW+IGYkG2sx9e+PGExxgdmxgle6sA/06hU5qQAdt3uknDNnLb+gyzMBu/xDg3TJ
         bwD4VUNdFnPwJAAQMIKmTA71a/RUYTS+h3ynzBNDXBmeCKGeuPGD9v7Oyw1cMFyDMzEo
         b7iU6PpV5QvS6k67lXrtdqIb4qUh/gAZT6VLhscg6NoWts0AMpZ/B2LDgx1DpLFYZFSO
         xo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=2kiLUDevm0tQ5+aykMDenyVT4TErFYgqAkA15hzQEz8=;
        b=bHw00UXV/58uhTNzGz+oD8LMC52KZpxBCbJvAP7m8+CqmlJfKn8T315TLjf4Q5t+Fp
         ZfUbuSrsN9N1jvmHYJc/2xuRqO8QIRzDr1ZFhVrCMaWdZWc34jlEv9qKLAdY9N31akwb
         BwZeAqSCw6zPkNfh6Ufhy9blyrFQ114ZSuQkjkwZTVG++I9Y+Zxk1tThMQsyHuSuy5IA
         +orRi9m4lPDmjyOm3zSwc1hyMF6z0pdPNhD5s8hqe8Anxm2hS142h0WfvHYT4Y7WWxTw
         GgdLwf48abdfjTTWLG+rX1mjkZfbqFwbnNb11O/hEL0p7XJY8HtQr+pqeUEz9Mgvebt2
         jF6Q==
X-Gm-Message-State: ACrzQf3GFUg2ivrOTfPrPEtZkSPSyprlIevA7SSMJYwkwzGuR14qrMQ8
        S3QUQ6FhLUE2swNgkrL4GF9kFWSNcGpYmv8vpZo=
X-Google-Smtp-Source: AMsMyM4+3Nn7NbWxHexJCHazCmQvTL8KfGQxPo9LwOBvKIVFIve9jDa6kH+0WpVgCO/YvLvj/OACAw==
X-Received: by 2002:a63:4d4:0:b0:438:ce28:757f with SMTP id 203-20020a6304d4000000b00438ce28757fmr5003233pge.441.1664493913831;
        Thu, 29 Sep 2022 16:25:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c7-20020a170903234700b001753cb9893csm429104plh.187.2022.09.29.16.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 16:25:13 -0700 (PDT)
Message-ID: <63362959.170a0220.abc2c.1276@mx.google.com>
Date:   Thu, 29 Sep 2022 16:25:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220929
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 129 runs, 6 regressions (next-20220929)
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

next/master baseline: 129 runs, 6 regressions (next-20220929)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
          | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | exynos_de=
fconfig   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig | 1          =

qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config    | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | tegra_def=
config    | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220929/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220929
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1c6c4f42b3de4f18ea96d62950d0e266ca35a055 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6335efc11df90fb511ec4eb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220929/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220929/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335efc11df90fb511ec4=
eb6
        failing since 0 day (last pass: next-20220927, first fail: next-202=
20928) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | exynos_de=
fconfig   | 1          =


  Details:     https://kernelci.org/test/plan/id/633604f9e7caa803c2ec4efd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220929/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220929/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/633604f9e7caa803c2ec4=
efe
        failing since 6 days (last pass: next-20220921, first fail: next-20=
220923) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6335ef0d6e5afb949eec4ea9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220929/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220929/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6335ef0d6e5afb949eec4=
eaa
        failing since 37 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
qemu_mips-malta              | mips  | lab-collabora | gcc-10   | malta_def=
config    | 1          =


  Details:     https://kernelci.org/test/plan/id/6335ef5634f473f87aec4ec3

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220929/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220929/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6335ef5634f473f=
87aec4ec7
        new failure (last pass: next-20220927)
        1 lines

    2022-09-29T19:17:37.032441  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-09-29T19:17:37.143046  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 2d4501cc, epc =3D=3D 8023ec18, ra =3D=
=3D 8023ebfc   =

 =



platform                     | arch  | lab           | compiler | defconfig=
          | regressions
-----------------------------+-------+---------------+----------+----------=
----------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-10   | tegra_def=
config    | 2          =


  Details:     https://kernelci.org/test/plan/id/6336023d7a624d1944ec4f55

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220929/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220929/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6336023d7a624d1=
944ec4f58
        failing since 0 day (last pass: next-20220921, first fail: next-202=
20928)
        45 lines

    2022-09-29T20:38:03.969879  kern  :alert : [00000000] *pgd=3Df7014835
    2022-09-29T20:38:03.970238  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c2f8e400 pointer offset 0 size 1024
    2022-09-29T20:38:03.980642  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0f54000 allocated at kernel_clone+0x8c/0x=
398
    2022-09-29T20:38:03.991850  kern  :alert : Register r2 information: NUL=
L pointer
    2022-09-29T20:38:03.992152  kern  :alert : Register r3 information:
    2022-09-29T20:38:04.002781  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c1709400 pointer offset 16 size 1024
    2022-09-29T20:38:04.014942  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf079000 allocated at load_module+0x99c/0x=
1e28
    2022-09-29T20:38:04.026132  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c2f8e400 pointer offset 0 size 1024
    2022-09-29T20:38:04.026493  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c35abe00 pointer offset 64 size 512
    2022-09-29T20:38:04.036714  kern  :alert : Register r8 information: sla=
b task_struct start c2ce61c0 pointer offset 0 =

    ... (42 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6336023d7a624d1=
944ec4f59
        failing since 0 day (last pass: next-20220921, first fail: next-202=
20928)
        16 lines

    2022-09-29T20:38:03.947620  kern  :alert : 8<--- cut here ---
    2022-09-29T20:38:03.958713  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00<8>[   59.848893] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-09-29T20:38:03.959166  000000   =

 =20
