Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061FC43C13B
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 06:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhJ0EVM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 00:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbhJ0EVL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 00:21:11 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30110C061570
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 21:18:47 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id i5so1097769pla.5
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 21:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0TMjfOHx03aGnT1D4jpstewBcWF1cun2mkCTNtz9Il0=;
        b=iH7GmE6hEifYRZWJ2lkukAuMXIEa08/SBMGXtPUEJUrIMaGdUsXcZ3QVNLJNERvB1C
         AdpRgU0PxYuqPebbq7+BzLqRK0psCh+qv5wQbRK5ikQx+jjf3URllTpiOCEg+BxIsx3O
         basrCuefbv4awIYkVvqQ40ZeDZzjB4T/JiheAgNgb9L5jtsBAvUS9ZKmPEISEIpzvoaH
         XfekzKCCk4wBSbA2kjucZcBGKhyZJGDdGvSstx/7T/08egwpOCQwcTiROqS56ZPAZ2/i
         4tXYDuzcd75fYWGErmc+7YWahiccqExzh61vwMZdbiMcshvj9SCPZoYgOTiNT2osbXpP
         ae7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0TMjfOHx03aGnT1D4jpstewBcWF1cun2mkCTNtz9Il0=;
        b=ZfNhfeWeVfZtU5AcEVyus+i3oDnM6a/u5VlARg6wcP8fuK/M8nrIxuw7cRII00zDmj
         iwE0Zd7U4spXnvJ8Fgo3nurRwpJUGY+tPtgAhMV/u96nyr+TzyagIpARf27rx4c2tf65
         OffYa6CFtwY1hczaZ1eGH69AmE5S+byo7YtGUhRmqjiCt5m/aj0aGuH+WDc+KUwGXM2t
         6p/kM0M4A6ye/FtMGNxWays/tWGH2GZ7sRvxaNXefuD+b7rUD5I7lpkMy2sVRzrhT2+0
         RkoesS5QVSEvks30UHQqLcf0UMtcwl2BSNZAKgaSD20DilF+R3cXx7ZPfymhSCZxGofS
         UD2A==
X-Gm-Message-State: AOAM532Xm0rpwue+hVobOgPTfVE/oEdiTF6KhD8S7GornWLvOvIV8NYS
        Lxligahkn+GcpX7srAjcQUBin/Ifc2Gpumpn
X-Google-Smtp-Source: ABdhPJwKCERilkoW8b1UUjftfpy7BSygrUDHX666VUZWw7W0wmkUfWirK3Tq4ILdXIWJEKofRBrx6g==
X-Received: by 2002:a17:902:d2c4:b0:140:57d9:7fbd with SMTP id n4-20020a170902d2c400b0014057d97fbdmr14848003plc.87.1635308326527;
        Tue, 26 Oct 2021 21:18:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1sm23855095pfl.133.2021.10.26.21.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 21:18:46 -0700 (PDT)
Message-ID: <6178d326.1c69fb81.8286d.0852@mx.google.com>
Date:   Tue, 26 Oct 2021 21:18:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc7-176-gbfbd58926fc5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 394 runs,
 2 regressions (v5.15-rc7-176-gbfbd58926fc5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 394 runs, 2 regressions (v5.15-rc7-176-gbfbd58=
926fc5)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-10   | defconfig     =
               | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc7-176-gbfbd58926fc5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc7-176-gbfbd58926fc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bfbd58926fc51b1cc34e4ec9b9113d8324267c36 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61789cb9eee38d23d4335937

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
76-gbfbd58926fc5/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8173-elm-h=
ana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
76-gbfbd58926fc5/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8173-elm-h=
ana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61789cb9eee38d23d4335=
938
        new failure (last pass: v5.15-rc7-147-g35e02e34c7cc) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61789b3c2ef76fc2e13358f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
76-gbfbd58926fc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc7-1=
76-gbfbd58926fc5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61789b3c2ef76fc2e1335=
8f4
        new failure (last pass: v5.15-rc6-377-g5baf390d41aa) =

 =20
