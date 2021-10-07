Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59BD425B88
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 21:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbhJGT2y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 15:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbhJGT2y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 15:28:54 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB75C061570
        for <linux-next@vger.kernel.org>; Thu,  7 Oct 2021 12:26:59 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id e7so769397pgk.2
        for <linux-next@vger.kernel.org>; Thu, 07 Oct 2021 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M604lIL6Ockd/qHgiyceLCivo8HvdHoTZITbHNVIs0o=;
        b=ApvWpMECd1WumEjZvtEM+9gMMHueW2f/igUfDAPKp91Owuf8dZsM/eMbm/TAPFaG8s
         nw1JMgjXs74FWfl2i7x/a5T7hKX4h/WBaZ2L92JXuoSkxJ6MbbgW2R/KiFtWkG01FpKs
         Vxib6maFERst+s5HxSUSppoYWnmO+/DzFxm1/3e0er1QZwEg8yHbqIjzkI1HxKTPaJdG
         j5ThAYs/K/jXkLROqm24sniRlGj1nkcQghCmEEWYZ6TAGD5OnyWHgZjj5H7FkymT7OQk
         gJ1vpYl22nA4U2RVdzolUFV1Rsr6jeDRYWeKqKlAHCi10qcJNDrUyu/OgqhO1YcXUW24
         5uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M604lIL6Ockd/qHgiyceLCivo8HvdHoTZITbHNVIs0o=;
        b=C4zbTmze7PXqdwAwZ0mckLiqYv863EkOxjpHETr5b1HpRez3cMB5txjLMGH6y/xOFP
         bXaMER9HY966peXQJi0QkP7OTBHxu66jMR0aEiUog+Wcr1ggIhRdLygbdXU2hbc39kIm
         B2vzmuWp1W8Ack+6JVqVKZuT6qO0Et91HokOihoVVmt1YmdXpsI5S2xVoemDtTwdysbr
         zMyeo2VAjIJkthOkgZB/KLRGl+UlBjuYBcHxNBS/Y9hm7RA2zTJfNBvuL/9skaBZFUyE
         luacIHO+IPGSCAyvjQHMNrF2AIzg1AxDsmurpFEYAwHWCweewcgPBzbLqGDL9sGfmiEu
         Ppxw==
X-Gm-Message-State: AOAM532/3bWgDRRxl8rmCyQVuy5V3nnWq9Dez3tbcb1J87pqCyLNeZbm
        /l0T52u+auZncnKVdJXSUzAGHJGvFlSgTMdj
X-Google-Smtp-Source: ABdhPJw3Z3xecLFPOZaSp6APu33zpNRKnV9pbFdKcvHtNk4sXSg+JN9xLp1UukfQV5CdGoMJ4WdEZA==
X-Received: by 2002:a62:800a:0:b0:447:b73e:6e18 with SMTP id j10-20020a62800a000000b00447b73e6e18mr6196945pfd.28.1633634818131;
        Thu, 07 Oct 2021 12:26:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c11sm3359780pji.38.2021.10.07.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 12:26:57 -0700 (PDT)
Message-ID: <615f4a01.1c69fb81.ec8bb.9dc1@mx.google.com>
Date:   Thu, 07 Oct 2021 12:26:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211007
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 613 runs, 79 regressions (next-20211007)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 613 runs, 79 regressions (next-20211007)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+crypto             | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-8    | oxnas_v6_=
defconfig           | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora | gcc-8    | versatile=
_defconfig          | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+crypto             | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima                | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-12 | defconfig=
                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun5i-a13-olinuxino-micro    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun5i-a13-olinuxino-micro    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | clang-12 | multi_v7_=
defconfig           | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-8    | sunxi_def=
config              | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | clang-12 | multi_v7_=
defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...BIG_ENDIAN=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211007/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211007
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f8dc23b3dc0cc5b32dfd0c446e59377736d073a7 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0ef858d1558a6599a2ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0ef858d1558a6599a=
2ef
        failing since 224 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0eb88b658d6cff99a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0eb88b658d6cff99a=
2f9
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0c398577a0e92699a31e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0c398577a0e92699a=
31f
        failing since 3 days (last pass: next-20210930, first fail: next-20=
211001) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0af955e1be741999a309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0af955e1be741999a=
30a
        failing since 321 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f12a66e6675a10899a2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f12a66e6675a10899a=
2f1
        failing since 321 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f14c59ee17b941c99a32d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f14c59ee17b941c99a=
32e
        failing since 321 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f079c3f584898df99a2f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f079c3f584898df99a=
2fa
        failing since 160 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0c01866bd6b79999a30e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0c01866bd6b79999a=
30f
        failing since 98 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f17776b089e89c899a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f17776b089e89c899a=
2e6
        failing since 99 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f18ec7b5c131ffa99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f18ec7b5c131ffa99a=
2e0
        failing since 98 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0a816ecbd9bbcf99a2f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0a816ecbd9bbcf99a=
2f6
        failing since 346 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0c2d93359fd3dc99a31d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0c2d93359fd3dc99a=
31e
        failing since 1 day (last pass: next-20210930, first fail: next-202=
11005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f12f44e7f2ff80a99a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f12f44e7f2ff80a99a=
2df
        failing since 14 days (last pass: next-20210922, first fail: next-2=
0210923) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-8    | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f054435d2ac546199a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f054435d2ac546199a=
2fc
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615f08603e86725a4899a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f08603e86725a4899a=
2e6
        failing since 323 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615f085cdec3fec88699a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f085cdec3fec88699a=
2f3
        failing since 323 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1cc07cc544c19b99a323

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1cc07cc544c19b99a=
324
        failing since 323 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f09b8850ca4694f99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f09b8850ca4694f99a=
2ee
        failing since 16 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0b0ce8e11c093899a312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0b0ce8e11c093899a=
313
        failing since 16 days (last pass: next-20210914, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0c61fe249443b499a303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0c61fe249443b499a=
304
        failing since 16 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0f0a58d1558a6599a35f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0f0a58d1558a6599a=
360
        failing since 114 days (last pass: next-20210611, first fail: next-=
20210615) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f105e98f288ad0c99a2f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f105e98f288ad0c99a=
2f5
        failing since 16 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f138bb4c262e56b99a2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f138bb4c262e56b99a=
2f1
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f09effc5f08ce5199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f09effc5f08ce5199a=
2db
        failing since 1 day (last pass: next-20211001, first fail: next-202=
11005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0c1fc2dc16d90599a315

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0c1fc2dc16d90599a=
316
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0f17514c52006999a2ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0f17514c52006999a=
2ed
        failing since 238 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1093e82a7e0bb499a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1093e82a7e0bb499a=
2eb
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0df17fc5e469c799a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0df17fc5e469c799a=
2fc
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0f47dd0c613d9999a38c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0f47dd0c613d9999a=
38d
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f09f2fc5f08ce5199a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f09f2fc5f08ce5199a=
2de
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0b46fbc87d874299a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0b46fbc87d874299a=
2dd
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0c9c4aa9e5c4b499a346

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0c9c4aa9e5c4b499a=
347
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f127415a581419099a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f127415a581419099a=
2e2
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f13dc1ca671784699a311

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f13dc1ca671784699a=
312
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0a7bcd2e08e52b99a3e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0a7bcd2e08e52b99a=
3e9
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0be34f80cebf9c99a309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0be34f80cebf9c99a=
30a
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0eb38b658d6cff99a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0eb38b658d6cff99a=
2f4
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f110bf65c099c3099a300

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f110bf65c099c3099a=
301
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f2087a3e4caee0a99a337

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f2087a3e4caee0a99a=
338
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f15442b28446ecb99a301

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-o=
rangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-o=
rangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f15442b28446ecb99a=
302
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f16ac32db01fd4099a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f16ac32db01fd4099a=
2f4
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1814e2bfb2ed6599a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1814e2bfb2ed6599a=
2fc
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1c4d25c6a9fb8399a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-o=
rangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-o=
rangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1c4d25c6a9fb8399a=
2e0
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1db55d936f5eb899a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1db55d936f5eb899a=
2f4
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1918834fd31fc999a304

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1918834fd31fc999a=
305
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1a9534f8380a8199a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1a9534f8380a8199a=
2e8
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f102fa6286040cb99a31a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-o=
rangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f102fa6286040cb99a=
31b
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f11ab2c8255137a99a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f11ab2c8255137a99a=
2f9
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1327217f63ff1c99a2fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1327217f63ff1c99a=
2fe
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f16204c32b1158899a451

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f16204c32b1158899a=
452
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f179c6b089e89c899a391

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f179c6b089e89c899a=
392
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f12c39d3102781199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f12c39d3102781199a=
2db
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f143fdd1c3f4ebf99a46b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f143fdd1c3f4ebf99a=
46c
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f09dadd3dae81b199a312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-p=
ine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-p=
ine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f09dadd3dae81b199a=
313
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0b5614bcad628799a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0b5614bcad628799a=
2dc
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0cd35b964c32d199a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0cd35b964c32d199a=
2dc
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0fcb0d90f2048899a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0fcb0d90f2048899a=
2fc
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615f11471e68e2628299a35d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f11471e68e2628299a=
35e
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun5i-a13-olinuxino-micro    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0d488a9b0e70c499a2fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun5i-a13-oli=
nuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun5i-a13-oli=
nuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0d488a9b0e70c499a=
2fe
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun5i-a13-olinuxino-micro    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/615f07a7105f8de6e499a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f07a7105f8de6e499a=
2df
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1a44a362795b2899a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1a44a362795b2899a=
2db
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f174c4c2ef0b91b99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f174c4c2ef0b91b99a=
2db
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f18c86ade7d7e4f99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-a33-olinu=
xino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-a33-olinu=
xino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f18c86ade7d7e4f99a=
2e9
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-8    | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/615f07be105f8de6e499a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f07be105f8de6e499a=
2f8
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f13429712a2fea599a302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f13429712a2fea599a=
303
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0fa99bbf26e42f99a2ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0fa99bbf26e42f99a=
2f0
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0b0155e1be741999a31b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0b0155e1be741999a=
31c
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0d451106f7fdf099a348

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h2-plus=
-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0d451106f7fdf099a=
349
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0f6ac78275857f99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0f6ac78275857f99a=
2dc
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0ae3628d02cd0099a304

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0ae3628d02cd0099a=
305
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0d2a8abdf6e4fd99a31b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-bana=
napi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-bana=
napi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0d2a8abdf6e4fd99a=
31c
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0f7ea8d677700b99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0f7ea8d677700b99a=
2db
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0ae1abd7f26cc399a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0ae1abd7f26cc399a=
2dc
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f0d288a9b0e70c499a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun8i-h3-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f0d288a9b0e70c499a=
2e8
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f20215cf99730c899a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/clang-12/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f20215cf99730c899a=
2e7
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1bac4a4447e48199a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armeb/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1bac4a4447e48199a=
2e6
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1d287dd0d4dd7999a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1d287dd0d4dd7999a=
2f7
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615f1ea4e85abdf98d99a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f1ea5e85abdf98d99a=
2e5
        new failure (last pass: next-20211005) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-8    | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/615f085edec3fec88699a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211007/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211007/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615f085edec3fec88699a=
2f8
        new failure (last pass: next-20211006) =

 =20
