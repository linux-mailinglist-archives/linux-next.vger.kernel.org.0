Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AC522A569
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 04:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733063AbgGWCxl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 22:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbgGWCxl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 22:53:41 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A21C0619DC
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 19:53:41 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id z3so2251282pfn.12
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 19:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sOTmrsc9LYfZFWxhIn1TyFXUjEOlOx8K7YcOA8AYHRY=;
        b=NuoUEMvoLQJuTV8jh2rcceOmuREtWh2Uij7/oQ8DpgP6F3fKwPjw6b3eO7Aro57Ia5
         9RiQnsmnM/MZK0VycvtrwSg6yULMPglmmjQMVN3lJVUxVCdlMS/HsahdqwMq3aOZRULl
         YJ/XvG0/YH2b9POBgU6RMbvvYTbSBNr/+fpiZ2fj2utju9TCWcYgxhr4/zxjR3n2S0Wi
         poCggFfOJsn/AjlDHPtdm+Usk4HnXZS00D8MU9eVtOfu6n0EQ+DayxcYlmUsQFgKBxrI
         TSO2ciwSm9vy9UtFWNiUZJv8cqO6LOhCp+0zeMh+dw/vqFyhc7usTOox78ahomqa2qah
         60Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sOTmrsc9LYfZFWxhIn1TyFXUjEOlOx8K7YcOA8AYHRY=;
        b=SxAhepHz/vKvPnaB8yTU28e7YZMYbT9TZLskQt5f0+WToHBN+CHfSFvHDXvhVDaU/x
         PV2O6L4EniCIux080/pMvGiNl63ezi7YAw9Cnyao62wWD8Mpo0edRXujHffeyQFu6B/N
         RCJeeGw4rjlbjOoOMrSVAVDw7ezzrhdqzi2bLV5KaPh/ryJGO6LK3m401bUOqg7fLvyi
         2QaC1kCYQgCET2qNwUKae2f7vrggGPFYp9T1P2zOeRZq/w8h0Xfd1bFGbh3+vRHhEZph
         m+0n7FZM7vgAt1+GlGNZ4zCVd/zdau0Qjsiak+dvvwD+PYx1qrU3N9X2UN64DZOYxJuK
         9hqg==
X-Gm-Message-State: AOAM531+JgSvrMjfQTspaH4PmOve5EQqEsrut1CJEFhSYjY6hpbejjKI
        6RiJzBsDn30Ouga506yVgGp/b04cEyQ=
X-Google-Smtp-Source: ABdhPJz3ARBJxlMyVxOMB8S8S6KkZCMCC1zcvI/F2OoO2skNB9xU8MpMuNGbGSIIXE6y91fQ7F53+g==
X-Received: by 2002:a63:3c2:: with SMTP id 185mr2483450pgd.46.1595472820315;
        Wed, 22 Jul 2020 19:53:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h9sm955693pfk.155.2020.07.22.19.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 19:53:39 -0700 (PDT)
Message-ID: <5f18fbb3.1c69fb81.8c84d.3955@mx.google.com>
Date:   Wed, 22 Jul 2020 19:53:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc6-225-g65a378c84836
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 323 runs,
 4 regressions (v5.8-rc6-225-g65a378c84836)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 323 runs, 4 regressions (v5.8-rc6-225-g65a378c=
84836)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
   | results
------------------------+-------+--------------+----------+----------------=
---+--------
bcm2837-rpi-3-b         | arm   | lab-baylibre | gcc-8    | bcm2835_defconf=
ig | 3/5    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
   | 4/5    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
   | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc6-225-g65a378c84836/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc6-225-g65a378c84836
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      65a378c848368fcf316db32a8185e819dd05a246 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
   | results
------------------------+-------+--------------+----------+----------------=
---+--------
bcm2837-rpi-3-b         | arm   | lab-baylibre | gcc-8    | bcm2835_defconf=
ig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f18a944f98771855e85bb18

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-22=
5-g65a378c84836/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-22=
5-g65a378c84836/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f18a944f987718=
55e85bb1c
      new failure (last pass: v5.8-rc6-163-g19ae985ddbc8)
      8 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f18=
a944f98771855e85bb1d
      new failure (last pass: v5.8-rc6-163-g19ae985ddbc8)
      28 lines =



platform                | arch  | lab          | compiler | defconfig      =
   | results
------------------------+-------+--------------+----------+----------------=
---+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f18adbce380498ed585bb22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-22=
5-g65a378c84836/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-22=
5-g65a378c84836/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f18adbce380498e=
d585bb25
      new failure (last pass: v5.8-rc6-163-g19ae985ddbc8)
      1 lines =



platform                | arch  | lab          | compiler | defconfig      =
   | results
------------------------+-------+--------------+----------+----------------=
---+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f18ae77aba82d64e985bb1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-22=
5-g65a378c84836/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc6-22=
5-g65a378c84836/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f18ae77aba82d64e985b=
b1f
      failing since 1 day (last pass: v5.8-rc5-432-g6ded1a48da25, first fai=
l: v5.8-rc6-163-g19ae985ddbc8) =20
