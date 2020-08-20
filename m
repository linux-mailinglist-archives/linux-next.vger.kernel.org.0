Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE85E24AD81
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 05:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgHTD6u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 23:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbgHTD6t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 23:58:49 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3867BC061757
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 20:58:49 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 128so525229pgd.5
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yl3UaxJRDThIu3mCCBX+ouUjSsd/mbOapIp6oaHyVCw=;
        b=YLjBWYakHZgizxdx952enVT2v6WOA6s6MIIRIRFa8jSTDGg0B37qWzJ15JN7ihTmiz
         eyD+EjcPet/h7rcB+OR0GLYcid8DF+ARLq7uncwkwifhs+OifTZy+fi1B5RPu5NNrhS4
         DVnyjZxotrG1leh/slrl/NiCRmMZT7S9FKUKMFja/BnjG21IB+Gz3xS8ATheKy+HBetQ
         idFWaBQXFYzmQrCTh6X7zJp/+b+blYJcVga8W5gAtgY38uNqkIRrUUlCHPseh+Wz03kF
         YMllTW2sGo1pcqdbdydS6ypqZMJOziBQi3h2kcI0N8f0MzjocU7VoJmX4a0P/6k74T1R
         MAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yl3UaxJRDThIu3mCCBX+ouUjSsd/mbOapIp6oaHyVCw=;
        b=tHKKfaB/pdVF7iB5qRMTqp72O2JQHg2+F78/TboIbCKfLxb1YOO9NkmIlhrMjUqVF+
         BBHZV51kCShXHjunmbD93DfLDEYqg/Z9VnPHeWcSMZVkybGg4YIQGAHiUFBQ7WGpQbhp
         cznWHieuJlPkJnS6eelbH2ysB5bQljS1f8xiegTXZRw1If1e/yNbUSl2Yk2Wgp7p7dpr
         h4+Ap11Vfk/P94NlXIInbyXAe9+R244+hfMKUDATsbEOZk3HnhBamyiBkL8rDMkRJUQC
         RMctD5Gedvl6YeOwG1ZBCwsSBfgkgYq1+/3tK4TB3x55/0eZf5k/udUbHJDOWcu2bZ6H
         n6Pg==
X-Gm-Message-State: AOAM530fzMFjvT5ryehdAx7rlec8TUhKvy1RWw3UZt0twvspzP1lcXru
        b4zJY+2sprNPFBXMHJv5pFwoXBfR+fa/WQ==
X-Google-Smtp-Source: ABdhPJxEzZfUmnY+8RdDSplSyceNjCEFGh2irKKdJQwf5QzySzQDtRXCWEqq3cZLtilVc0ztQy7nIQ==
X-Received: by 2002:a05:6a00:7c7:: with SMTP id n7mr844399pfu.291.1597895927794;
        Wed, 19 Aug 2020 20:58:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q6sm499457pjr.20.2020.08.19.20.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 20:58:46 -0700 (PDT)
Message-ID: <5f3df4f6.1c69fb81.d3f0e.2142@mx.google.com>
Date:   Wed, 19 Aug 2020 20:58:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.9-rc1-381-g159f8cd76711
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 344 runs,
 27 regressions (v5.9-rc1-381-g159f8cd76711)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 344 runs, 27 regressions (v5.9-rc1-381-g159f8c=
d76711)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/4    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 3/4    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =

omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 82/88  =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 83/88  =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | sunxi_defconf=
ig              | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc1-381-g159f8cd76711/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc1-381-g159f8cd76711
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      159f8cd76711c3bfcd34dd918786483f6364045e =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc17d4a5130210cd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc17d4a5130210cd99=
a3a
      failing since 106 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc34db2beb6f0dfd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc34db2beb6f0dfd99=
a3a
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc89a7bfb52a61ad99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc89a7bfb52a61ad99=
a3a
      failing since 1 day (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fai=
l: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc9ec9458ca7465d99a3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc9ec9458ca7465d99=
a3f
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc55ec6c7eac76ad99a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc55ec6c7eac76ad99=
a3b
      failing since 2 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dbbfdffa82a4b50d99a6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dbbfdffa82a4b50d99=
a6c
      failing since 9 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dbcbd88c8cc3a56d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dbcbd88c8cc3a56d99=
a3a
      failing since 9 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f3dc344086196931bd99a6c

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3dc3440861969=
31bd99a6f
      failing since 8 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-20 00:26:33.216000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-20 00:26:33.221000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-20 00:26:33.225000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-20 00:26:33.230000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-20 00:26:33.236000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-20 00:26:33.241000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-20 00:26:33.250000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-20 00:26:33.256000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-20 00:26:33.261000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-20 00:26:33.265000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f3dc5ca05e1dd0a01d99a39

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3dc5ca05e1dd0=
a01d99a3c
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-20 00:37:19.288000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-20 00:37:19.293000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-20 00:37:19.297000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-20 00:37:19.304000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-20 00:37:19.310000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-20 00:37:19.315000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-20 00:37:19.319000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-20 00:37:19.324000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-20 00:37:19.330000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-20 00:37:19.336000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3dc313086196931bd99a4b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3dc3130861969=
31bd99a4f
      failing since 8 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-20 00:25:50.005000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-20 00:25:50.011000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-20 00:25:50.017000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-20 00:25:50.023000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-20 00:25:50.029000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-20 00:25:50.035000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-20 00:25:50.041000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-20 00:25:50.047000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-20 00:25:50.053000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-20 00:25:50.059000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3dc4e16f005103c1d99a3f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3dc4e16f00510=
3c1d99a43
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-20 00:33:32.259000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-20 00:33:32.265000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-20 00:33:32.270000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-20 00:33:32.276000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-20 00:33:32.282000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-20 00:33:32.287000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-20 00:33:32.293000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-20 00:33:32.299000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-20 00:33:32.305000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-20 00:33:32.311000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc50bf3a0a9f879d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc50bf3a0a9f879d99=
a3a
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc450ce6299e486d99a80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc450ce6299e486d99=
a81
      failing since 14 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 82/88  =


  Details:     https://kernelci.org/test/plan/id/5f3dbe1b87b73426e6d99a47

  Results:     82 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3dbe1b87b7342=
6e6d99a4b
      new failure (last pass: v5.9-rc1-311-g44ce88b59ae4)
      11 lines

    2020-08-20 00:04:31.724000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000010
    2020-08-20 00:04:31.727000  kern  :alert : Mem abort info:
    2020-08-20 00:04:31.731000  kern  :alert :   ESR =3D 0x96000006
    2020-08-20 00:04:31.737000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-20 00:04:31.740000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-20 00:04:31.744000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-20 00:04:31.747000  kern  :alert : Data abort info:
    2020-08-20 00:04:31.751000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-20 00:04:31.754000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-20 00:04:31.761000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ebb54000
    ... (1 line(s) more)
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f3dbe1b87b7=
3426e6d99a4c
      new failure (last pass: v5.9-rc1-311-g44ce88b59ae4)
      2 lines

    2020-08-20 00:04:31.787000  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2020-08-20 00:04:31.794000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

     * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/i=
d/5f3dbe1b87b73426e6d99a7a
      new failure (last pass: v5.9-rc1-311-g44ce88b59ae4)

    2020-08-20 00:04:37.209000  <8>[  141.108014] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-driver-present RESULT=3Dpass>
    2020-08-20 00:04:38.223000  /lava-2556925/1/../bin/lava-test-case
    2020-08-20 00:04:38.232000  <8>[  142.132580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f3dbf0df2d7148b79d99a39

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3dbf0df2d7148=
b79d99a3d
      new failure (last pass: v5.9-rc1-311-g44ce88b59ae4)
      11 lines

    2020-08-20 00:08:35.095000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000010
    2020-08-20 00:08:35.098000  kern  :alert : Mem abort info:
    2020-08-20 00:08:35.102000  kern  :alert :   ESR =3D 0x96000006
    2020-08-20 00:08:35.108000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-20 00:08:35.111000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-20 00:08:35.115000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-20 00:08:35.118000  kern  :alert : Data abort info:
    2020-08-20 00:08:35.122000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-20 00:08:35.125000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-20 00:08:35.133000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ec1ac000
    ... (1 line(s) more)
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f3dbf0df2d7=
148b79d99a3e
      new failure (last pass: v5.9-rc1-311-g44ce88b59ae4)
      2 lines

    2020-08-20 00:08:35.159000  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2020-08-20 00:08:35.166000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dbe65f8ef29da13d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dbe65f8ef29da13d99=
a3a
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc017fe2834d421d99a4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc017fe2834d421d99=
a4c
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc19d5941108ccdd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc19d5941108ccdd99=
a3a
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc4a6356278ff08d99a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc4a6356278ff08d99=
a5a
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc5ee05e1dd0a01d99a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc5ee05e1dd0a01d99=
a4d
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc837cbd117717cd99a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc837cbd117717cd99=
a3b
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dc9b3f237790cd6d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/base=
line-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/base=
line-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dc9b3f237790cd6d99=
a3a
      failing since 2 days (last pass: v5.8-13316-g31a0e28a656f, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dbc2588f8116d4dd99a5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dbc2588f8116d4dd99=
a60
      failing since 2 days (last pass: v5.8-13251-g8d2ac1ce7b76, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3dbe3ea61c25775bd99a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-38=
1-g159f8cd76711/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3dbe3ea61c25775bd99=
a4f
      failing since 2 days (last pass: v5.8-13251-g8d2ac1ce7b76, first fail=
: v5.9-rc1-137-ga49f4f3ccd1d)  =20
