Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5522A483C11
	for <lists+linux-next@lfdr.de>; Tue,  4 Jan 2022 07:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbiADGwd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Jan 2022 01:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbiADGwc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jan 2022 01:52:32 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76BAC061761
        for <linux-next@vger.kernel.org>; Mon,  3 Jan 2022 22:52:32 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id x194so8723577pgx.4
        for <linux-next@vger.kernel.org>; Mon, 03 Jan 2022 22:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gaJf4wI/Cw5x3Hwnai9eEMlmr3lNu8eZPCQvPC8VQkY=;
        b=J5LEsx6cgLAjidl4ALHw+YOyxMRge2XDL/m5eaznypsdmeB1F/g6PkXmTzEBZ9zxwE
         5oG+9K3L2T1DIpW6IOiiR2M2C8nVEg0+tY1bQBHpLHz4UMp10gAF55tKIwMf3LUshNf0
         nHbSBRhv3Q6ED6nTSP3WqXDzt6aeDSFLix1a9H4dt8CmFJ0rbN9lezFPXixmqHdKRcGe
         0uq4CUg0gxTgmrhPey5V4t0l7fMq7YHjahkBCeT/3xHdeeL/bB+HqyWr1xS5kM8txBy2
         tFDJgDLlpYlHNqBeSIOZk1nDSVYAyb0xpIn+TY1iKmipbdo69B5vtQZXuY12+TtTRBdq
         BdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gaJf4wI/Cw5x3Hwnai9eEMlmr3lNu8eZPCQvPC8VQkY=;
        b=fDapmUqk0nfDwZdJA6ad/wh2amJnYqpy2/f6y7o5QMnGw5NJ9SVeH05GMcyVqsEbWh
         NFHrgZJlRBURIQCkjI4Crt+1K1tY/IScim8xVt0lD2FvbTbozR+fmVO+8uebsMLqYM64
         ErA7bHKlEpoDvYzrsIjOh6r2M1iPCGmYf+NDMOC3FE3C8IevjYMs+npAM0JD/0TG0uua
         zE7itcsvVZ3I/sl9KMnzx4aKS8cwJFzEwfn03B67QyBhQICM78cId/oHp56c64XFWDQT
         a1cqCntFM/z/ySMkAfaA4y8n0k5k8dF7uEm0M1C5fl+HVv8Rlzd6W+FJioCQO8BRb1L/
         y4xA==
X-Gm-Message-State: AOAM533S36P54tm7VcxqLMwkBqrWevQVcyaPbq/TACZw5o3Tjm22zAQQ
        iL+iRqGwqefAjR0Soy9Rc4uzwh+0ePIS2NJP
X-Google-Smtp-Source: ABdhPJy8u54RkD8AmY3n45WzR0SUHWnOQMA4HDDqcm7fOyaRQtxpXXjFSeDW1dwdRJDkRHSPjxL9HQ==
X-Received: by 2002:a05:6a00:14c9:b0:4bb:68c5:b649 with SMTP id w9-20020a056a0014c900b004bb68c5b649mr50070013pfu.25.1641279152181;
        Mon, 03 Jan 2022 22:52:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id rm6sm10056792pjb.35.2022.01.03.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 22:52:31 -0800 (PST)
Message-ID: <61d3eeaf.1c69fb81.ca488.8d3c@mx.google.com>
Date:   Mon, 03 Jan 2022 22:52:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc8-76-gf3c3fc1577d6
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 599 runs,
 3 regressions (v5.16-rc8-76-gf3c3fc1577d6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 599 runs, 3 regressions (v5.16-rc8-76-gf3c3fc1=
577d6)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc8-76-gf3c3fc1577d6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc8-76-gf3c3fc1577d6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f3c3fc1577d68b0133dc25747eb129d5df7f776f =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d3b2caf6db8ca22eef6832

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-7=
6-gf3c3fc1577d6/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-7=
6-gf3c3fc1577d6/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d3b2caf6db8ca22eef6=
833
        failing since 55 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d3b4e39f6b5389bcef673e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-7=
6-gf3c3fc1577d6/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-7=
6-gf3c3fc1577d6/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d3b4e39f6b5389bcef6=
73f
        failing since 11 days (last pass: v5.16-rc6-213-gcac41c6f3ed1, firs=
t fail: v5.16-rc6-233-g727655660152) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61d3b6aecd3205c20cef6749

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-7=
6-gf3c3fc1577d6/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-7=
6-gf3c3fc1577d6/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d3b6aecd3205c20cef6=
74a
        new failure (last pass: v5.16-rc6-233-g727655660152) =

 =20
