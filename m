Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171A12BA09E
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 03:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgKTCq2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Nov 2020 21:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgKTCq1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2020 21:46:27 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFBDC0613CF
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2020 18:46:27 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id a18so6458633pfl.3
        for <linux-next@vger.kernel.org>; Thu, 19 Nov 2020 18:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Zna9cgL6iFVb9n6c4AxS+OXafcngDKFQte+Q0nmRVKA=;
        b=psTy6srsNA2cuWyWT345CnJiwbUGZV3mGoBBmHFqlF68QwBkhngYMxd5b5ITay46WH
         s9OzlbM4d7cShk/U11fRMBPaQ4kD6WSgJ1d/8fKBJKdJJ55OmTxIymr1yLwLGi0Zuxcr
         NhCY1Ari7XPi+bz7GPZOx7cLNGcSqmu92zHMXIE5LwDZCh5K4NCwRGn264m6PyUmWYRp
         OIpgfFu/IgMgXeez+WEZAJllWhD1FOsZDzpPZn0kEo+xEtLPANiRZOV/4LicPtAH9pir
         LirWomidZSkphoBA7KN740Je257moQUyjOfgtZs9QE5t8CFHSbY+pCVdN3M+AGbSnoHU
         wEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Zna9cgL6iFVb9n6c4AxS+OXafcngDKFQte+Q0nmRVKA=;
        b=uj8lcR6+gZK7DiAlJexUjRWp1K6uMkEu47uJFLj0LgFFPOep2Vu/kv0ArLcyRM0Icu
         1817Owuf+RM6RUWimCb8KhheRxGaGPxaPBjyeqkBFnDOP+FwzCbRLyQURzrIgX4oGrvf
         6CWlPNLoWbfrOu9nw2e1jqpx+1j247d/ignh0KWXoTIcPLzBk25Bl4Mxqp2k9vh2j28y
         +G9IwB5LFbFCc4AXH79zZ1Fuv5rX1vyi4mebu6+7+FhNkbCnoKtt2aA76SZpLlVyALOp
         LxcpKK5utPy5KG702+hvZQww9So2vIfgRcInByXJhL5CbUOLHd8p+t5xU92MJ+mjlcFw
         qT6Q==
X-Gm-Message-State: AOAM532gldNUfC3yABb2IyJ/ZByXh30BsDqysWj912WlLae6EBqVzIkE
        QwI8EDuptpdieIODs8UMPsZU5fH0Hzg0jw==
X-Google-Smtp-Source: ABdhPJymphjFH3NTVO43MjWJ6wRnI818wOixabuoGLGwMYKmhIg8jK1nhPWNkYLc59imX8pNjTVgwA==
X-Received: by 2002:a63:d543:: with SMTP id v3mr15534478pgi.188.1605840386503;
        Thu, 19 Nov 2020 18:46:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gg19sm1335027pjb.21.2020.11.19.18.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 18:46:25 -0800 (PST)
Message-ID: <5fb72e01.1c69fb81.a4008.32fa@mx.google.com>
Date:   Thu, 19 Nov 2020 18:46:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc4-520-g40cb4fecf2509
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 292 runs,
 11 regressions (v5.10-rc4-520-g40cb4fecf2509)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 292 runs, 11 regressions (v5.10-rc4-520-g40cb4=
fecf2509)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 1          =

bcm2837-rpi-3-b           | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd             | arm   | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx8mp-evk                | arm64 | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                | arm64 | lab-nxp         | gcc-8    | defconfig =
                   | 1          =

meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 2          =

qemu_arm-versatilepb      | arm   | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb      | arm   | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb      | arm   | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =

sun8i-h3-bananapi-m2-plus | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc4-520-g40cb4fecf2509/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc4-520-g40cb4fecf2509
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      40cb4fecf2509da231deb989f67bca024e950981 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6fce7513ba95fbad8d916

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6fce7513ba95fbad8d=
917
        failing since 198 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b           | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6f6e079d1c18a26d8d909

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb6f6e079d1c18a=
26d8d90c
        failing since 0 day (last pass: v5.10-rc4-378-g55e1cd5a31550, first=
 fail: v5.10-rc4-415-g1a6722b3cb3e)
        1 lines

    2020-11-19 22:48:26.109000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-19 22:48:26.109000+00:00  (user:khilman) is already connected
    2020-11-19 22:48:41.282000+00:00  =00
    2020-11-19 22:48:41.282000+00:00  =

    2020-11-19 22:48:41.298000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-19 22:48:41.298000+00:00  =

    2020-11-19 22:48:41.299000+00:00  DRAM:  948 MiB
    2020-11-19 22:48:41.330000+00:00  RPI 3 Model B (0xa02082)
    2020-11-19 22:48:41.406000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-19 22:48:41.438000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (385 line(s) more)  =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
imx6q-sabresd             | arm   | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6fc56ee001bbe47d8d922

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6fc56ee001bbe47d8d=
923
        failing since 24 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk                | arm64 | lab-nxp         | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6f85ab83163e8fdd8d901

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6f85ab83163e8fdd8d=
902
        new failure (last pass: v5.10-rc4-415-g1a6722b3cb3e) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk                | arm64 | lab-nxp         | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6faa4ecd113bd25d8d925

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6faa4ecd113bd25d8d=
926
        failing since 6 days (last pass: v5.10-rc3-337-ge83d2e1f2d190, firs=
t fail: v5.10-rc3-420-g5364e201065c) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-q200            | arm64 | lab-baylibre    | gcc-8    | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/5fb6f752877a5602c7d8d909

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fb6f752877a560=
2c7d8d90d
        new failure (last pass: v5.10-rc4-415-g1a6722b3cb3e)
        10 lines

    2020-11-19 22:53:01.124000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-11-19 22:53:01.124000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-19 22:53:01.124000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-19 22:53:01.124000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-19 22:53:01.125000+00:00  kern  :alert : Data abort info:
    2020-11-19 22:53:01.125000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-11-19 22:53:01.125000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-19 22:53:01.125000+00:00  kern  :alert : [00238000090741dc] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fb6f752877a560=
2c7d8d90e
        new failure (last pass: v5.10-rc4-415-g1a6722b3cb3e)
        2 lines

    2020-11-19 22:53:01.166000+00:00  kern  :emerg : Code: aa0103f5 97ffffc=
c 0b0400c3 9ac62816 (b94002a1)    =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb      | arm   | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6f8c44a0d51ed17d8d944

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6f8c44a0d51ed17d8d=
945
        failing since 3 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb      | arm   | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6f893444e4f16c0d8d948

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6f893444e4f16c0d8d=
949
        failing since 3 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb      | arm   | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6f8553c06db6b0ad8d926

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6f8553c06db6b0ad8d=
927
        failing since 3 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                  | arch  | lab             | compiler | defconfig =
                   | regressions
--------------------------+-------+-----------------+----------+-----------=
-------------------+------------
sun8i-h3-bananapi-m2-plus | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb6fcae9ab0e0ccc4d8d8fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-=
h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc4-5=
20-g40cb4fecf2509/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun8i-=
h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb6fcae9ab0e0ccc4d8d=
8fe
        new failure (last pass: v5.10-rc4-415-g1a6722b3cb3e) =

 =20
