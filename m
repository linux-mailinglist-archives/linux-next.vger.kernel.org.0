Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC8A2525ED
	for <lists+linux-next@lfdr.de>; Wed, 26 Aug 2020 05:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgHZD6U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 23:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgHZD6T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 23:58:19 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A685EC061574
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 20:58:19 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g6so262961pjl.0
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 20:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oKi5Ok9t9HS6hzODisJWCdm8GaJdWGYRjdMBaeKf0rA=;
        b=VzLem/YVcb8NIS/UoNpwV52rFNpuzExaXoOLyb6BvShfjRNO36bYJI87WvSNBmjkOZ
         cqEZ/BzOTgShExgKCBqxFx7p5+3Q3rSdOYa1uJ5FC5PoI9Lfj+byR5emCdMSbBT4MUUd
         Ar/O1bzDI0xJEthCJyEqaNrUAot/QDq79oPPLLYqzXwKSDptVS8gZBG3jUfJpL9pVcKQ
         dECCRL9G9CyvbgkKIisG3luJ3tLIjLm3k6ocOuggLj4rF0FnCIJm1vOBvRHEoyWbYmok
         X1Hw2VJdYwxLMk5obiFW34Fw2B7DOGl4NmIlamaRPqbMmoqCFPpMFC+JvxmoCVmP8Jzo
         W/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oKi5Ok9t9HS6hzODisJWCdm8GaJdWGYRjdMBaeKf0rA=;
        b=roybMh6Pt+zrENmf/ip2it/MfJ7mOSdhLk20oiQd4cChhPry9Spb6en/8510MiH+FP
         cf4AnGNKec734AIwRk8OuINLBHhD6N0oq81eUkCXOXdcCOOfKVDjrCRjXN2RiSbDd1ZT
         ldErOpmvxqcALT8CQZKJaVWUs46qkD6uMuMOAoyFqayzeE8ZYNoD+6Ojd0a59kxwmlsT
         Q8W+jREEecJFKKYY86z6cgwcNbDBYSFXDeWWS0/cu+LcFEa9p4+t6XMkNlwGN6Pz4k+P
         cNVrhRn3obORtKMh3RmgvuiJZMAG+LkJ8k+zdCUxG7jizI+V1Njct1J8S2APHG49azPM
         H+4A==
X-Gm-Message-State: AOAM532QXzaXouL9krnspA2gGikoDBvkobxPyguSyTLYh4s8w9/dJxKs
        no6zmQCPupGxb1q9Vs5zXVV9t+xaTvsuMA==
X-Google-Smtp-Source: ABdhPJxkpKcNzfI38bA4Xi6ZrjR4PLImrIhTioZXTHjx0zZ9GRYbOxLrYZQbk+DHHBQQGQYtRF/faw==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id fa5mr4368446pjb.10.1598414298388;
        Tue, 25 Aug 2020 20:58:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l24sm851358pff.20.2020.08.25.20.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 20:58:17 -0700 (PDT)
Message-ID: <5f45ddd9.1c69fb81.40f65.3329@mx.google.com>
Date:   Tue, 25 Aug 2020 20:58:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-333-g6b34ba1e5a5e
Subject: next/pending-fixes baseline: 325 runs,
 12 regressions (v5.9-rc2-333-g6b34ba1e5a5e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 325 runs, 12 regressions (v5.9-rc2-333-g6b34ba=
1e5a5e)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc2-333-g6b34ba1e5a5e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc2-333-g6b34ba1e5a5e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6b34ba1e5a5ec0abcfb3b145ec54d79f9037da60 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45aa415f1c0fd5cd9fb449

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45aa415f1c0fd5cd9fb=
44a
      failing since 112 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45bca2025931ef7b9fb459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45bca2025931ef7b9fb=
45a
      failing since 2 days (last pass: v5.9-rc1-419-gdb8c0d8e5d3c, first fa=
il: v5.9-rc2-193-g42693eb57618)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45c4832ec2ec0b559fb445

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45c4832ec2ec0b559fb=
446
      failing since 8 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45c5c3707ac7ae299fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45c5c3707ac7ae299fb=
42c
      failing since 20 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45c70eee8fb441799fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45c70eee8fb441799fb=
42c
      failing since 20 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45ab511179a230959fb43f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45ab511179a230959fb=
440
      failing since 7 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45a78b6bb04aaad39fb457

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45a78b6bb04aaad39fb=
458
      failing since 15 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45a952128266757d9fb448

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45a952128266757d9fb=
449
      failing since 15 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f45aa4b5f1c0fd5cd9fb45c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f45aa4b5f1c0fd=
5cd9fb462
      failing since 20 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-26 00:18:13.647000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-26 00:18:13.652000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-26 00:18:13.658000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-26 00:18:13.664000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-26 00:18:13.670000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-26 00:18:13.675000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-26 00:18:13.681000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-26 00:18:13.687000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-26 00:18:13.693000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-26 00:18:13.703000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45a958975b2b37ff9fb43c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45a958975b2b37ff9fb=
43d
      failing since 20 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45a795707757b5019fb431

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45a795707757b5019fb=
432
      new failure (last pass: v5.9-rc2-260-g90854ecf6e2a)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f45a940ba256157ae9fb45f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-33=
3-g6b34ba1e5a5e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f45a940ba256157ae9fb=
460
      failing since 4 days (last pass: v5.9-rc1-381-g159f8cd76711, first fa=
il: v5.9-rc1-419-gdb8c0d8e5d3c)  =20
