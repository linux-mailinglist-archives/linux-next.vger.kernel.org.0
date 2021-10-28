Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E642943DA65
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 06:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhJ1EeW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 00:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhJ1EeV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 00:34:21 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866D2C061745
        for <linux-next@vger.kernel.org>; Wed, 27 Oct 2021 21:31:55 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h193so5199686pgc.1
        for <linux-next@vger.kernel.org>; Wed, 27 Oct 2021 21:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9t2eKArK8D8SrmQfEyEUwA7ZDFIpljNoRY9LrrWtB1E=;
        b=XPr6CMNfYCj7+pOb/xkLZQpGuXiUWY5wT2L7AOujCRoBVJMM5aPJpxpWnuauXrfzkM
         Xp2wg4J3ci05qMYi79cRahQoBdUxqhLkxZbrM4Sn5xcRKQrrAX263jdh6SY+xZtus1u4
         NgGIGDYi4oSz17ZvPyOHTx+cMl87dBB4p/4ABNVWBxmvn90ySW6KusUW84OBFmF9CPrQ
         u96qRefD1EClXOK6p0ndK0DHXedh0STXyLnpgh8kUQf/D3KRX2pbXK03MdxKnlfu0rkK
         OljtJFBY2eE9FRotaYo+3/+1u6greSdi6BNaLBCO25EI+IyAv0zzDhS6KT5uVM2Xpt1j
         skmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9t2eKArK8D8SrmQfEyEUwA7ZDFIpljNoRY9LrrWtB1E=;
        b=WllmQ80cwTRcz0JjP4iOXWBAmUbtCzrqLswEQmx4h6rPLUW8XA7v/Ynrzf7fT1LTcE
         gF/R4TJ4kxJKCxK+pJuNfwYEcJz5x8jicEMIvVCmEWrmxt5eJ255erTZOhiIYGcpjnSh
         l5f4x1GlnHmfFY3TJMUoSaO7gVWSQKAlxQOWhZHg4fABz2uzuUy9VziS5cxop865Nxa5
         G/bLi9bG7yZ0bGmMxnzuTUyv00EyGGGkv2SmbUilCixanraKEaoi8oPbRhiSv77d+ntS
         tGGKJrN3HhUqRiokyDZ0wqbyPcr+PQxxoKRjIvCGXp8P+AXQ3bHJCZeowoMkxdmg9/UB
         x4Ew==
X-Gm-Message-State: AOAM530vKjSeb2nl457aX1OHsZ6vzXvQgLMT5gBsC1oC04FRVubAPR2u
        2fz1hImVPqRzB6uw/lViSFq8dZIlk0rviC+Auuw=
X-Google-Smtp-Source: ABdhPJwoDM/dNAEKTtoidX4bHs0h3NWBkg49Vvsjrtf0oceNxrATG/+l5dJ9m2Shy7ton28LKJljtQ==
X-Received: by 2002:aa7:8718:0:b0:47b:f2ca:2e59 with SMTP id b24-20020aa78718000000b0047bf2ca2e59mr1904676pfo.21.1635395514886;
        Wed, 27 Oct 2021 21:31:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h11sm1578318pfh.162.2021.10.27.21.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 21:31:54 -0700 (PDT)
Message-ID: <617a27ba.1c69fb81.5ba7d.6f74@mx.google.com>
Date:   Wed, 27 Oct 2021 21:31:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc7-202-gc79631111e0b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 315 runs,
 3 regressions (v5.15-rc7-202-gc79631111e0b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 315 runs, 3 regressions (v5.15-rc7-202-gc79631=
111e0b)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
rk3328-rock64           | arm64 | lab-baylibre | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

rk3328-rock64           | arm64 | lab-baylibre | gcc-10   | defconfig      =
              | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc7-202-gc79631111e0b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc7-202-gc79631111e0b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c79631111e0ba053e062dc64620a9b817967d559 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
rk3328-rock64           | arm64 | lab-baylibre | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6179ed6697f2a1904b3358e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-2=
02-gc79631111e0b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-2=
02-gc79631111e0b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6179ed6697f2a1904b335=
8e6
        new failure (last pass: v5.15-rc7-176-gbfbd58926fc5) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
rk3328-rock64           | arm64 | lab-baylibre | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6179ee42082583b6323359c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-2=
02-gc79631111e0b/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-2=
02-gc79631111e0b/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6179ee42082583b632335=
9c9
        new failure (last pass: v5.15-rc7-176-gbfbd58926fc5) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/6179f342a173619c62335970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-2=
02-gc79631111e0b/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-2=
02-gc79631111e0b/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6179f342a173619c62335=
971
        new failure (last pass: v5.15-rc7-176-gbfbd58926fc5) =

 =20
