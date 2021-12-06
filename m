Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDFF468FE1
	for <lists+linux-next@lfdr.de>; Mon,  6 Dec 2021 05:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhLFExv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Dec 2021 23:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhLFExu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Dec 2021 23:53:50 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DDBC0613F8
        for <linux-next@vger.kernel.org>; Sun,  5 Dec 2021 20:50:22 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id s137so9313143pgs.5
        for <linux-next@vger.kernel.org>; Sun, 05 Dec 2021 20:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3Rop6q3Nx+/MmGdLNbjmxWYSsVsnzD07Bs4k8wAtRq8=;
        b=0HL0K2wAKe3hcwgT8QvpxVpbhkJz4pViXeu5Lo4XzonYjjZE7rLLNHdIeo63uGlh0h
         5JT/14l/1DOdhBCT26iZc4EYQrWCA3kFU48H70jfYJl8BEMX/SwmC/yqAIXskt9vK3Qb
         DsKU5yWTf6T1cu/lr3mWG2EnPQ32NP2SaES3OUvRfQJLm8Q77oZnMjFqpow+eU9NRBRo
         eMZM5Te2ePcdvMY74DgZs1y7KpnKSYkuQnhd7shp7yCCPDBaNKpwm3OO+IVOT+3v/ka5
         paj/jvi6UMEx2OJmX4jCYJ42WjV8LF6YXLwFMB0pNGAg1FSzpLUOEHu0TPg9O6Gi5Ehh
         vKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3Rop6q3Nx+/MmGdLNbjmxWYSsVsnzD07Bs4k8wAtRq8=;
        b=Wcct+KqWU8UHn4VxQdUvXtZ1PU6luk9U6Ixpor1pX27/l+YcpuYJgyJxFjLr32rRdZ
         emU5uKrgsOetyadKQoZ2/bUmTQLYddoz7pDDoYThPOuYzlJenjPTlDVJEdIO5NFAaaCH
         HGsRwDSM7mwh9j3LGY6nUYzXS92/Gf48FPRaubE/V9aikrMfeSoW2XGPsfLXOd7vhtdE
         jsFJZ9XgOsqk6hdLyKb6rQcAUwq3tdIVkhrcIyB2CqS7l2A7i4SG24fUmUf5J8xxMD9K
         wUyw3Qm8jXdiwHrhazF9JAF7C5jvXAIoWEwt6hA/Z5D9fk3liovG3OD/VOnoGdIArnrN
         Y69w==
X-Gm-Message-State: AOAM531c7Yq5n23RU/k4ybcznesJ7SqYvUJFxi/BiBvNpWmoRHV4yjjX
        eA7qvngwg9z617U5u7cT4BHwBkHaDKBprYEO
X-Google-Smtp-Source: ABdhPJzhnJTlxSiIjWWqEBichcBYKXYf6Z9YG6z1pU81gDY1gTqI5ezsMIcAuoZjoVjFE5tUqQiRMg==
X-Received: by 2002:a63:8541:: with SMTP id u62mr16856463pgd.130.1638766217134;
        Sun, 05 Dec 2021 20:50:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m76sm3578321pfd.160.2021.12.05.20.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 20:50:16 -0800 (PST)
Message-ID: <61ad9688.1c69fb81.68eda.bc71@mx.google.com>
Date:   Sun, 05 Dec 2021 20:50:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc3-510-g593a87c6eb98
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 294 runs,
 1 regressions (v5.16-rc3-510-g593a87c6eb98)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 294 runs, 1 regressions (v5.16-rc3-510-g593a87=
c6eb98)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc3-510-g593a87c6eb98/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc3-510-g593a87c6eb98
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      593a87c6eb985acbc6c7fb61da3180736626c1b1 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ad698a325f32c0e01a94c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-5=
10-g593a87c6eb98/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-5=
10-g593a87c6eb98/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ad698a325f32c0e01a9=
4c2
        failing since 26 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =20
