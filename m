Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2D2277A9
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 06:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgGUEgP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 00:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgGUEgP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 00:36:15 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6971EC061794
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2020 21:36:15 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id z3so10129520pfn.12
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2020 21:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=U7yaLF66I3oO5zcFo8NJC4bbOl3CFH0A5SFRobM4A/w=;
        b=VzgRyUiK/ArdMdBZqHe/b3RDMNp7L3K6fVfMZijgLtNZ1OVjahawS52I7orxMUT1YO
         3rAECiZw2vsYjDfHT9GyRNb1NqJdvfGHFiLH9QVhx4G4qv1J7+DagHBzABLBNo6Cmn5X
         Rk2nTnIWIszSmDUAKMfqreDSwBeo34qtUbioVxuvcDuK05ftGwofVn4UzzoV0k7rd1Q/
         wQRDaORlls1PP+/5MvvEvnhz5/D92XLLFJw0xePHARTTCJm/JVypGwz9ezDL51anU4ye
         asv2GcSE2Qq7F5OMbus7g/Dha9WkqjVBuEIqN/0OrC1jIAbxRxYEM93F/4ByeyV637iZ
         zHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=U7yaLF66I3oO5zcFo8NJC4bbOl3CFH0A5SFRobM4A/w=;
        b=ZrKuCD96QPQUh7tOVvjwIOQGOoL1yFrSYI8mIvFhh7oJVOvZD+qRkLHXKROcmua7Hg
         jsQc1UXHblJUEqw3+v2Q6kb5kSlS87eXYATkmqdIq7oHmnBB6n38q3+MV7j1ZtFUYnw8
         k+e+RUDe6fh6xFnmuCdqqBnF24S+6SoO2WbLkwY+5xaJZW9cctJKZHFq24cVqir45e1/
         Um1ivX0Ohx1lpFxwqxEfenuSffKpW9XiriRl1YS5CXLi5yprsURrVqGQW6jDqpwR+Haw
         n0Gb4epRe5LlB8oWwHJyR/Qc7HTwSeo4nGPyxldypXYap2bGElQkuq5XS+lfU++0i+Xj
         H/Xg==
X-Gm-Message-State: AOAM532H/nSkjrRydPlTG/Nlxtm2o6zSrzDE4cIeEcGzQNksj6U3njLW
        3WYcRnJxxFYXm6mS51qnW+rTUstWays=
X-Google-Smtp-Source: ABdhPJwlQlXE0dE8lJ5she79b1abQlMwkI45NY391hxOS3n1lSjOrVpeo4UpILjA5sCfXWWem0/c3g==
X-Received: by 2002:a63:db46:: with SMTP id x6mr20541651pgi.265.1595306174310;
        Mon, 20 Jul 2020 21:36:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k2sm16359245pgm.11.2020.07.20.21.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 21:36:13 -0700 (PDT)
Message-ID: <5f1670bd.1c69fb81.a6359.679e@mx.google.com>
Date:   Mon, 20 Jul 2020 21:36:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc6-163-g19ae985ddbc8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 203 runs,
 6 regressions (v5.8-rc6-163-g19ae985ddbc8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 203 runs, 6 regressions (v5.8-rc6-163-g19ae985=
ddbc8)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
omap3-beagle-xm         | arm   | lab-baylibre  | gcc-8    | omap2plus_defc=
onfig          | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc6-163-g19ae985ddbc8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc6-163-g19ae985ddbc8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      19ae985ddbc88449b0c4244d6992dab49f7b1b37 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
omap3-beagle-xm         | arm   | lab-baylibre  | gcc-8    | omap2plus_defc=
onfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f163d1810566653fa85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap3-b=
eagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap3-b=
eagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f163d1810566653fa85b=
b19
      new failure (last pass: v5.8-rc5-432-g6ded1a48da25) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f163a1b71fe6f125c85bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f163a1b71fe6f125c85b=
b20
      new failure (last pass: v5.8-rc5-432-g6ded1a48da25) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f163eabbe1f0b6fa485bb39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f163eabbe1f0b6fa485b=
b3a
      new failure (last pass: v5.8-rc5-432-g6ded1a48da25) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f163991c8cc8ae41e85bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f163991c8cc8ae4=
1e85bb1b
      failing since 20 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1639bb7a04c7f2e085bb33

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1639bb7a04c7f2=
e085bb36
      failing since 20 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f163984a5c337ef6e85bb2b

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-16=
3-g19ae985ddbc8/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f163984a5c337ef=
6e85bb2e
      failing since 20 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =20
