Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3985438ED7
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 07:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhJYFdN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 01:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhJYFdN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 01:33:13 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3847C061745
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 22:30:51 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id r28so5452531pga.0
        for <linux-next@vger.kernel.org>; Sun, 24 Oct 2021 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8Z0Ko+DkSAGAy52wrJnMu25WQR4Tz5SIvVRzc/yc0R8=;
        b=k4REHGfIXfQN3jjOya48KDYgiAw0O/4x/s83U6QIxUTFgdrcgYD3UgacAlFA3cGiQQ
         uXyrUJn8TmnOWltrqtdKtEnFUrKpUY09U57/HVL9WOfDpASQAgFyO3T/iD/zg3Z2c93M
         J1UW1mlPkspE8WrjZS2wxs2bfVoGXcxqiw6oSidH2tnYMn/bbsNtprgoJBVzjpyVevtP
         zGfJcHD7Ot2OhxSDFqCuS2xuCh/pBIrG7fmds0YKeH9PulL985JU3jwi6BSI2b2lY1eT
         BWXe7CfdinQEtkcbMej0w6SItudZjvnTy1HopWr2Morek/8dX6QcSY31EEXTqPJh4Qib
         WuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8Z0Ko+DkSAGAy52wrJnMu25WQR4Tz5SIvVRzc/yc0R8=;
        b=Ltp0FxkTPi0P1VuDk5gFRbavDOKRdL1yNyaQ+d0XI9d/vNP2v87BWGBFlLX/kQKKWi
         bwyL3I1C1SqoG4dcIH5EwsSZe/Dgq78eG061fo4zYSOOWF1A3Lbc3VwKbSyyb26AeFDA
         nmID6CTNciWhf66njpX/AdcSbR3/kLRCPUXsNfFlUIeu93l152SJzbIcdD443XmhVZlD
         cEpTDYVb1T98DetOb1NyOm54u7SMKuKGdkfudRnc0QcsdsH4K/6eNhFwVoYbqGwRm105
         dHK0ny+fY1QngC7VGUvg9YDhDmfF5JqOjXUCeA5bhKEoLVljrfu9DmLCUDV7t/G1CXxD
         3E1Q==
X-Gm-Message-State: AOAM532gU1P8Oq929I/DvFaXLQ2RTm6FwJqwRpZNneSRVkKxS1J8x8VD
        f8pxpTjbFnIEKc6fpZlJ3+jkcfQbNa6GyA==
X-Google-Smtp-Source: ABdhPJyzQxuC7bNCfAjKYIeUREuORR/ltRTdz4q3G02TIszjBqDGuUaXvKxSpQ9eOlblkVNy7RGlYA==
X-Received: by 2002:a05:6a00:1398:b0:44d:3234:dc31 with SMTP id t24-20020a056a00139800b0044d3234dc31mr16326594pfg.7.1635139851137;
        Sun, 24 Oct 2021 22:30:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n21sm16672601pfv.115.2021.10.24.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 22:30:50 -0700 (PDT)
Message-ID: <6176410a.1c69fb81.3122e.dd31@mx.google.com>
Date:   Sun, 24 Oct 2021 22:30:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc6-377-g5baf390d41aa
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 497 runs,
 2 regressions (v5.15-rc6-377-g5baf390d41aa)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 497 runs, 2 regressions (v5.15-rc6-377-g5baf39=
0d41aa)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
        | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc6-377-g5baf390d41aa/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc6-377-g5baf390d41aa
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5baf390d41aa17086c48d8200d51ef9ffb461594 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto | 1          =


  Details:     https://kernelci.org/test/plan/id/61760ef9437cb2a8b5335906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc6-3=
77-g5baf390d41aa/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc6-3=
77-g5baf390d41aa/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61760ef9437cb2a8b5335=
907
        new failure (last pass: v5.15-rc6-297-g9344874edebc) =

 =



platform                     | arch  | lab           | compiler | defconfig=
        | regressions
-----------------------------+-------+---------------+----------+----------=
--------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/61760f940d3d6751c03358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc6-3=
77-g5baf390d41aa/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc6-3=
77-g5baf390d41aa/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61760f950d3d6751c0335=
8dd
        new failure (last pass: v5.15-rc6-265-gc48af0f39374) =

 =20
