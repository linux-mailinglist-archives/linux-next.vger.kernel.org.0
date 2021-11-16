Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F7C452EA6
	for <lists+linux-next@lfdr.de>; Tue, 16 Nov 2021 11:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbhKPKII (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Nov 2021 05:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233801AbhKPKIE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Nov 2021 05:08:04 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6771C061764
        for <linux-next@vger.kernel.org>; Tue, 16 Nov 2021 02:05:07 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so1774175pju.3
        for <linux-next@vger.kernel.org>; Tue, 16 Nov 2021 02:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kWgz32m7Ro0ly+5AZhhx5gK6my5R7vaiHa8BWx3yduw=;
        b=dnLyL5SLkgJrtm1yGjtRTnDTwId4Yh20mymo9YcDRss0VkdtZ68HRoU6tcb7BbRwOk
         JexQKhuuJmiU+RNnAAoSNIUwMVkRTCd04XKa2Dwrt/+lO+yXLPAmBRxhp9s3MQwOUDQ2
         pD1mhQF3UXfdNalWOb2E2SDGBHnyfgoUwz/N5HePxi99W0RwvWBxzDQkP71iZKALGep+
         oxy861p94vab53MHzfHaqU3qhWyYMntPRFRfuVH1LuyykrURP8Wvk+4Ah17QhXB+gOe9
         HZXst/hlk5y6prawqkoWkm2KSx4V/NJI+0GNrAplh9B/DHuUm6pLE1LO9KfsM+b+778b
         DJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kWgz32m7Ro0ly+5AZhhx5gK6my5R7vaiHa8BWx3yduw=;
        b=W6jaxgThNFAA8fTo3g4KBa2bVi2wMf4KiFne+3yjZ77UZ14m00SFZtojGzx/5SczPn
         b6HQRWms9zP2wJqSRZHgbskHBjcHYz4omIQBIVqWA/O2e2EA54La3QU2Sx42eewCJIPl
         tyikIDCMHbQZb3nIiSD2pcrwL+ehOWhWhaoQswwEYl5EjcIpo9o03+4ZJwYS+PUg9ZCP
         y4mvhp5NiszTOXXQRy6RlvOfoKzl/180Q8EEGxeZvO17tsJVaSX+ZLbfBmo4An+WIE2Z
         vA2SUF+D41p9NOvoORYUf3gM/jyVNrfE4s8hRkEpf+XsI7rUxzbtT0fZjzLCCm8TLMXA
         70nw==
X-Gm-Message-State: AOAM532wSfofbW0ce3ihQX99hWp4z2bM9CZ4dDe66+IbZFQRVRV5KUQy
        fDMnhhxeTptlTgsdpaNq/4J+CJ9mInnT/qVD
X-Google-Smtp-Source: ABdhPJx3Qr5mhbvmTMfUqCLaxfBF8fasNIhrVf7Jqj2N1iSDD3tGc4J917GDjZFQyaAH5G8pmKfwug==
X-Received: by 2002:a17:90b:33cf:: with SMTP id lk15mr7125788pjb.85.1637057107285;
        Tue, 16 Nov 2021 02:05:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y8sm19332681pfi.56.2021.11.16.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 02:05:07 -0800 (PST)
Message-ID: <61938253.1c69fb81.fa99.6689@mx.google.com>
Date:   Tue, 16 Nov 2021 02:05:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc1-155-g6eea4f2d44ab6
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 437 runs,
 1 regressions (v5.16-rc1-155-g6eea4f2d44ab6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 437 runs, 1 regressions (v5.16-rc1-155-g6eea4f=
2d44ab6)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc1-155-g6eea4f2d44ab6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc1-155-g6eea4f2d44ab6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6eea4f2d44ab6ac62db299b3e73c4b9da3c7c2f2 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61934a21831fd1e08b3358f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-1=
55-g6eea4f2d44ab6/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-=
imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc1-1=
55-g6eea4f2d44ab6/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-=
imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61934a21831fd1e08b335=
8f9
        new failure (last pass: v5.15-13240-g86fd312d9a30) =

 =20
