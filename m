Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553C63229A5
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 12:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhBWLrW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 06:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhBWLrR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 06:47:17 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FECC061786
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 03:46:37 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u11so9641183plg.13
        for <linux-next@vger.kernel.org>; Tue, 23 Feb 2021 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rR7KPl9UrAHOXm9Y9cnnzB/xyYefELgtuWIypcYHW+4=;
        b=z9dO24GgXhSCm5uXFVvr3+p/tCJxbsOrp5+l4igHgXr5MUe+J8ZYFwhsfjyq7RhYKl
         Oi/pguWBTbPxls3R4scuj9wjKeeZcuuIG56HEFww4sCy2ocw2tMDIB5G3ZzwsaTUxfai
         iikeE+ITV8Scy8YsBwqkBhDeYujCf2/E7u1/p01GRSAQm4xdhFNkwQlyUeZp3H0iitKx
         UQ1RwfDsf1AcTLrgqb/WsLsfpKvqoKEN7fMRlW01JEYCsXGKWHPV+w+KPiN9T49pvy6h
         GSbrQvbWJAa6+/fnjexBhTOPlue+42CjBLMweKR/1pBkDwert7Ov14OMDCdghmJo4YQO
         ocIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rR7KPl9UrAHOXm9Y9cnnzB/xyYefELgtuWIypcYHW+4=;
        b=mKYeCOHqrAbduGl3RoQuAznBADFCnPhJv6xuCfTLBxnI60gcO5x9I9P+h4cBcPzY8R
         XG0x7d5AEQXyFq9DVnCUW77AGDTDcNIyuJMX1RCCHzOzK5y+Px+sVA44w1iKZ0z2vxyh
         cejD+Lkkcwen7NcTHC+MEcpacAJ6evnwfEFRBx5ZWL7b/hBZQZfKWxu2V+pFh13AdGv9
         aWQiVXsRRrZFhzCrJ23Uqjmv0zktT+1+C2F6VPMsrdEVH7D21uosTzjemY85Rz1103TK
         Lq8kEPhIirmimZmtpWtnxt9XwZMuiQGs+JzjDzvcMOxZJZlYUbW0YUWJGpbyAyndZE4U
         FGAw==
X-Gm-Message-State: AOAM532Th3hxvd7eKFUahv3jcDhTQB7IqtDkzU0nIy9GeqJAzdXP+f79
        MfZhDiH/9TmuHXk3XyS0H5uR6IvBB0lfHA==
X-Google-Smtp-Source: ABdhPJwhxoSvXySxZlLQ5riKjocmM0BjOdPn+n9L1VRy58zmN60hAHKl1HaM3tRzXAmTnE5VPTKMZg==
X-Received: by 2002:a17:90a:4213:: with SMTP id o19mr29212977pjg.144.1614080796880;
        Tue, 23 Feb 2021 03:46:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o5sm3090339pjq.57.2021.02.23.03.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 03:46:36 -0800 (PST)
Message-ID: <6034eb1c.1c69fb81.bb650.5f4b@mx.google.com>
Date:   Tue, 23 Feb 2021 03:46:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-9380-gef8173f75639
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 220 runs,
 6 regressions (v5.11-9380-gef8173f75639)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 220 runs, 6 regressions (v5.11-9380-gef8173f75=
639)

Regressions Summary
-------------------

platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-8    | defconfig          =
          | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip | gcc-8    | defconfig          =
          | 1          =

r8a774c0-ek874           | arm64 | lab-cip | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip | gcc-8    | defconfig          =
          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-9380-gef8173f75639/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-9380-gef8173f75639
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ef8173f756390426a94fba9f19b14617d5384319 =



Test Regressions
---------------- =



platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6034b74dc39193b8bdaddcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/basel=
ine-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/basel=
ine-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6034b74dc39193b8bdadd=
cc4
        failing since 4 days (last pass: v5.11-629-gdcd372394d935, first fa=
il: v5.11-2286-g3c15bb8df3365) =

 =



platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip | gcc-8    | defconfig          =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6034b8a33b8e0c5675addcbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6034b8a33b8e0c5675add=
cc0
        new failure (last pass: v5.11-647-g6dc8678b08f1f) =

 =



platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6034b7594836be9f44addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/basel=
ine-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/basel=
ine-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6034b7594836be9f44add=
cb2
        failing since 4 days (last pass: v5.11-629-gdcd372394d935, first fa=
il: v5.11-2286-g3c15bb8df3365) =

 =



platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip | gcc-8    | defconfig          =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6034b98e2cd718a4e8addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-=
ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-=
ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6034b98e2cd718a4e8add=
cb9
        new failure (last pass: v5.11-647-g6dc8678b08f1f) =

 =



platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774c0-ek874           | arm64 | lab-cip | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6034b76d0b1c2a633aaddcbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/basel=
ine-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/basel=
ine-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6034b76d0b1c2a633aadd=
cc0
        failing since 4 days (last pass: v5.11-629-gdcd372394d935, first fa=
il: v5.11-2286-g3c15bb8df3365) =

 =



platform                 | arch  | lab     | compiler | defconfig          =
          | regressions
-------------------------+-------+---------+----------+--------------------=
----------+------------
r8a774c0-ek874           | arm64 | lab-cip | gcc-8    | defconfig          =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/6034b8b895ac895136addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-9380-=
gef8173f75639/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6034b8b895ac895136add=
cb2
        new failure (last pass: v5.11-647-g6dc8678b08f1f) =

 =20
