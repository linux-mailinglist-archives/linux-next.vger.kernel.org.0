Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27EB220E4D
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 15:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbgGONiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 09:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731790AbgGONiQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 09:38:16 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13156C061755
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 06:38:16 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id l63so3074263pge.12
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mR/ETcp8pBQZ6yTuzHllcAztAJQ7ZB0cQuBmhBjrOf0=;
        b=gVHU8JcB3ZafpgorohScaZvW1zIEhEDFXWdddthjPawR+D1Z3Zn/2F4YxddKqE1vR0
         daxhuZU2Yb1IlC7uEsroheehaLWxCr1Bnl8ooLK8ORAS54vWBLS8XGFf57MkMCUoCB2i
         ymFOo+4cqXvxJGnV2PIIFHc9geXl7FzKcxYwv052K7y7ikW+3jtY9v+N9X313hE9N4W1
         AvUQ/vUfYpL79h6D+fPdpzKawOtdrNVOZmtQJPq5MTahAwOFXBWcuq9vdXO+xLppmRsr
         hocdJVjz2fQ4dY9vyO5xxkJpz+CF0nVbGPqfIBa6GFb0Vubt9L5nB1nwrXj2YngGh1FV
         kYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mR/ETcp8pBQZ6yTuzHllcAztAJQ7ZB0cQuBmhBjrOf0=;
        b=aao3psD+TFg+dxLSPsEbyKCfXhG65MnR+bwtzUz3EJq/wveGx8xGN1SZWjjaZsmve5
         YNe9cYnVF9CWz7w+Ewd3KvMSE44bS+UMBldd0etUFjl4RDRYIWDmI5csev03zCNvOyJR
         xcfcpEC9H0sXELX870bNIHtlTsk/p9zOxSZHCdZhzykv4roNk+4tziAuV+OO8a4y4nvC
         8ILn/wTQA6/KPDzQxOkM7mbqjTyxevqhS0/lZfqZf5dmcLXNi4P1eU3xJ10o5NF+cz30
         4iTh3XLpkxv6+fQi0Ep8Sj+ZoNBkrjeoi8mn66F+1TnTB3jA1YkhZe0KnTqGFXqaTBWF
         Zn2g==
X-Gm-Message-State: AOAM531ccfh8BjsVmY4B6PUuwb+JU3jG8CopLTFDbsYz5WJrzlgWQN61
        LMuSTTeSqV3NkszUHvqa2dTJ4AIF0L8=
X-Google-Smtp-Source: ABdhPJwGeYjRUFmun+CQzD7A/75lvVLx2m6FUd/rsW1Cci2WB2uOoV+KI8pRvW6ur4K7P2KbpzolQA==
X-Received: by 2002:a63:1641:: with SMTP id 1mr8206751pgw.370.1594820294978;
        Wed, 15 Jul 2020 06:38:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a17sm2155129pgw.60.2020.07.15.06.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 06:38:14 -0700 (PDT)
Message-ID: <5f0f06c6.1c69fb81.e1668.5a37@mx.google.com>
Date:   Wed, 15 Jul 2020 06:38:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200715
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 292 runs, 17 regressions (next-20200715)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 292 runs, 17 regressions (next-20200715)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 4/5    =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2/4    =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =

vexpress-v2p-ca15-tc1      | arm   | lab-baylibre  | gcc-8    | vexpress_de=
fconfig           | 3/5    =

vexpress-v2p-ca15-tc1      | arm   | lab-cip       | gcc-8    | vexpress_de=
fconfig           | 3/5    =

vexpress-v2p-ca15-tc1      | arm   | lab-collabora | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200715/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200715
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ca0e494af5edb59002665bf12871e94b4163a257 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ec91c1739a7b4df85bb4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ec91c1739a7b4df85b=
b4b
      failing since 77 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed1575cc994fae585bb23

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ed1575cc994fa=
e585bb26
      new failure (last pass: next-20200714)
      1 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed3600c72e43f5185bb2c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ed3600c72e43f=
5185bb2f
      new failure (last pass: next-20200714)
      2 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ece29a15e2f140085bb28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ece29a15e2f140085b=
b29
      new failure (last pass: next-20200629) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3       | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ed32bc19c5c5bca85bb51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ed32bc19c5c5bca85b=
b52
      new failure (last pass: next-20200629) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f0ecec13e872543f685bb45

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f0ecec13e87254=
3f685bb48
      new failure (last pass: next-20200702)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f0e=
cec13e872543f685bb49
      new failure (last pass: next-20200702)
      54 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ed006e2e596bd5a85bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ed006e2e596bd5a85b=
b21
      failing since 9 days (last pass: next-20200703, first fail: next-2020=
0706) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ecebaa034f6622485bb38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ecebaa034f6622485b=
b39
      new failure (last pass: next-20200714) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0eceb5d0e1021f9985bb26

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f0eceb5d0e1021=
f9985bb2a
      new failure (last pass: next-20200710)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed25dcb232a62d185bb42

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f0ed25dcb232a6=
2d185bb46
      failing since 0 day (last pass: next-20200713, first fail: next-20200=
714)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ececd7246179bb785bb2a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f0ececd7246179=
bb785bb2e
      new failure (last pass: next-20200710)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
omap4-panda                | arm   | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed2642f62f3010685bc2f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f0ed2642f62f30=
10685bc33
      failing since 0 day (last pass: next-20200713, first fail: next-20200=
714)
      60 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ed1f70184d5478585bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ed1f70184d5478585b=
b23
      failing since 9 days (last pass: next-20200703, first fail: next-2020=
0706) =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
vexpress-v2p-ca15-tc1      | arm   | lab-baylibre  | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed0b8b5819c315885bb1f

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ed0b8b5819c31=
5885bb22
      failing since 39 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
vexpress-v2p-ca15-tc1      | arm   | lab-cip       | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed0c1b5819c315885bb2a

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ed0c1b5819c31=
5885bb2d
      failing since 39 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                   | arch  | lab           | compiler | defconfig  =
                  | results
---------------------------+-------+---------------+----------+------------=
------------------+--------
vexpress-v2p-ca15-tc1      | arm   | lab-collabora | gcc-8    | vexpress_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ed0cc4fdab6509885bb24

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200715/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200715/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ed0cc4fdab650=
9885bb27
      failing since 39 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
