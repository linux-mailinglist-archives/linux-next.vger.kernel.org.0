Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527BA49B42E
	for <lists+linux-next@lfdr.de>; Tue, 25 Jan 2022 13:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1452644AbiAYMlq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 07:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383458AbiAYMjf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jan 2022 07:39:35 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAAAC061747
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 04:39:35 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id x11so13362756plg.6
        for <linux-next@vger.kernel.org>; Tue, 25 Jan 2022 04:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qqQFXyiKxJ7ESkXEJ7RLdIdfd4c0OltJsdkULN6bKhU=;
        b=tkIATpRkHjXgME6rJeuNgmKQ6rwLK7k7Gp760UVgmSWVu3J7TOB3l5Dtyohd7XO73Q
         Rj9v8+5TM/oSq82VYtCYZ32dNcjNrKmxINelhI1sA1hd3wP00hbs+Y/TNV1l5vnBbK68
         bnkKQBHysSvkhNtc3bTV0INc26RdEEZ11UyNmslofIALQSd+dphJtfbfX4Kgg6mHH6ng
         d3m8WTWPRcZp+bdk5ra/0ZnUq6B/Z1RUNHJ2BRxv14rAeYGNnRdsM1tYqkw6c5lUsgvs
         O+pCe73jImYqcaiND/fQ2HoPAmUMMZbDJfa8itw6Pr8i26WG690txAUeo7MnBG9CiNsc
         X8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qqQFXyiKxJ7ESkXEJ7RLdIdfd4c0OltJsdkULN6bKhU=;
        b=oVb0LlBbJgOM0fx2g9+cyxzKoRRazSWqwQkPn3MD5DgwqKgmPI6fefdUPbKBaX9waC
         u7WDr1ruMm3dyLMIR/Bt4CqYtgw6aJIZF998TieJ3go55dlwJWXw9Gfcgw/YvedKaJ+o
         A0stE8BBVM6JXd5uPKW7z8A1J25jlI7MyOAZY3/MbPR3nC4BxSprzHuuLbZVP/OsiAIC
         5vFFJSGVHSyCNyh+9A9JpztZPExEDrqgcb4WRtAtqfTnwUeEB57V32+EXJPOGqkFYnCo
         2E21asexU/fSjNEF197yUlD6gPwAyC8/Bhomq7uOYHCUo4cVCcThg97lN2KOFhbwgjnF
         9Bbw==
X-Gm-Message-State: AOAM530wtA1VhloobEl1xDeM8nH24nwHu4Fmb270LYLwjKEpAndL0WfN
        Ub0CALTk2fDp/0y0vUNPmkRnphzXrD2NUpUB
X-Google-Smtp-Source: ABdhPJyQ0yxqdlDq6icHwPGl6pRaeP5z5R7xRWoQBoJ5Jgrrd1iIWN1uicVL6g4iTLJHw41ycpoBzg==
X-Received: by 2002:a17:90a:c788:: with SMTP id gn8mr3374532pjb.204.1643114373430;
        Tue, 25 Jan 2022 04:39:33 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l2sm20716252pfc.183.2022.01.25.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 04:39:33 -0800 (PST)
Message-ID: <61efef85.1c69fb81.e0296.6c8c@mx.google.com>
Date:   Tue, 25 Jan 2022 04:39:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220125
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 725 runs, 74 regressions (next-20220125)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 725 runs, 74 regressions (next-20220125)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx6q-sabrelite              | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =

imx6q-sabresd                | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx7d-sdb                    | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

meson-g12a-sei510            | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

panda                        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

panda                        | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-cip       | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-collabora | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip       | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+arm64-chromebook   | 2          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
                    | 2          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+ima                | 2          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 2          =

r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

stm32mp157c-dk2              | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | clang-14 | multi_v7_=
defconfig           | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
                    | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+ima                | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+debug              | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 1          =

zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220125/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220125
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d25ee88530253138d0b20d43511ca5acbda4e9f7 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efc07bdae5bab561abbd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efc07bdae5bab561abb=
d20
        failing since 1 day (last pass: next-20220121, first fail: next-202=
20124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb5f2d749a47657abbd41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb5f2d749a47657abb=
d42
        failing since 9 days (last pass: next-20220115, first fail: next-20=
220116) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb5b11aaea34beaabbd34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb5b11aaea34beaabb=
d35
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb5ded749a47657abbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb5ded749a47657abb=
d13
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efcf231e10739d45abbd39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efcf231e10739d45abb=
d3a
        failing since 12 days (last pass: next-20211224, first fail: next-2=
0220112) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb512c67a7b9acdabbd40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb512c67a7b9acdabb=
d41
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbf5fbfad02f340abbd56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbf5fbfad02f340abb=
d57
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb4f576540c0540abbd32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb4f576540c0540abb=
d33
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb63c6427c37240abbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb63c6427c37240abb=
d17
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb63fe42efdbb9aabbd22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb63fe42efdbb9aabb=
d23
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb570432fcb0744abbd23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb570432fcb0744abb=
d24
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6421a4dff93aeabbd45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6421a4dff93aeabb=
d46
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbad80a03704d9fabbd2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbad80a03704d9fabb=
d30
        failing since 33 days (last pass: next-20211221, first fail: next-2=
0211222) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61efb89f1ea4a7d040abbd6f

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61efb89f1ea4a7d040abbdb0
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-25T08:44:56.181811  /lava-83363/1/../bin/lava-test-case
    2022-01-25T08:44:56.182085  <8>[   17.886924] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
fb89f1ea4a7d040abbdb1
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-25T08:44:57.225906  /lava-83363/1/../bin/lava-test-case
    2022-01-25T08:44:57.226195  <8>[   18.906184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T08:44:57.226345  /lava-83363/1/../bin/lava-test-case
    2022-01-25T08:44:57.226484  <8>[   18.922171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-25T08:44:57.226622  /lava-83363/1/../bin/lava-test-case
    2022-01-25T08:44:57.226757  <8>[   18.938157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-25T08:44:57.226892  /lava-83363/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61efb903bf06f7a597abbd1b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61efb903bf06f7a597abbd5c
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-25T08:46:34.595358  /lava-83369/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
fb903bf06f7a597abbd5d
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-25T08:46:34.598517  <8>[   17.846032] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T08:46:35.645144  /lava-83369/1/../bin/lava-test-case
    2022-01-25T08:46:35.645535  <8>[   18.864771] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T08:46:35.645770  /lava-83369/1/../bin/lava-test-case
    2022-01-25T08:46:35.645991  <8>[   18.880275] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61efbe54f21df71c31abbd2b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61efbe54f21df71c31abbd6c
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-25T09:09:19.552584  /lava-83387/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
fbe54f21df71c31abbd6d
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-25T09:09:19.555665  <8>[   18.691089] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T09:09:20.602311  /lava-83387/1/../bin/lava-test-case
    2022-01-25T09:09:20.602713  <8>[   19.710295] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61efbf30d52d54ff25abbd3a

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61efbf30d52d54ff25abbd7b
        failing since 35 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-25T09:12:58.489629  /lava-83394/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
fbf30d52d54ff25abbd7c
        failing since 35 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-25T09:12:58.495432  <8>[   18.894974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-25T09:12:59.543097  /lava-83394/1/../bin/lava-test-case
    2022-01-25T09:12:59.543496  <8>[   19.914455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-25T09:12:59.543726  /lava-83394/1/../bin/lava-test-case
    2022-01-25T09:12:59.543937  <8>[   19.931320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-25T09:12:59.544150  /lava-83394/1/../bin/lava-test-case
    2022-01-25T09:12:59.544354  <8>[   19.948534] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-25T09:12:59.544557  /lava-83394/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb977a187595d82abbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb977a187595d82abb=
d17
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efba5577e6e9d2a5abbd7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efba5577e6e9d2a5abb=
d7f
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efba17090cafa24cabbd27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efba17090cafa24cabb=
d28
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbd600931fb15d7abbd19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbd600931fb15d7abb=
d1a
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb9178abbaa9d5eabbd29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb9178abbaa9d5eabb=
d2a
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb93b31082c50aeabbd68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb93b31082c50aeabb=
d69
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb9efeda7c3f1eeabbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb9efeda7c3f1eeabb=
d13
        new failure (last pass: next-20220124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb97f25ee4cd368abbd14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb97f25ee4cd368abb=
d15
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbb0277fbca25a2abbd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbb0277fbca25a2abb=
d20
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb97e991a132059abbd22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb97e991a132059abb=
d23
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbacbfffaff42ddabbd54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbacbfffaff42ddabb=
d55
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6cb818d29a09babbd1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6cb818d29a09babb=
d1c
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb54f8fe03f6f5cabbd32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb54f8fe03f6f5cabb=
d33
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb453e249d1e364abbd78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb453e249d1e364abb=
d79
        new failure (last pass: next-20220124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb465af70f7aa76abbd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb465af70f7aa76abb=
d14
        new failure (last pass: next-20220124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-cip       | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb47caa9cdc05edabbd1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb47caa9cdc05edabb=
d1c
        new failure (last pass: next-20220124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-collabora | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb469aa9cdc05edabbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb469aa9cdc05edabb=
d12
        new failure (last pass: next-20220124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6973716866031abbd33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6973716866031abb=
d34
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb645683bc0e830abbd33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb645683bc0e830abb=
d34
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb581432fcb0744abbd3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb581432fcb0744abb=
d3e
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb67df1286626bbabbd40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb67df1286626bbabb=
d41
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6c08f38f91eccabbd20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6c08f38f91eccabb=
d21
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6476427c37240abbd2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6476427c37240abb=
d2c
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb601a2c70a6544abbd23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb601a2c70a6544abb=
d24
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6c88f38f91eccabbd2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6c88f38f91eccabb=
d2e
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbcdbeaaf17953aabbd29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbcdbeaaf17953aabb=
d2a
        failing since 42 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbf22bfad02f340abbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbf22bfad02f340abb=
d13
        failing since 42 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbfa98bccfcb646abbd2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbfa98bccfcb646abb=
d2d
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbc2433ebffaf69abbd42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbc2433ebffaf69abb=
d43
        failing since 41 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-cip       | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbee3e23bbc2930abbd25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbee3e23bbc2930abb=
d26
        failing since 41 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbee5dae18e3cf4abbd7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbee5dae18e3cf4abb=
d7b
        failing since 41 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbfd9580f110adcabbd19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbfd9580f110adcabb=
d1a
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61efb6ad8e76407df0abbd11

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61efb6ad8e76407=
df0abbd17
        failing since 20 days (last pass: next-20211223, first fail: next-2=
0220104)
        2 lines

    2022-01-25T08:36:35.973014  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T08:36:35.973194  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T08:36:35.973291  kern  :alert : user pgtable: 4k pages<8>[  =
 15.625703] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-25T08:36:35.973381  , 48-bit VAs, pgdp=3D000000007f973000
    2022-01-25T08:36:35.973465  ker<8>[   15.637886] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 611220_1.5.2.4.1>
    2022-01-25T08:36:35.973547  n  :alert : [0000000000000000] pgd=3D080000=
007f974003, p4d=3D080000007f974003, pud=3D080000007f975003, pmd=3D000000000=
0000000
    2022-01-25T08:36:35.973630  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61efb6ad8e76407=
df0abbd18
        failing since 20 days (last pass: next-20211223, first fail: next-2=
0220104)
        12 lines

    2022-01-25T08:36:35.929739  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T08:36:35.929900  kern  :alert : Mem abort info:
    2022-01-25T08:36:35.929995  ker<8>[   15.584825] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T08:36:35.930082  n  :alert :   ESR =3D 0x96000006
    2022-01-25T08:36:35.930168  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T08:36:35.930250  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T08:36:35.930331  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-25T08:36:35.930410  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-25T08:36:35.930488  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61efb8ddfa77444effabbd11

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61efb8ddfa77444=
effabbd17
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-25T08:46:08.156239  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T08:46:08.156453  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T08:46:08.156548  kern  :alert : user pgtable: <8>[   15.7816=
09] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D2>
    2022-01-25T08:46:08.156637  4k pages, 48-bit VAs, pgdp=3D000000007f934<=
8>[   15.793630] <LAVA_SIGNAL_ENDRUN 0_dmesg 611278_1.5.2.4.1>
    2022-01-25T08:46:08.156725  000
    2022-01-25T08:46:08.156808  kern  :alert : [0000000000000000] pgd=3D080=
000004f68d003, p4d=3D080000004f68d003, pud=3D080000007f89b003, pmd=3D000000=
0000000000
    2022-01-25T08:46:08.156888  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61efb8ddfa77444=
effabbd18
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-25T08:46:08.064151  <8>[   15.701782] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-25T08:46:08.113208  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T08:46:08.113410  kern  :alert : Mem abort info:
    2022-01-25T08:46:08.113506  ker<8>[   15.741306] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T08:46:08.113594  n  :alert :   ESR =3D 0x96000006
    2022-01-25T08:46:08.113679  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T08:46:08.113761  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T08:46:08.113839  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-25T08:46:08.113918  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-25T08:46:08.113997  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61efbc2533ebffaf69abbd4f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61efbc2533ebffa=
f69abbd55
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-25T09:00:01.282548  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T09:00:01.282757  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T09:00:01.282853  kern  :alert : user pgtable: 4k pages,<8>[ =
  15.839998] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-25T09:00:01.282942   48-bit VAs, pgdp=3D000000007f9a4000
    2022-01-25T09:00:01.283026  kern<8>[   15.851637] <LAVA_SIGNAL_ENDRUN 0=
_dmesg 611325_1.5.2.4.1>
    2022-01-25T09:00:01.283108    :alert : [0000000000000000] pgd=3D0800000=
07f862003, p4d=3D080000007f862003, pud=3D080000007f85f003, pmd=3D0000000000=
000000
    2022-01-25T09:00:01.283191  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61efbc2533ebffa=
f69abbd56
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-25T09:00:01.241263  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T09:00:01.241477  kern  :alert : Mem abort info:
    2022-01-25T09:00:01.241574  ker<8>[   15.798785] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T09:00:01.241671  n  :alert :   ESR =3D 0x96000006
    2022-01-25T09:00:01.241755  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T09:00:01.241838  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T09:00:01.241917  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-25T09:00:01.241994  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-25T09:00:01.242071  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61efc4faf420000892abbd33

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61efc4faf420000=
892abbd39
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-25T09:37:39.223362  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-25T09:37:39.223548  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-25T09:37:39.223641  kern  :alert : user pgtable: 4k pages<8>[  =
 15.756526] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-25T09:37:39.223731  , 48-bit VAs, pgdp=3D000000007f94f000
    2022-01-25T09:37:39.223815  ker<8>[   15.768562] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 611385_1.5.2.4.1>
    2022-01-25T09:37:39.223899  n  :alert : [0000000000000000] pgd=3D080000=
007f950003, p4d=3D080000007f950003, pud=3D080000007f955003, pmd=3D000000000=
0000000
    2022-01-25T09:37:39.223982  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61efc4faf420000=
892abbd3a
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-25T09:37:39.179995  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-25T09:37:39.180178  kern  :alert : Mem abort info:
    2022-01-25T09:37:39.180293  ker<8>[   15.715559] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-25T09:37:39.180381  n  :alert :   ESR =3D 0x96000006
    2022-01-25T09:37:39.180469  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-25T09:37:39.180554  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-25T09:37:39.180635  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-25T09:37:39.180737  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-25T09:37:39.180818  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efc587fb276896cfabbd6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efc587fb276896cfabb=
d6b
        failing since 20 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb58aac3a0efc78abbd3a

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61efb58aac3a0efc78abbd5c
        failing since 1 day (last pass: next-20220121, first fail: next-202=
20124)

    2022-01-25T08:31:49.663818  <4>[   22.920864] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-01-25T08:31:50.026616  /lava-5515898/1/../bin/lava-test-case
    2022-01-25T08:31:50.037950  <8>[   23.296307] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
stm32mp157c-dk2              | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb4ee65f926d24aabbd21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb4ee65f926d24aabb=
d22
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb529153826ecafabbd2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb529153826ecafabb=
d2e
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb5d97a68202dababbd4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb5d97a68202dababb=
d50
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb6bb8e76407df0abbd28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h2-plus-libretech-a=
ll-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb6bb8e76407df0abb=
d29
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb509c67a7b9acdabbd25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb509c67a7b9acdabb=
d26
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb7f6ce07708bd2abbd82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220119071850+41d05=
e29c04f-1~exp1~20220119071941.127)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb7f6ce07708bd2abb=
d83
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb8099db62ed5caabbd4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb8099db62ed5caabb=
d4b
        failing since 63 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61efb95d3c1c77fb1fabbd17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efb95d3c1c77fb1fabb=
d18
        failing since 63 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbad90a03704d9fabbd33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbad90a03704d9fabb=
d34
        failing since 63 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbbf1cfe3babf2babbd3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbbf1cfe3babf2babb=
d3d
        failing since 63 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
zynqmp-zcu102                | arm64 | lab-cip       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61efbc2d2e41c152aaabbd42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61efbc2d2e41c152aaabb=
d43
        failing since 63 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
