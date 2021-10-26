Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD01B43ABED
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 07:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbhJZF6r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 01:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbhJZF6p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 01:58:45 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8152C061745
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 22:56:22 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x66so13193663pfx.13
        for <linux-next@vger.kernel.org>; Mon, 25 Oct 2021 22:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Rx3dL7qQnXdcdkq9jbZgTb3gNMueVuBWzOXukyaDi3U=;
        b=flxOe97AQ3W8yIDDdDlUttLpmbRznyM7ZzVYEvjLtrfQjXspskGwZeP3g399ex7TDb
         xzBm6R/BKrB9E5lYsBuxtGbRltNdxmitB+Urobwu/XCGbmx91FDjv+AMw5JfWTEEnzDF
         sNsVkd3h60ETz5z3H+T0zPPATGJqLMyl3pUbenEpsdoj/fowEhc0DeCPDafjmT8R6WLC
         viB7YPcXtxqXXaNtsXsq2ST8Vy6TZ4FaKWrgzd8ywwSEmf5HMH9y5DljlSOj+oBj7J0H
         zUUnyX18kwtDZtdywMXf8Pn/Je6WzP5+0MwGljnrsVszNkNc8KLfzN0RAdW09fchhAqD
         yC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Rx3dL7qQnXdcdkq9jbZgTb3gNMueVuBWzOXukyaDi3U=;
        b=4aWtZc9guSc38073euX3qSovQR4R3qr8OTpvcgLxGF8yDfd92I3Lz+I95djoPyqAqO
         EYwY4kc9YF8OBRwc1mXhNdC6x+F5SYr1sVB9zNPKYRsXiSZcTjSa6ADBnZjYbyK6fcyW
         mdfzsIIuWlX1qb0iRDo7WStLmPcKQXMXezSefFjEXjyA1m1/xk3VL8olk/ULxQS7BPRu
         jBl0f+3bFpX4a4/kldoYsACUq7iYTGpp4Azagdd+XuNdAF3vhAWzILfdbOk7KvVuBScY
         q/GZ2lPfXDq9hPfDUcfocOtCYRN7O4+A7m0xo2e111V0l/i3QIpzkDH8qqeOwXNqtzSG
         o1/A==
X-Gm-Message-State: AOAM530q1hrmQv58q+OK7DZtClcNsLuuIS8lSUo972MfOhri/qkNfNRm
        iSfhPzT+xGIeD5EKYeTHHQT/RaI/FWz5Kzfj
X-Google-Smtp-Source: ABdhPJyFbXwC+HEJneDRmciEAX/RlGCmq88zp+LiZDw2orKbM9hXLDVWe1XcuD3/VdzoXQZ2isNpww==
X-Received: by 2002:a05:6a00:887:b0:474:1f41:2293 with SMTP id q7-20020a056a00088700b004741f412293mr23398446pfj.44.1635227782074;
        Mon, 25 Oct 2021 22:56:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l4sm21762250pfu.101.2021.10.25.22.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 22:56:21 -0700 (PDT)
Message-ID: <61779885.1c69fb81.e9852.8ab1@mx.google.com>
Date:   Mon, 25 Oct 2021 22:56:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc7-147-g35e02e34c7cc
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 284 runs,
 2 regressions (v5.15-rc7-147-g35e02e34c7cc)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 284 runs, 2 regressions (v5.15-rc7-147-g35e02e=
34c7cc)

Regressions Summary
-------------------

platform              | arch  | lab         | compiler | defconfig     | re=
gressions
----------------------+-------+-------------+----------+---------------+---=
---------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig     | 1 =
         =

kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+ima | 1 =
         =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc7-147-g35e02e34c7cc/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc7-147-g35e02e34c7cc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      35e02e34c7cc912af4af045c3ea3938f1db251cc =



Test Regressions
---------------- =



platform              | arch  | lab         | compiler | defconfig     | re=
gressions
----------------------+-------+-------------+----------+---------------+---=
---------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig     | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/61775f012452520bb93358f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
47-g35e02e34c7cc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
47-g35e02e34c7cc/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61775f012452520bb9335=
8f9
        new failure (last pass: v5.15-rc6-377-g5baf390d41aa) =

 =



platform              | arch  | lab         | compiler | defconfig     | re=
gressions
----------------------+-------+-------------+----------+---------------+---=
---------
kontron-kbox-a-230-ls | arm64 | lab-kontron | gcc-10   | defconfig+ima | 1 =
         =


  Details:     https://kernelci.org/test/plan/id/61776004a2ef3043e433598b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
47-g35e02e34c7cc/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
47-g35e02e34c7cc/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61776004a2ef3043e4335=
98c
        new failure (last pass: v5.15-rc6-377-g5baf390d41aa) =

 =20
