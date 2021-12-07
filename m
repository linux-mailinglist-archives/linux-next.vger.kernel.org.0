Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F50046C10C
	for <lists+linux-next@lfdr.de>; Tue,  7 Dec 2021 17:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhLGQ42 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Dec 2021 11:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhLGQ42 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Dec 2021 11:56:28 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94040C061574
        for <linux-next@vger.kernel.org>; Tue,  7 Dec 2021 08:52:57 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id u17so9846312plg.9
        for <linux-next@vger.kernel.org>; Tue, 07 Dec 2021 08:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mSbVFVAZ6CmENigyvxyjlAeabTm/F11nNpkKjMbxEu4=;
        b=bmWmcRwRsmMMJeg9Tuhjd+udTRHa2pz5V1hKCd4fo6ZUc2jai3a+KiBnKLXVXJv1gB
         MrhHOfthVPL2Ffwp5RcaLf0zbfRd6grXZBEEL04PH7sXfQaHSoCDf88IR4cFySM8dmJ+
         0v4R12RuK4jACU/kVB5HvjOG0JO4rDrwknG1OJURLoMNXAVtxqWLicgypoGYB7XLsVnz
         Kk29M7uMSOR8D3hlZoAU+nZku2h4A0Nd4k4FFvreC6fQPXrtwGCzQhGjLRH3aVA3Pe/J
         UAel3aaWtPIGgResBcs73xIQ5aaPWzLlvOwoGyhSHug9QtF4TjnxFoVpN++q7hIwp6Pa
         DfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mSbVFVAZ6CmENigyvxyjlAeabTm/F11nNpkKjMbxEu4=;
        b=zFiFXq13+if658nTMqfFOFHlwrcL7os60JPotSOg1uv+kAUjQFP/Jwgavn1Un343/N
         RU8rZqO4KXy7YqOv0P7KM1vAz4LMO3niMzNuEzmzGN9tLOA1Q5dcPcLpd9t+8q7jiB1v
         J0cFeeTDv8g+pqi58KGLtMh5VCCh9m0E90wTJjZP2rwk+8mofhnyS+5aPniVfDZnV60P
         lWRCljAUaFqisSIYpC2RxUzQ9DonKvSLKBOTsSb4j/yrHIShcY3PSq4uxkZSc+7EHIJo
         IeGYlvu3+A/uU1UceD/XaknZ21x1ECHD8nj1Oxy+MQeoPDYDz6FIAipqFlGAeJikNI79
         qdLw==
X-Gm-Message-State: AOAM53255MHa7yTqJYBBfrxMiL7VLuZr3hM0GlnwVa05rQEUaIrGWR1+
        BDkmVzQ79R3MpCgMlZzKSfGGGhYBWmG751wr
X-Google-Smtp-Source: ABdhPJwSOz+dwnnbpwaiBLuSnh5cMPQSvDIrLQMc/KRBmuBdwGxUJILkb1bL1iaMHq0w55vyUSx37Q==
X-Received: by 2002:a17:902:e302:b0:141:af98:b5ea with SMTP id q2-20020a170902e30200b00141af98b5eamr52113352plc.53.1638895976989;
        Tue, 07 Dec 2021 08:52:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t13sm180716pfl.214.2021.12.07.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:52:56 -0800 (PST)
Message-ID: <61af9168.1c69fb81.dfbf7.0ac9@mx.google.com>
Date:   Tue, 07 Dec 2021 08:52:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc4-196-g38a22b258a2d
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 676 runs,
 2 regressions (v5.16-rc4-196-g38a22b258a2d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 676 runs, 2 regressions (v5.16-rc4-196-g38a22b=
258a2d)

Regressions Summary
-------------------

platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =

r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc4-196-g38a22b258a2d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc4-196-g38a22b258a2d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      38a22b258a2dd71fb3d577cc84d6a3e774d79139 =



Test Regressions
---------------- =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b     | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB=
2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61af64b8de4c6993fa1a948d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-1=
96-g38a22b258a2d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-1=
96-g38a22b258a2d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61af64b8de4c6993fa1a9=
48e
        failing since 27 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform            | arch  | lab           | compiler | defconfig         =
           | regressions
--------------------+-------+---------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x | arm64 | lab-baylibre  | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/61af66e3a847f4a13d1a948e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-1=
96-g38a22b258a2d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc4-1=
96-g38a22b258a2d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61af66e3a847f4a13d1a9=
48f
        new failure (last pass: v5.16-rc2-613-g4f1db50ca947f) =

 =20
