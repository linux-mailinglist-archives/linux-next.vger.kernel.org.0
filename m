Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027305FACFE
	for <lists+linux-next@lfdr.de>; Tue, 11 Oct 2022 08:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiJKGoN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Oct 2022 02:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiJKGoN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Oct 2022 02:44:13 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C4A8992E
        for <linux-next@vger.kernel.org>; Mon, 10 Oct 2022 23:44:11 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d10so12682493pfh.6
        for <linux-next@vger.kernel.org>; Mon, 10 Oct 2022 23:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NffhOFCGT+E4sWicNqwx95WnVyKuXvMU4x1Nygq9SLM=;
        b=Qlu8cgFjvDy0xu/JP5/5v0lNUTYYm8Q2ZzgyOTAqNzzOuJlWuP0KkZ+37AwSUTFqJb
         ELCvB7saivZ4ESWC1QTvRxCl4jtnEGCfFfR6QYkAhA4Dj5VtO3NoRnyz8ViR3eCFAwYl
         kUrtO0AiEFubIM0d97IZXxMG2FqFjOyGQRSm8NRPlfNH9IHKOOKZmF+MNa7GFROgR9Yl
         7MUQi2u/Gs4RdzJwuC03CtKjM/GD1v3UoZV+0cvNXZLjxCEF0eRduI6Hf0Q2Y+7wFNCC
         CdClqdOOpDF7h+7p6W8bTPqz5r2zV3bv9HsM5DC3zLQymQ5o4izMX/wBXQLEf+zETG5P
         JT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NffhOFCGT+E4sWicNqwx95WnVyKuXvMU4x1Nygq9SLM=;
        b=528ZSVJw0b773Ogw9bYjDMI25XwMqoVaTnTMlHVEsrkNaZOyja45LZDwCddlhmT5sa
         NeisZ+7+pS2mb47GQ+bfHGTqp8HflInszBGSA/RHlj+JGT77WyJ5rdT54rAIJI3byY9d
         dvZHQqrzqYDv62YS5jomQGG3VaEQaiu7cAQonK6WXqUsINrFXymBsvPxa3YrtoNnGE8f
         MKGBgasLUVPTBZbe5ZhjLo9tXCyXabRzN/c4J4PWKGHsnMN1mAZLE//l5MFGw5CZehjh
         qAAhi4Fq9XVvRNs+htj/HQsYiQVfvJH86h8heMRXIuRFGZNHea3rh85+zY9z0qsbsRAk
         2rzA==
X-Gm-Message-State: ACrzQf1xecQ9fqggVqzAQuupzF5LF4UhggnUfK2qSHDL6zqEFPLJoY+j
        Al87VkpVjfW9SOHCG1rWy5PNUAZB/qTF6TAZ8Z0=
X-Google-Smtp-Source: AMsMyM5yjqCBxxsXrMt++VoUgKHgmWAfcZP9Eh3I+iU3SO94VR2DNVcX2WV+C57rxaeHEzK1AZ7jEw==
X-Received: by 2002:a63:6c84:0:b0:43c:700f:6218 with SMTP id h126-20020a636c84000000b0043c700f6218mr19729081pgc.420.1665470650936;
        Mon, 10 Oct 2022 23:44:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b001708c4ebbaesm3009052plh.309.2022.10.10.23.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 23:44:10 -0700 (PDT)
Message-ID: <634510ba.170a0220.6b0dd.52e7@mx.google.com>
Date:   Mon, 10 Oct 2022 23:44:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.0-10339-g565da9e84d8f
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 269 runs,
 5 regressions (v6.0-10339-g565da9e84d8f)
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

next/pending-fixes baseline: 269 runs, 5 regressions (v6.0-10339-g565da9e84=
d8f)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
imx7ulp-evk            | arm   | lab-nxp     | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+debug  =
            | 1          =

kontron-pitx-imx8m     | arm64 | lab-kontron | gcc-10   | defconfig        =
            | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+debug  =
            | 1          =

rk3399-roc-pc          | arm64 | lab-clabbe  | gcc-10   | defconfig+debug  =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-10339-g565da9e84d8f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-10339-g565da9e84d8f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      565da9e84d8fabf932ab32032fc8100b7a917173 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
imx7ulp-evk            | arm   | lab-nxp     | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6344de385f43dc005bcab631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nx=
p/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nx=
p/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6344de385f43dc005bcab=
632
        failing since 18 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+debug  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6344e0d46e286622d8cab604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6344e0d46e286622d8cab=
605
        new failure (last pass: v6.0-9666-g02c05e0b8d5c) =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron | gcc-10   | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6344dc6050690abdc0cab5fa

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/634=
4dc6050690abdc0cab60d
        new failure (last pass: v6.0-6424-g1af0c6a154d32)

    2022-10-11T03:00:24.317671  /lava-181968/1/../bin/lava-test-case
    2022-10-11T03:00:24.318308  <8>[   16.874676] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-10-11T03:00:24.318618  /lava-181968/1/../bin/lava-test-case
    2022-10-11T03:00:24.318899  <8>[   16.894394] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-10-11T03:00:24.319148  /lava-181968/1/../bin/lava-test-case
    2022-10-11T03:00:24.319721  <8>[   16.915501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-10-11T03:00:24.319954  /lava-181968/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+debug  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6344e0d365b9fcf4e6cab669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-sl2=
8-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-sl2=
8-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6344e0d365b9fcf4e6cab=
66a
        new failure (last pass: v6.0-9666-g02c05e0b8d5c) =

 =



platform               | arch  | lab         | compiler | defconfig        =
            | regressions
-----------------------+-------+-------------+----------+------------------=
------------+------------
rk3399-roc-pc          | arm64 | lab-clabbe  | gcc-10   | defconfig+debug  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/6344e05d93bda8c4a8cab608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-10339-=
g565da9e84d8f/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6344e05d93bda8c4a8cab=
609
        new failure (last pass: v6.0-9666-g02c05e0b8d5c) =

 =20
