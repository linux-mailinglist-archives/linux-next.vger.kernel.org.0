Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4142239FB2
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 08:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHCGoC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 02:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgHCGoB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 02:44:01 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81571C06174A
        for <linux-next@vger.kernel.org>; Sun,  2 Aug 2020 23:44:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id i92so7229097pje.0
        for <linux-next@vger.kernel.org>; Sun, 02 Aug 2020 23:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IQpBuSpOZ91WIa5F3dcr68E6UguiU9VJq1y+nKxbDzA=;
        b=0F+y5QejJmLsAwZRkzvqkEUQWCMAbRlASsexbxxfNiFbFDXvkkHKfOHHhMMBYhwuld
         2tzYLsjUq3K8xUJIVbSg9Cgdhq35ZI8yVnVD4Wyu4uz46g74Abi0EuHgu6YrD4yqoJHO
         I3E8KZWsxKEbXLSUxNX17/bWzkMovlYCrtORYyxg7A8LfIxw6ejfGOllz4HigS6lJcNp
         RBPDfSSF7nyt4yZyZFLXm/9a/kFZHDP/whmJnRhLLNk1Hr8QIC8ElHP2Zi5jeQ5cFdEL
         V9dpbnx/041sv9b/3hGeW2PJXJMMUJ/ArRByJJDASj9r7RGJNii81wp/AaGKsrruDqxi
         Sfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IQpBuSpOZ91WIa5F3dcr68E6UguiU9VJq1y+nKxbDzA=;
        b=YKUob3N42NxhD8ieze/D4FpqGe9elnm1xQ3BqdrVpBVwLUibjkS/sIKECXXa1YKLod
         ksmpEuOHASWr7ICKkDpG2uemJ8au0xQtomvmv3fBYuttz8QtxTOmFDT0pPzo7oyyheks
         hZnaj256SMQFioEcThomAR8NRjzfQgT1rhs2UgKaqX6v5Y4QYh2J63flNtyl3GZZLnnX
         ICjpOdbN+7XzqpVXEVE2BjNfLgXoBPkSP2nw9bNNT9j8Yua7Sw5U+OaWmerX21zNya+T
         kRNiwboBifUO7KFwUQfx5s/LXGAKcOuoxegHvAQqI0gNZNBcipHLo9YIpLpjq0VhRGB1
         U78Q==
X-Gm-Message-State: AOAM532k+4uEz9Z7zb92aOyDCLxuzUXeHC++RzOynVUXeWFOwFYdSjD+
        YdrGa+U/njmelFiss+wuMSzcV4mZfNk=
X-Google-Smtp-Source: ABdhPJyb83iPFDLetqqyK3k/ZmjqVPQwna7wStCF7cRRwnZ9MXmhqhPBjd2Vl+FYLrnccJjKVPyt4w==
X-Received: by 2002:a17:90a:d01:: with SMTP id t1mr16341145pja.162.1596437040474;
        Sun, 02 Aug 2020 23:44:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h23sm18551201pfo.166.2020.08.02.23.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2020 23:43:59 -0700 (PDT)
Message-ID: <5f27b22f.1c69fb81.b929a.000d@mx.google.com>
Date:   Sun, 02 Aug 2020 23:43:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-54-gefd7bdec601b
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 353 runs,
 4 regressions (v5.8-54-gefd7bdec601b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 353 runs, 4 regressions (v5.8-54-gefd7bdec601b)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 0/1    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 0/1    =

sun50i-a64-bananapi-m64  | arm64 | lab-clabbe   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-54-gefd7bdec601b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-54-gefd7bdec601b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      efd7bdec601b0c26fe13146e5661877115c99945 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f277a55f972fe0e5952c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xpl=
ained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xpl=
ained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f277a55f972fe0e5952c=
1a7
      failing since 89 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f277aab34b931cfd052c1be

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/bas=
eline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/bas=
eline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f277aab34b931cf=
d052c1c1
      new failure (last pass: v5.8-rc7-210-gb684091a3d8c)
      2 lines =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f277fc21a6914989752c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f277fc21a6914989752c=
1a7
      new failure (last pass: v5.8-rc7-210-gb684091a3d8c) =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64  | arm64 | lab-clabbe   | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f277b1d11682f071f52c1d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/basel=
ine-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-54-gef=
d7bdec601b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/basel=
ine-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f277b1d11682f071f52c=
1d8
      failing since 2 days (last pass: v5.8-rc7-165-ga7813a12c4b9, first fa=
il: v5.8-rc7-210-gb684091a3d8c) =20
