Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E32E2F4CBB
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 15:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbhAMOJ2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jan 2021 09:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbhAMOJ2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2021 09:09:28 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCBEC061575
        for <linux-next@vger.kernel.org>; Wed, 13 Jan 2021 06:08:47 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id w2so1261458pfc.13
        for <linux-next@vger.kernel.org>; Wed, 13 Jan 2021 06:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GMC5uca6/NY976nPE3GQQG279sfuf/nzInBKi9ylmJg=;
        b=ZKnd51RtqSRQdXs8ipfn8+1RYC7aC8KbJ242IXdc4jOJaATEDlCcy+05BY3lnaemjf
         qSkDe97Q6655NJLuAQ9rLlpOgRQjj3HJ7PilfEiZ0aD/0VWA41PZb3ePHEZwq4FqPXZ2
         xI54TLYNc3MJLFXJjZekkFfh7uD4x6cwEHi92vowLnDNqizmXEIfZPJbH4GjH67QsOUX
         QYkA881NW6XNyd4Qwr5j9rYK3nN8Zvha5wmRiWEVO2Dblo5noQl370VMExFAx03s0ds+
         iyUTtauOsn1JBZazJ4dcB3l9Ulw+UgWh96rGGXY2XrDbm1xMlUVyB44+n93bfqknztqW
         17ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GMC5uca6/NY976nPE3GQQG279sfuf/nzInBKi9ylmJg=;
        b=YcRoxLat1Ou08tDtrfqcFTp5+tCZVADsdErSnPFyMhUsakzKOIhrs4VwKBSHNDFIda
         uE419rGVhSadXrM5ScKa0SyCqQ/TaoIqaYmrDNW7exyhsCB4Grw/fubSSuVIIIdx66X6
         wl6fhs9FyXc8Gx/2WsmIk7pLLp56M+fX6GOt3VrtUkc1kAcYNibfmYG5hJbGSztGfkoe
         xOF8jZcCpwV9x1HdtUe0n65LIkPy3DwsS6/cOYRlkBZvrpQoyK2/mZQkPkvKux5YybFy
         cTj8ls0Ses35bwkRV9Z1kAsxSxjjiLz0O5ZjMuBSa3p9Bt0OEyhzJd6nOlfOgTtx9EBf
         4DXg==
X-Gm-Message-State: AOAM5329b3M4dj0DrlagSaaZKn7tfv/KkU7fWCv4tXMnwweePtqtsSuy
        LAw4WOtvpfyDCWDPnIcAISUr0z2M8PWFNg==
X-Google-Smtp-Source: ABdhPJwjDq2Vh2z4SSSG4vttaDVBcYMLGmH/Q5zqH4AgvVDcKq/3ur/RPdkuHsGzpyUWPr9xBK42SA==
X-Received: by 2002:a62:7ac4:0:b029:19d:b6ee:c64c with SMTP id v187-20020a627ac40000b029019db6eec64cmr2348432pfc.3.1610546925846;
        Wed, 13 Jan 2021 06:08:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w63sm2860716pfc.20.2021.01.13.06.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 06:08:44 -0800 (PST)
Message-ID: <5ffefeec.1c69fb81.9ae30.6036@mx.google.com>
Date:   Wed, 13 Jan 2021 06:08:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210113
X-Kernelci-Report-Type: test
Subject: next/master baseline: 600 runs, 80 regressions (next-20210113)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 600 runs, 80 regressions (next-20210113)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

imx6sll-evk                  | arm   | lab-nxp       | clang-11 | multi_v7_=
defconfig           | 1          =

imx6sll-evk                  | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6sll-evk                  | arm   | lab-nxp       | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6sll-evk                  | arm   | lab-nxp       | gcc-8    | multi_v7_=
defconfig           | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =

meson8b-odroidc1             | arm   | lab-baylibre  | clang-11 | multi_v7_=
defconfig           | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | clang-10 | defconfig=
                    | 2          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | clang-11 | multi_v7_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-10 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-11 | defconfig=
                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | clang-10 | defconfig=
                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | clang-11 | defconfig=
                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | clang-10 | defconfig=
                    | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | clang-11 | defconfig=
                    | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | clang-11 | defconfig=
                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre  | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | clang-10 | defconfig=
                    | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre  | clang-11 | defconfig=
                    | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | clang-11 | defconfig=
                    | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-10 | defconfig=
                    | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-11 | defconfig=
                    | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 3          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-11 | defconfig=
                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-10 | defconfig=
                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-11 | defconfig=
                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210113/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210113
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aa515cdce7a151dcc14b7600d33f1414c6fa32c9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3b8398a386532c94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3b8398a386532c94=
cea
        failing since 8 days (last pass: next-20201223, first fail: next-20=
210104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec316a42b66537dc94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec316a42b66537dc94=
cd2
        failing since 8 days (last pass: next-20201223, first fail: next-20=
210104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sll-evk                  | arm   | lab-nxp       | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffeca4b9d551d7d4ec94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffeca4b9d551d7d4ec94=
ce4
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sll-evk                  | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec6ac1d409e30fcc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec6ac1d409e30fcc94=
ccf
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sll-evk                  | arm   | lab-nxp       | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec53011075c5559c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec53011075c5559c94=
cbb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sll-evk                  | arm   | lab-nxp       | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec881046e21e966c94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec881046e21e966c94=
ccc
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7e070c372bc8cc94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7e170c372bc8cc94=
ccc
        failing since 5 days (last pass: next-20210107, first fail: next-20=
210108) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecbe84bda9efea4c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecbe84bda9efea4c94=
ccd
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5ffec7f5ce3a4cf28fc94cb9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-meson-gxl-s=
905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-meson-gxl-s=
905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ffec7f5ce3a4cf2=
8fc94cbc
        new failure (last pass: next-20210112)
        1 lines

    2021-01-13 10:13:16.427000+00:00  Trying 127.0.0.1...
    2021-01-13 10:13:16.427000+00:00  Connected to 127.0.0.1.
    2021-01-13 10:13:16.428000+00:00  Escape character is '^]'.
    2021-01-13 10:13:17.392000+00:00  =00GXL:BL1:9ac50e:bb16dc;FEAT:ADFC318=
C:0;POC:0;RCY:0;USB:0;SPI:0;CHK:A7;EMMC:400;NAND:81;SD:0;READ:0;0.0;CHK:0;
    2021-01-13 10:13:17.393000+00:00  no sdio debug board detected =

    2021-01-13 10:13:17.393000+00:00  TE: 1779387
    2021-01-13 10:13:17.393000+00:00  =

    2021-01-13 10:13:17.394000+00:00  BL2 Built : 11:58:42, May 27 2017. =

    2021-01-13 10:13:17.394000+00:00  gxl gc3c9a84 - xiaobo.gu@droid05
    2021-01-13 10:13:17.394000+00:00   =

    ... (665 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ffec7f5ce3a4cf=
28fc94cbe
        new failure (last pass: next-20210112)
        2 lines

    2021-01-13 10:13:55.991000+00:00  kern  :emerg : Code: 91329007 b00092c=
0 9120e00f 17ffffe7 (d4210000<8>[   17.138820] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-13 10:13:55.991000+00:00  ) =

    2021-01-13 10:13:55.991000+00:00  + set +x
    2021-01-13 10:13:55.991000+00:00  <8>[   17.148716] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 141921_1.5.2.4.1>
    2021-01-13 10:13:56.099000+00:00  / # #   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecf2d159ea9ba70c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecf2d159ea9ba70c94=
cd2
        new failure (last pass: next-20201222) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec4cd497c5a842cc94ce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec4cd497c5a842cc94=
ce2
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffeccbcbe0c5f6660c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffeccbcbe0c5f6660c94=
cce
        new failure (last pass: next-20210108) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | clang-10 | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5ffec7bb6683770590c94d0b

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/5ffec7bb6683770590c94d23
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/5ff=
ec7bb6683770590c94d29
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 10:13:12.586000+00:00  <8>[   27.416964] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5ffec27bf2ab0909a4c94cbf

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/5ffec27bf2ab0909a4c94cd7
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-13 09:50:47.526000+00:00  /lava-3044112/1/../bin/lava-test-case
    2021-01-13 09:50:47.535000+00:00  <8>[   26.988638] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/5ff=
ec27bf2ab0909a4c94cdd
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-13 09:50:48.645000+00:00  <8>[   28.098893] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3fbe0617cd994c94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3fbe0617cd994c94=
ccb
        failing since 56 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3f423c133ec07c94d03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3f423c133ec07c94=
d04
        failing since 56 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3f5e0617cd994c94cbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3f5e0617cd994c94=
cbc
        failing since 56 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3f8e0617cd994c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3f8e0617cd994c94=
cc8
        failing since 56 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | clang-11 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffed0027e6993a274c94ce4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffed0027e6993a274c94=
ce5
        new failure (last pass: next-20210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7cfe2cd1d1080c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7cfe2cd1d1080c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec8406a96e1857cc94cfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec8406a96e1857cc94=
cfb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7dd70c372bc8cc94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7dd70c372bc8cc94=
cc6
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec37b22d9fd2a5fc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec37b22d9fd2a5fc94=
cba
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec9dab71701986fc94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec9dab71701986fc94=
cdb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7e070c372bc8cc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7e070c372bc8cc94=
cc9
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffeca91379d60c7d4c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffeca91379d60c7d4c94=
cbb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec93321b6cd26afc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec93321b6cd26afc94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3729e88ed2f6ec94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3729e88ed2f6ec94=
ce6
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecbed939f0df154c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecbed939f0df154c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7d770c372bc8cc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7d770c372bc8cc94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecaa6379d60c7d4c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecaa6379d60c7d4c94=
cc0
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec94979604e5d0bc94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec94979604e5d0bc94=
cbf
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec3749e88ed2f6ec94cea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec3749e88ed2f6ec94=
ceb
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecc04b19cba5b65c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecc04b19cba5b65c94=
cc3
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec77c1eb685d56fc94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec77c1eb685d56fc94=
cbb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecca94d366fea5bc94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecca94d366fea5bc94=
cbf
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec8c0175c975b8ac94d2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec8c0175c975b8ac94=
d2c
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec32d47d7505e48c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec32d47d7505e48c94=
cbe
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecde61b838fce1ec94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecde61b838fce1ec94=
cc1
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecf21159ea9ba70c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecf21159ea9ba70c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre  | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7801eb685d56fc94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7801eb685d56fc94=
cc0
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffeca11d39e7aa788c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffeca11d39e7aa788c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-collabora | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffef0450cd457efbac94ce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffef0450cd457efbac94=
ce2
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-collabora | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffef2ea31e7c3795dc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffef2ea31e7c3795dc94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre  | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec8c598dab30cdfc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec8c598dab30cdfc94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-collabora | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffef15522486399d2c94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffef15522486399d2c94=
ccb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec332c56965de4cc94cbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77960=
-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77960=
-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec332c56965de4cc94=
cbc
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecb5d93ba0729fdc94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecb5d93ba0729fdc94=
cc7
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec4c5497c5a842cc94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec4c5497c5a842cc94=
cd3
        failing since 29 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/5ffec740a0389adb1bc94d5b

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
ffec740a0389adb1bc94d90
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/5ffec740a0389adb1bc94d9b
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 10:10:20.497000+00:00  <8>[   25.430090] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5ffec740a0389adb1bc94d9d
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 10:10:21.535000+00:00  /lava-3044260/1/../bin/lava-test-case
    2021-01-13 10:10:21.547000+00:00  <8>[   26.479982] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-10 | defconfig=
                    | 3          =


  Details:     https://kernelci.org/test/plan/id/5ffed49d4bdd0d6e27c94cdc

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
ffed49d4bdd0d6e27c94d11
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:08:05.939000+00:00  <8>[   23.115191] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/5ffed49d4bdd0d6e27c94d1c
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:08:07.176000+00:00  <8>[   24.351272] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5ffed49d4bdd0d6e27c94d1e
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:08:08.213000+00:00  /lava-3044346/1/../bin/lava-test-case=
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-11 | defconfig=
                    | 3          =


  Details:     https://kernelci.org/test/plan/id/5ffed377ff4ecd79cdc94cb9

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
ffed377ff4ecd79cdc94cee
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:03:12.955000+00:00  <8>[   23.980647] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/5ffed377ff4ecd79cdc94cf9
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:03:14.185000+00:00  /lava-3044293/1/../bin/lava-test-case
    2021-01-13 11:03:14.196000+00:00  <8>[   25.220611] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5ffed377ff4ecd79cdc94cfb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:03:15.242000+00:00  <8>[   26.267379] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/5ffec2735397228481c94cec

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
ffec2735397228481c94d21
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/5ffec2735397228481c94d2c
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-13 09:50:37.795000+00:00  /lava-3044113/1/../bin/lava-test-case
    2021-01-13 09:50:37.807000+00:00  <8>[   24.431892] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5ffec2735397228481c94d2e
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-13 09:50:38.847000+00:00  /lava-3044113/1/../bin/lava-test-case=
   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/5ffed5978904c175eec94ce8

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
ffed5978904c175eec94d1d
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:12:16.413000+00:00  /lava-3044479/1/../bin/lava-test-case
    2021-01-13 11:12:16.424000+00:00  <8>[   23.412564] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/5ffed5978904c175eec94d28
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5ffed5978904c175eec94d2a
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-13 11:12:18.717000+00:00  <8>[   25.706365] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecd367b19a909fdc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecd367b19a909fdc94=
cc9
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffed1169edff81576c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffed1169edff81576c94=
cc9
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecf7eb11fa3e9e4c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecf7eb11fa3e9e4c94=
cc6
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec42a1ddeb4edc8c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec42a1ddeb4edc8c94=
cba
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffed2f150a0010e54c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffed2f150a0010e54c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec7849074cc7999c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec7849074cc7999c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffeca2c9d551d7d4ec94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffeca2c9d551d7d4ec94=
cc8
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | clang-11 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec8d868fd2eab26c94d0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig/clang-11/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec8d868fd2eab26c94=
d0e
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec338c9cbf862dfc94cd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec338c9cbf862dfc94=
cd5
        failing since 2 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffecb80f20e9f32e4c94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffecb80f20e9f32e4c94=
cd8
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffeccd54d366fea5bc94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffeccd54d366fea5bc94=
ccb
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffec4331ddeb4edc8c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffec4331ddeb4edc8c94=
cc6
        failing since 62 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
tegra124-nyan-big            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ffed518bbf90a841bc94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-tegra124-nya=
n-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-tegra124-nya=
n-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ffed518bbf90a841bc94=
cc1
        new failure (last pass: next-20210112) =

 =20
