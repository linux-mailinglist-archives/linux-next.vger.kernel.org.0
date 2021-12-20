Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1B847A435
	for <lists+linux-next@lfdr.de>; Mon, 20 Dec 2021 06:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhLTFLX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Dec 2021 00:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhLTFLX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Dec 2021 00:11:23 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EFEC061574
        for <linux-next@vger.kernel.org>; Sun, 19 Dec 2021 21:11:23 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id x1-20020a17090a2b0100b001b103e48cfaso8031510pjc.0
        for <linux-next@vger.kernel.org>; Sun, 19 Dec 2021 21:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eriqiIHq1cKyAr3AIgRoXTwf6vD6KHMZT3EduAoDJMQ=;
        b=iR3S5SzpKN3cccQ/37q2/1BhSbqxpvzb9EznFFB6AgCZab0kjN039MhvbPcp4PJCQ/
         MWjf2xx6STkZNrDNz3GF4vGAV8+TN/bmsS0/t5nDnUkGxICfST7jes8qbkmv0TcQb+vC
         LxfMfkVg3nGYSZEYTlEi0Lwz7KWZaVVlc1bSfKKx0JungjvzetGHxAtFaO2c8stT+WAy
         0fDqCA+b7fzXMf8h8DERVCAwtyGo/jNNnPmuTtFKixcy6tSoazR8/7gs+JvGRwim1WHl
         huE7u1Fdl5aLzRxXJLrFqrknLpGROhzVLxf327jjVCD99ZJy3Q1KHPzN8ZQFETwBaV0z
         lEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eriqiIHq1cKyAr3AIgRoXTwf6vD6KHMZT3EduAoDJMQ=;
        b=4UFeHGPtg0Jxx/lHT7KQk1E/QdxmQ83ZOpaYXM/f+qnTmouZxF1v68KjUMPVwgzs9D
         KM+x2Bb4Usvf1CTL/FCh1eu8F6xGzLoqzKc89bDaSeGS9pvygDa9GX/mtNiGnYR3G6qe
         ImOXCWIP4sHX1kuQg1ctIvWSWWB1i4jFVohabLM9BAEdafh0NFKf31WEzAVosi1hOKcF
         zhc8UYnXAYbfd2PsdqHxAXJS6thhhQclW0qfQ5POumzgOeT43/wY7pYvJtlc4uaNGOzM
         eU9ULfgMAq+c89TRDxO6irHryDCThHW37y1cD8qLre9EQklkLrk8SisU/+H+3HmGY+W5
         SGiw==
X-Gm-Message-State: AOAM530PzzFoCry2cGxxr/hLGR/WMluFd/8efzIP/cFLkrK60iMLnrUQ
        /0H9PUku6a/bgYgghk9X/9wbLBrbasjUmDL0
X-Google-Smtp-Source: ABdhPJyrc9z+fItZ2adsRW9m3+mqf+TFshi+/UgvhH3thGGxfjHQ2xCX2COJkaEI+zH76ib8XlPHUQ==
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr18200300pjt.74.1639977081940;
        Sun, 19 Dec 2021 21:11:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t8sm16630636pfj.26.2021.12.19.21.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 21:11:21 -0800 (PST)
Message-ID: <61c01079.1c69fb81.3332c.f0bd@mx.google.com>
Date:   Sun, 19 Dec 2021 21:11:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-395-g46f3b5d984fa
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 592 runs,
 5 regressions (v5.16-rc5-395-g46f3b5d984fa)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 592 runs, 5 regressions (v5.16-rc5-395-g46f3b5=
d984fa)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc5-395-g46f3b5d984fa/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc5-395-g46f3b5d984fa
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      46f3b5d984fa6f57b9ebe0e844bed32400286cba =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bfe3fc0ab1d9e59d39712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bfe3fc0ab1d9e59d397=
12b
        failing since 40 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bfe4b0024ef4456639714a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bfe4b0024ef44566397=
14b
        new failure (last pass: v5.16-rc5-294-g65d84bcc1bef) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61bfd1c07eb052457c397137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-=
minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bfd1c07eb052457c397=
138
        new failure (last pass: v5.16-rc5-294-g65d84bcc1bef) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/61bfd3bcde68d437f3397162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bfd3bcde68d437f3397=
163
        new failure (last pass: v5.16-rc5-257-g713f2fcb90ea) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61bfd56db5f67f420d39714d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-3=
95-g46f3b5d984fa/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bfd56db5f67f420d397=
14e
        new failure (last pass: v5.16-rc5-257-g713f2fcb90ea) =

 =20
