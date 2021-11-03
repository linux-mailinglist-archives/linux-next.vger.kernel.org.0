Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386B3443D4D
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 07:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhKCGd0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 02:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhKCGd0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 02:33:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12CBC061714
        for <linux-next@vger.kernel.org>; Tue,  2 Nov 2021 23:30:50 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso630533pjb.2
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 23:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nQXpYsC+5+4vQEKsykxKOynKbMCMa9nx+eRJB1I1fyk=;
        b=jI/be96/ewsQ6//LZkDZIaQDv+3VFxSvl6JvLOj28BxN9LTRXacm5wFgIeR71U+3u5
         iNbpQmBCvdk3nb28k58RSeS2F73AwU3r0pnfTARimD1lQyniSVgVKcyHAstq0ICt4YNV
         V92JdPmy4xJSW53/jO1hSPLPlFXu4vsj4fU8qweFmyofeDJjNGoyjY215BYznpbaX7Lj
         lw7kDHHVkHuHAjTIvWBz6y7wS+0mOqh/iea0/pMK8169WpwSqPQHOmIZNiKJ0VT3MbPO
         KVmq5G+AuqlqJrUB+C2HHc7pXMX5L8LLPCNajh1qAw8I3OTzwTPTvjsAyG8UbfhwqWsp
         zAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nQXpYsC+5+4vQEKsykxKOynKbMCMa9nx+eRJB1I1fyk=;
        b=MO5HPhiiiPIK0iqQjy00BtPWmUF03lXH0djghY233x1/kCMgMIVz53MKa2pTAywk1l
         X8rZx1yVoHiiuIDnjgB58nyVMiLrSfuadIrv4yWIihKWPG4hYi/K6e5+15zonWwE+7HA
         QtUOeFDuRZoiXVp0Hn+9CAJ4rdQ4nJ0QkAEl7JDHU8ArErG5xv/sIS+z15V4PVe002qI
         qqrfyjofk5hbBgvlTwZpuAoLxhEOECi3PV0HZw1XMv+fxsVLjB5/HKRHwTt9zKIKcf8A
         sSrYeKVR6MeBWv4WxKZ8MlEyKi7q59iJ0CZZXCp7genq7nGd0CTwrtpUXTN4H9dIpZyF
         QX/g==
X-Gm-Message-State: AOAM532dWtmkCacdnr2ykkvRRWaSjshiukA2jM2PmwD5MUfqx83+vURV
        hfFUXqHqdRgphXckAfzFoqYh1Lp2omuNd4+r
X-Google-Smtp-Source: ABdhPJxmoyXuHLEgB1mUuFmVF4tkCyEQfu4XekNds3ak/7tykCtepErlmA7rG7pOTJ6rxKaZ1Fk4lA==
X-Received: by 2002:a17:90b:4f83:: with SMTP id qe3mr12543601pjb.144.1635921050065;
        Tue, 02 Nov 2021 23:30:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d15sm1116144pfj.156.2021.11.02.23.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 23:30:49 -0700 (PDT)
Message-ID: <61822c99.1c69fb81.99bce.43a4@mx.google.com>
Date:   Tue, 02 Nov 2021 23:30:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-5907-g771bcd3baddd
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 483 runs,
 1 regressions (v5.15-5907-g771bcd3baddd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 483 runs, 1 regressions (v5.15-5907-g771bcd3ba=
ddd)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-5907-g771bcd3baddd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-5907-g771bcd3baddd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      771bcd3baddd4f66646b2b456725bcdb8b2fa5c4 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6181f3295320267a503358fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-5907-=
g771bcd3baddd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabor=
a/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-5907-=
g771bcd3baddd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabor=
a/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6181f3295320267a50335=
8fb
        new failure (last pass: v5.15-388-g75f097aa9969) =

 =20
