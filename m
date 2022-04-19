Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E092F5072D5
	for <lists+linux-next@lfdr.de>; Tue, 19 Apr 2022 18:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239254AbiDSQUp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Apr 2022 12:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbiDSQUo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2022 12:20:44 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04FF3A5DA
        for <linux-next@vger.kernel.org>; Tue, 19 Apr 2022 09:18:00 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j8-20020a17090a060800b001cd4fb60dccso2363591pjj.2
        for <linux-next@vger.kernel.org>; Tue, 19 Apr 2022 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SgrjXhrdyGBuAojkyER+ke3walAYFEVhR6S2wzd850I=;
        b=fYyznZKzbI6sFVVZD7oKf6rKMMDuW2UResAFlD+hE77wm5tBUjl0OSDAZTAKVaWwlE
         XjaydNgMN4aXHk0nXg3lRawHvzcsMUAbUJ6e8B8xliGGEeF7hI2P1AQUpwWzNKbNoHZi
         4pCLIr8ZzCw8WKfk9ffH6QxMRJXeeMV9+VOGi90ztDMgX+pvDK+lxgG/CSPt7G24BXgr
         gmfoHVcT9Kn49m3ptFQgUtKnOHMEsPW+xJprBX8C/gvahBxaQ7F527XKW/nJEQ/+RwmI
         BnJ9EwMFkp1CI1Fri3FOrQO+i5RKKS3KozhdrbfprMxJORwDT3mMZMwAqmOK8d7nKXob
         veCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SgrjXhrdyGBuAojkyER+ke3walAYFEVhR6S2wzd850I=;
        b=qWy1z1LYqNYnnwk3a7I3gsuWiozEexKok14RVLESxxhEignjW5in3PS4RfX/Jk6qce
         svtIfV9AD49FFCp2drzDH8znvh1xSpQW9dIFE65pNbuSDBsbmUvLafxPT7dHRmXiNlz1
         ccePnpQB5GpThlv380DumxZxjiq3HC1FekeKxiyagh1JkB3NM9tPB9lhakPGm61lEXuj
         lNIfmqGeAR0NpKkx/9+OVebx76tP/H54iJveQ+b1pPAcy/DmGHGYMuY/gzYg3sECLrM6
         XmxWbhs2P1tyyTYjaycgbKJCcPVGBf0yCKuFF+FePm03NZLmA9/mYM3s4rKjBxsumuC9
         zl9g==
X-Gm-Message-State: AOAM532HxGuidFkCNyhoMvBrIMMXr/LXrHv/zosnxxHjJvQQKbWcucCZ
        VbKYbVvU/Eu06FOXAaVIgx7ZwHHB4pSmCl+r
X-Google-Smtp-Source: ABdhPJwtJtaAI5mIWxfn88Tin93456Q5+V6QUncVGoHi9089XPqfJFGsE2OFS0p9ykaa4R6ckhMpsQ==
X-Received: by 2002:a17:90a:ab08:b0:1cd:34ec:c731 with SMTP id m8-20020a17090aab0800b001cd34ecc731mr24899249pjq.202.1650385080165;
        Tue, 19 Apr 2022 09:18:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x2-20020aa79182000000b00505a61ec387sm16547780pfa.138.2022.04.19.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:17:59 -0700 (PDT)
Message-ID: <625ee0b7.1c69fb81.f08da.6ec2@mx.google.com>
Date:   Tue, 19 Apr 2022 09:17:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc3-249-g4604e2bc18b6a
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 476 runs,
 7 regressions (v5.18-rc3-249-g4604e2bc18b6a)
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

next/pending-fixes baseline: 476 runs, 7 regressions (v5.18-rc3-249-g4604e2=
bc18b6a)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

odroid-xu3                 | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc3-249-g4604e2bc18b6a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc3-249-g4604e2bc18b6a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4604e2bc18b6af1d84e18b4da451fac9bf70f952 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/625ea8cb5000a43a61ae0684

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/625ea8cb5000a43=
a61ae068c
        failing since 85 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-19T12:18:56.187348  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-19T12:18:56.187629  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-19T12:18:56.187796  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
odroid-xu3                 | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/625eb444b26731dcceae0693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625eb444b26731dcceae0=
694
        failing since 40 days (last pass: v5.17-rc6-312-gf15bf60c638f, firs=
t fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/625eb0e0bbfdc35c20ae06a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625eb0e0bbfdc35c20ae0=
6a5
        failing since 64 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/625eb438cd4299ea0bae0688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625eb438cd4299ea0bae0=
689
        failing since 64 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/625eb0b6ebfe06dd2eae0691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625eb0b6ebfe06dd2eae0=
692
        failing since 64 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/625eb40efc5169c395ae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625eb40efc5169c395ae0=
687
        failing since 64 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/625eaac80ce5c12a6dae068b

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
49-g4604e2bc18b6a/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/625eaac80ce5c12a6dae06ac
        failing since 50 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-19T12:27:41.885312  <8>[   32.644454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-19T12:27:42.915319  /lava-6121590/1/../bin/lava-test-case
    2022-04-19T12:27:42.926417  <8>[   33.685994] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
