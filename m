Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEFA2BA937
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 12:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgKTL37 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 06:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgKTL37 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 06:29:59 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B295EC0613CF
        for <linux-next@vger.kernel.org>; Fri, 20 Nov 2020 03:29:57 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id t8so7561358pfg.8
        for <linux-next@vger.kernel.org>; Fri, 20 Nov 2020 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7b+64NTTX/TCbSoUGlsbzyc6sjowwpdEYoEb90M6Z+I=;
        b=p6C0XDXaOtywR4JdIatcPA970VIbOzQC3saF/Hx1UpAtpczS8V+XibEaaJnnGycBrs
         roIfNmF3VIioLeyGVgkCYYrO8QyP0m0xEACeX+pUvMx8v82kMUTgmBw4bMjtTUMh/s9S
         wSkfwdefFHp5gjm44MZHhaE6u/skyi52krf+no5y/nGs0PLu5rL2Zur6bmmtsR7ciEu6
         ML4TAs0g+NDltBLxkiJKrPKa5p815yQKPriSfjQ59LGYXmzM7uYd9ll7PbfI3kywd46p
         BzpsEr+Wo0Zc0KMXbds2Vi2yvh269h0AaukGjD7fyKWxvNmXFLJ09dufTCdp52RpaywQ
         tX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7b+64NTTX/TCbSoUGlsbzyc6sjowwpdEYoEb90M6Z+I=;
        b=ak0kd8X+T+WjAnNJLppWMiMx9ahxYnvkzgN6+NKMBJui5Lk3A2m744GJljQXYZJp5j
         6rFSUmX5FlvGAPojENkpAuXLHelXHT+RwKI4fpPVyE5SwQgdWySGiGTCIIKXWm7ttkf0
         mbqTm9Ip0kb611kNqQBm8hPtQ+dmZ5Andb2zVkLq/FIzprpJ5lbO2DP6kgh79Lt2dWx3
         u/T64eEUfN65n8pnFtC/buMqOltUGY4MbIj8xfZozKC6o5BPIFcSovpGNPxdPhCAM/6D
         xyHKVHEh/XNH4BvGmmsPkg/LkImn5UDA6FggtgUcO7HSUFimZEYKkqXM2dYbk1eZS96l
         KfSw==
X-Gm-Message-State: AOAM530eGXxbjL+ev4SK7kMq7LDxOcH2//l7IDGlFCmQZ07nP5JqA84R
        ln1YqfTpLJOOmKxNbZdJsAUeVx3hPx0KjQ==
X-Google-Smtp-Source: ABdhPJxrsQUfs3qFR5HZboq96/aM5w1Qf+hKgTvSxMhtw+rZSMnclDqIeGSZQXR/GLp0186EUgPNTg==
X-Received: by 2002:a17:90a:e391:: with SMTP id b17mr9729373pjz.209.1605871795431;
        Fri, 20 Nov 2020 03:29:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c127sm3154143pfc.115.2020.11.20.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 03:29:54 -0800 (PST)
Message-ID: <5fb7a8b2.1c69fb81.40e26.611b@mx.google.com>
Date:   Fri, 20 Nov 2020 03:29:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201120
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 742 runs, 109 regressions (next-20201120)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 742 runs, 109 regressions (next-20201120)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-8    | sama5_de=
fconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-8    | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | clang-10 | multi_v7=
_defconfig           | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-10 | defconfi=
g                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-11 | defconfi=
g                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-8    | defconfi=
g                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

hip07-d05                    | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 1          =

hip07-d05                    | arm64  | lab-collabora | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                    | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 1          =

hip07-d05                    | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                    | arm64  | lab-collabora | gcc-8    | defconfi=
g                    | 1          =

imx6q-sabresd                | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre  | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | clang-11 | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | gcc-8    | defconfi=
g                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb         | arm    | lab-baylibre  | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-cip       | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-collabora | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | gcc-8    | i386_def=
config               | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-8    | x86_64_d=
efconfig             | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-8    | multi_v7=
_defconfig           | 1          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201120/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201120
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      95065cb54210eba86bed10cb2118041524d54573 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-8    | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7714a2aca48dfa3d8d90b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7714a2aca48dfa3d8d=
90c
        failing since 2 days (last pass: next-20201106, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-8    | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77a29994f9c9d61d8d908

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77a29994f9c9d61d8d=
909
        failing since 23 days (last pass: next-20201027, first fail: next-2=
0201028) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7827d29b2495ddcd8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7827d29b2495ddcd8d=
8fe
        failing since 50 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77412e7b142ed5fd8d92c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb77412e7b142ed=
5fd8d92f
        new failure (last pass: next-20201119)
        2 lines

    2020-11-20 07:43:04.989000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-20 07:43:04.989000+00:00  (user:khilman) is already connected
    2020-11-20 07:43:20.250000+00:00  =00
    2020-11-20 07:43:20.251000+00:00  =

    2020-11-20 07:43:20.267000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-20 07:43:20.268000+00:00  =

    2020-11-20 07:43:20.268000+00:00  DRAM:  948 MiB
    2020-11-20 07:43:20.283000+00:00  RPI 3 Model B (0xa02082)
    2020-11-20 07:43:20.374000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-20 07:43:20.407000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (384 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76ec597dd000e19d8d910

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb76ec597dd000e=
19d8d913
        new failure (last pass: next-20201119)
        1 lines

    2020-11-20 07:20:41.465000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-20 07:20:41.465000+00:00  (user:khilman) is already connected
    2020-11-20 07:20:57.322000+00:00  =00
    2020-11-20 07:20:57.323000+00:00  =

    2020-11-20 07:20:57.338000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-20 07:20:57.339000+00:00  =

    2020-11-20 07:20:57.339000+00:00  DRAM:  948 MiB
    2020-11-20 07:20:57.354000+00:00  RPI 3 Model B (0xa02082)
    2020-11-20 07:20:57.445000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-20 07:20:57.477000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7775b5dc974dd05d8d909

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7775b5dc974dd05d8d=
90a
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb778aba734ac3aaad8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb778aba734ac3aaad8d=
8fe
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b6cb8a28ce627d8d91d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b6cb8a28ce627d8d=
91e
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77ea2c2693ecf23d8d916

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77ea2c2693ecf23d8d=
917
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb777fc6febb2f1e6d8d910

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb777fc6febb2f1e6d8d=
911
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77ceb8d4272e1bfd8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77ceb8d4272e1bfd8d=
8fe
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb775f9da97b5f229d8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb775f9da97b5f229d8d=
910
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb779e0881f2b9a3fd8d90a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb779e0881f2b9a3fd8d=
90b
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7813515cd00f470d8d93b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7813515cd00f470d8d=
93c
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb770e486154a3df5d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb770e486154a3df5d8d=
8fe
        failing since 2 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hip07-d05                    | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77a06b0d249be10d8d91e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77a06b0d249be10d8d=
91f
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hip07-d05                    | arm64  | lab-collabora | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb770d0479b40fae8d8d907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb770d0479b40fae8d8d=
908
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hip07-d05                    | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb775fe0c97d71f21d8d8fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb775fe0c97d71f21d8d=
8ff
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hip07-d05                    | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76f8da37d40bc0bd8d934

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76f8da37d40bc0bd8d=
935
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hip07-d05                    | arm64  | lab-collabora | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7735c30ce443825d8d915

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7735c30ce443825d8d=
916
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6q-sabresd                | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77252437fa8ba86d8d92d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77252437fa8ba86d8d=
92e
        failing since 25 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre  | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77dc89c394639ccd8d922

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77dc89c394639ccd8d=
923
        failing since 7 days (last pass: next-20201112, first fail: next-20=
201113) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77723126c99a309d8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77723126c99a309d8d=
90d
        failing since 2 days (last pass: next-20201112, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b81c92fc28537d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b81c92fc28537d8d=
8fe
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb779008e68295dd5d8d913

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb779008e68295dd5d8d=
914
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77242437fa8ba86d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77242437fa8ba86d8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb774bdf55790b20fd8d921

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb774bdf55790b20fd8d=
922
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76f68fc88c1e3a1d8d937

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76f68fc88c1e3a1d8d=
938
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb774848dc56b6ec0d8d92b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb774848dc56b6ec0d8d=
92c
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76e05b43102169cd8d91e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76e05b43102169cd8d=
91f
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76facaab2411e95d8d907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76facaab2411e95d8d=
908
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7774e46afdc4b6ad8d90a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7774e46afdc4b6ad8d=
90b
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb78263e311828bfbd8d966

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb78263e311828bfbd8d=
967
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb788f14ed96a39add8d925

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb788f14ed96a39add8d=
926
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb778c7526b22d2b0d8d979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb778c7526b22d2b0d8d=
97a
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb784ba6540ea49b2d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb784ba6540ea49b2d8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77687878910841ad8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77687878910841ad8d=
90d
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77d2372c9296b11d8d93e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77d2372c9296b11d8d=
93f
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb790114ccf213931d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb790114ccf213931d8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76f6ea37d40bc0bd8d902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76f6fa37d40bc0bd8d=
903
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77488a38f08fe54d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77488a38f08fe54d8d=
8fe
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77d078ae3a99173d8d90a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77d078ae3a99173d8d=
90b
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb78178789b491babd8d918

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb78178789b491babd8d=
919
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77457dc9bac6215d8d973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77457dc9bac6215d8d=
974
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b4dc4205fcb69d8d91e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b4dc4205fcb69d8d=
91f
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb772d851f05e93e8d8d906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb772d851f05e93e8d8d=
907
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb775dc15c00e828fd8d912

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb775dc15c00e828fd8d=
913
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77774678ded5470d8d924

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77774678ded5470d8d=
925
        new failure (last pass: next-20201118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77fd32ce017ee43d8d910

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77fd32ce017ee43d8d=
911
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7785772a79302c0d8d91d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb7785772a7930=
2c0d8d922
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77baf12a6159d38d8d908

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77baf12a6159d38d8d=
909
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb774b4f55790b20fd8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb774b4f55790b20fd8d=
910
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7730f03212e7b42d8d90d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7730f03212e7b42d8d=
90e
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb776523ac3fea3ded8d918

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb776523ac3fea3ded8d=
919
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77d5dcf5c2f5f91d8d944

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb77d5dcf5c2f5=
f91d8d949
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7765a291edfd418d8d91a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7765a291edfd418d8d=
91b
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77996eef5d97b3fd8d914

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77996eef5d97b3fd8d=
915
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7719bfde828999fd8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7719bfde828999fd8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb777f36febb2f1e6d8d906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb777f36febb2f1e6d8d=
907
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7700a2d5bdd48dfd8d91f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7700a2d5bdd48dfd8d=
920
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb773194daa8ca216d8d914

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb773194daa8ca216d8d=
915
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb774bff55790b20fd8d924

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb774bff55790b20fd8d=
925
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b50970b64a593d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b50970b64a593d8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77ceacd02205345d8d926

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77ceacd02205345d8d=
927
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb773ffd6bacb327dd8d90b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb773ffd6bacb327dd8d=
90c
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b38ff203ec8fdd8d91e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b38ff203ec8fdd8d=
91f
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb772355955559d8fd8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb772355955559d8fd8d=
90d
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb775bc37fd9f6509d8d8fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb775bc37fd9f6509d8d=
8ff
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7775961545cdd64d8d900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7775961545cdd64d8d=
901
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77f4a0c11a63779d8d909

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77f4a0c11a63779d8d=
90a
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb772714bdcd3ffe7d8d925

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb772714bdcd3ffe7d8d=
926
        failing since 2 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7757402014ac247d8d935

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7757402014ac247d8d=
936
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76f79a37d40bc0bd8d911

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76f79a37d40bc0bd8d=
912
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77494d3636326c6d8d933

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77494d3636326c6d8d=
934
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76e1637f384a79ad8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76e1637f384a79ad8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb771165f3458f1c4d8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb771165f3458f1c4d8d=
910
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb771472aca48dfa3d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb771472aca48dfa3d8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7775f5dc974dd05d8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7775f5dc974dd05d8d=
90d
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb778f9bc68edcf3fd8d919

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb778f9bc68edcf3fd8d=
91a
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77cc48316a8dc76d8d90a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77cc48316a8dc76d8d=
90b
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7735830ce443825d8d90f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7735830ce443825d8d=
910
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b1444966b0b66d8d8fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b1444966b0b66d8d=
8ff
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb771b30145d649cbd8d908

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb771b40145d649cbd8d=
909
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7753990cca17081d8d905

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7753990cca17081d8d=
906
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb776d72cf0c16af6d8d92d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb776d72cf0c16af6d8d=
92e
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb787334e289862f8d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb787334e289862f8d8d=
8fe
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77d1472c9296b11d8d91a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77d1472c9296b11d8d=
91b
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb786d80860b5fc8ed8d921

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb786d80860b5fc8ed8d=
922
        failing since 1 day (last pass: next-20201118, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77638291edfd418d8d8fe

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb77638291edfd=
418d8d903
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb781a543094ee63cd8d919

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb781a543094ee63cd8d=
91a
        failing since 1 day (last pass: next-20201118, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77b2e44966b0b66d8d986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77b2e44966b0b66d8d=
987
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb78c5401e315e22ad8d91d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb78c5401e315e22ad8d=
91e
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb772702289ac3314d8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb772702289ac3314d8d=
90d
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76e7e7980a5e64ad8d903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76e7e7980a5e64ad8d=
904
        failing since 0 day (last pass: next-20201118, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb771185f3458f1c4d8d912

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb771185f3458f1c4d8d=
913
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb782f41c1fb04cfdd8d924

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb782f41c1fb04cfdd8d=
925
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb787af5bc3b37e8fd8d903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb787af5bc3b37e8fd8d=
904
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7856623b291c6ead8d8ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7856623b291c6ead8d=
900
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7766cd723285a09d8d923

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7766cd723285a09d8d=
924
        failing since 1 day (last pass: next-20201118, first fail: next-202=
01119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77f3317e67cfac4d8d90e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77f3317e67cfac4d8d=
90f
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb789e7122de079a1d8d902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb789e7122de079a1d8d=
903
        failing since 1 day (last pass: next-20201117, first fail: next-202=
01118) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-baylibre  | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76def7c9236afa8d8d923

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76def7c9236afa8d8d=
924
        failing since 2 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-cip       | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76e01b43102169cd8d906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76e01b43102169cd8d=
907
        failing since 2 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-collabora | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76e0fb43102169cd8d94a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76e0fb43102169cd8d=
94b
        failing since 2 days (last pass: next-20201113, first fail: next-20=
201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | gcc-8    | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76fb3aab2411e95d8d927

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76fb3aab2411e95d8d=
928
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb76ee3579cd924c2d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb76ee3579cd924c2d8d=
8fe
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77685878910841ad8d909

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77685878910841ad8d=
90a
        new failure (last pass: next-20201119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb7826ee311828bfbd8d97e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb7826ee311828bfbd8d=
97f
        failing since 8 days (last pass: next-20201110, first fail: next-20=
201111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb77fa73df941ef33d8d90d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb77fa73df941ef33d8d=
90e
        failing since 8 days (last pass: next-20201110, first fail: next-20=
201111) =

 =20
