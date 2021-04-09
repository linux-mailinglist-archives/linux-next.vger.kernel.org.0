Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA3F35A95A
	for <lists+linux-next@lfdr.de>; Sat, 10 Apr 2021 01:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbhDIXwt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 19:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbhDIXwt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 19:52:49 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0577AC061762
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 16:52:35 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so7191578pjb.0
        for <linux-next@vger.kernel.org>; Fri, 09 Apr 2021 16:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LteUyiuFmtcV1qjSYPs/BHQRJtPKH9aRKcrJWiMq7gg=;
        b=iy7aBTOMyUs7HWy3qxLN7qslZ5VLDmQVwJhOFvuyavtFWGerGGzxr11fzJGrewUwhO
         /mrX9pwhcmERxny6OA3TpmE8k4DxvtSp9HuCm/zbZXqbjCDoHx1aGZ/vF0JzulXgUK9y
         QMUUlVXdeW+9/NV0DkR1FtPcC5npWi/PL0iqQ5O7SwtKosnwy0sg8ISvMcqg+0uwoM3q
         qzE0Ew21i2g97SyRGn6w3cuMekW9UHYPnA7UjPr4d/5RTqWO8fVKwhM4mwjryxJ+M7av
         mUegpLtxUd+WGRcFu24QGvYZnxPeBTJoPkaiQEdw8qIIxfRt3QatlP7M54UuIxqaPNDp
         oz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LteUyiuFmtcV1qjSYPs/BHQRJtPKH9aRKcrJWiMq7gg=;
        b=a7SYAjSAsR3wNOamMYXj60nosmDHBEVaMkmPLuzgdQ0Btpi/TNZopXqTy5nNFyMTpo
         lutnNuKu/5oescVWakoZgR/2wjAMaXNub27J2VhzDqjSoD7SSnxv5Fcc6EnuVY8Zmrz5
         kjAeKpas3mULVtdow+Dh21lhWuFQ6unICC5cBNgzaeqfAaHtYTzS6i7h77Wfn5YS9WLj
         lSje6gy2N68N4XxOngYxniuZND05ku7BSmGRfcnXTdaOWwUdEyiNIFZcNQxhGiBkpYdw
         7k3Zv4IKzT9CpTJJSvJbnPJOZy9HNGbGgz4CbTmhCRIAcHOUn+CxYnYG/17ml69rmBe+
         KItg==
X-Gm-Message-State: AOAM5303QYqTXF/cqFGLqLw/4sGlR/PdN6wAnoi9AuPMf9t6oBRDS3+i
        YDZwgKawCwKwYPPUVsbExedHjjhslV/YgB1w
X-Google-Smtp-Source: ABdhPJzYbjgMjOGOVJxncGlJ2fqNq+tXsKabcn5L3Mn0WJskJy8Gi+JvNI4GxUiEhIubziIrm46zDw==
X-Received: by 2002:a17:902:cec1:b029:e8:bf66:42f6 with SMTP id d1-20020a170902cec1b02900e8bf6642f6mr15053329plg.16.1618012354659;
        Fri, 09 Apr 2021 16:52:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c11sm3458186pgk.83.2021.04.09.16.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 16:52:34 -0700 (PDT)
Message-ID: <6070e8c2.1c69fb81.c97df.990b@mx.google.com>
Date:   Fri, 09 Apr 2021 16:52:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210409
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 764 runs, 39 regressions (next-20210409)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 764 runs, 39 regressions (next-20210409)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =

hifive-unleashed-a00       | riscv | lab-baylibre    | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
                    | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana            | arm64 | lab-collabora   | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana            | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 2          =

mt8173-elm-hana            | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210409/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210409
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e99d8a8495175df8cb8b739f8cf9b0fc9d0cd3b5 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6070bafb5c9524fe6bdac6b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070bafb5c9524fe6bdac=
6b7
        failing since 11 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora   | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6070d36edcaac940fedac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070d36edcaac940fedac=
6bd
        failing since 44 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6070a9a2a568b930b0dac6cf

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070a9a2a568b93=
0b0dac6d5
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 19:22:50.307000+00:00  kern  :alert : Mem [   21.561103] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 19:22:50.308000+00:00  abort info:
    2021-04-09 19:22:50.309000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-09 19:22:50.310000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 19:22:50.310000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070a9a2a568b93=
0b0dac6d6
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 19:22:50.314000+00:00  kern  :alert : Data abort info:
    2021-04-09 19:22:50.315000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 19:22:50.349000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:22:50.350000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.599717] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 19:22:50.351000+00:00  dp=3D0000000006e18000
    2021-04-09 19:22:50.352000+00:00  ker[   21.610345] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 81156_1.5.2.4.1>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6070b06e864e7c0e69dac6b1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070b06e864e7c0=
e69dac6b7
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 19:51:50.857000+00:00  kern  :alert : Mem abort info:
    2021-04-09 19:51:50.858000+00:00  kern  :aler[   21.671153] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-09 19:51:50.859000+00:00  t :   ESR =3D 0x96000007
    2021-04-09 19:51:50.859000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 19:51:50.860000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 19:51:50.861000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D =
0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070b06e864e7c0=
e69dac6b8
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 19:51:50.865000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-09 19:51:50.865000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:51:50.899000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002811200
    2021-04-09 19:51:50.900000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c450003, p4d=3D080000000c450003, pud=3D[   21.717379] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
    2021-04-09 19:51:50.901000+00:00  080000000c450003[   21.727026] <LAVA_=
SIGNAL_ENDRUN 0_dmesg 81358_1.5.2.4.1>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-11 | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6070acaee312701447dac6d6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070acaee312701=
447dac6dc
        failing since 3 days (last pass: next-20210322, first fail: next-20=
210406)
        11 lines

    2021-04-09 19:35:50.377000+00:00  kern  :alert : Mem [   21.453570] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 19:35:50.378000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070acaee312701=
447dac6dd
        failing since 3 days (last pass: next-20210322, first fail: next-20=
210406)
        2 lines

    2021-04-09 19:35:50.382000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 19:35:50.383000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 19:35:50.384000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 19:35:50.384000+00:00  kern  :alert : Data abort info:
    2021-04-09 19:35:50.385000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 19:35:50.429000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:35:50.430000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pg[   21.492036] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 19:35:50.431000+00:00  dp=3D000000003aa0f000
    2021-04-09 19:35:50.431000+00:00  ker[   21.503018] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 81247_1.5.2.4.1>
    2021-04-09 19:35:50.432000+00:00  n  :alert : [0000000000000050] pgd=3D=
080000003aa10003 =

    ... (1 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6070ae9075578055fddac6b1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070ae907557805=
5fddac6b7
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 19:43:50.564000+00:00  kern  :alert : Mem abort info:
    2021-04-09 19:43:50.564000+00:00  kern  :aler[   21.568554] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-09 19:43:50.565000+00:00  t :   ESR =3D 0x96000007
    2021-04-09 19:43:50.566000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070ae907557805=
5fddac6b8
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 19:43:50.570000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 19:43:50.570000+00:00  kern  :alert : Data abort info:
    2021-04-09 19:43:50.571000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-09 19:43:50.572000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:43:50.610000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000000bdd1200
    2021-04-09 19:43:50.611000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000bf90003
    2021-04-09 19:43:50.612000+00:00  kern  :emerg : Internal error: Oops: =
96000[   21.615895] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6070a4f0b2aabf9735dac6b1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070a4f0b2aabf9=
735dac6b7
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 19:02:51.120000+00:00  kern  :alert : Mem [   21.486777] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 19:02:51.121000+00:00  abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070a4f0b2aabf9=
735dac6b8
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 19:02:51.124000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-09 19:02:51.125000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 19:02:51.125000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 19:02:51.126000+00:00  kern  :alert : Data abort info:
    2021-04-09 19:02:51.126000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 19:02:51.173000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:02:51.174000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.526071] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 19:02:51.175000+00:00  0003a871000   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6070a5a422fe7452badac6b5

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070a5a422fe745=
2badac6bb
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210407)
        11 lines

    2021-04-09 19:05:52.990000+00:00  kern  :alert : Mem abort info:
    2021-04-09 19:05:52.991000+00:00  ker[   21.640957] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D11>
    2021-04-09 19:05:52.992000+00:00  n  :alert :   ESR =3D 0x96000007
    2021-04-09 19:05:52.992000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070a5a422fe745=
2badac6bc
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210407)
        2 lines

    2021-04-09 19:05:52.995000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 19:05:52.995000+00:00  kern  :alert : Data abort info:
    2021-04-09 19:05:52.996000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007
    2021-04-09 19:05:52.996000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:05:53.033000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D000000000bf70a00
    2021-04-09 19:05:53.034000+00:00  kern  :alert : [0000000000000050] pgd=
=3D0800000002960003, p4d=3D08000000029600[   21.686699] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6070ac0ed6114bfd32dac6fb

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6070ac0ed6114bf=
d32dac701
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        11 lines

    2021-04-09 19:33:12.499000+00:00  kern  :alert : Mem [   21.549083] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-09 19:33:12.500000+00:00  abort info:
    2021-04-09 19:33:12.501000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6070ac0ed6114bf=
d32dac702
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)
        2 lines

    2021-04-09 19:33:12.505000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-09 19:33:12.505000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-09 19:33:12.506000+00:00  kern  :alert : Data abort info:
    2021-04-09 19:33:12.507000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-09 19:33:12.551000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-09 19:33:12.553000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000[   21.588418] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-09 19:33:12.553000+00:00  0003a9b2000   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a889f024bb7432dac6e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a889f024bb7432dac=
6e2
        failing since 15 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
hifive-unleashed-a00       | riscv | lab-baylibre    | clang-11 | defconfig=
+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a8b6f55e14bbf3dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a8b6f55e14bbf3dac=
6b8
        failing since 95 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070b1cfd7cce6af1bdac6e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070b1cfd7cce6af1bdac=
6e6
        new failure (last pass: next-20210408) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070afe5d761a0abd1dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070afe5d761a0abd1dac=
6bd
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a881f024bb7432dac6d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a881f024bb7432dac=
6d6
        new failure (last pass: next-20210408) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070ad647145a7026adac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070ad647145a7026adac=
6c1
        failing since 0 day (last pass: next-20210407, first fail: next-202=
10408) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre    | clang-10 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6070ab1430f42da074dac719

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070ab1430f42da074dac=
71a
        new failure (last pass: next-20210408) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070ac57d3ac1fe7b5dac6fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070ac57d3ac1fe7b5dac=
6fc
        new failure (last pass: next-20210408) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l     | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a8ead3ae1d57e3dac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a8ead3ae1d57e3dac=
6bc
        new failure (last pass: next-20210408) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora   | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6070b066ff28e73eb1dac705

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6070b066ff28e73eb1dac719
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
0b066ff28e73eb1dac71f
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-09 19:52:02.717000+00:00  <8>[   58.194107] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora   | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6070a4e83b5cef2b60dac6cc

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6070a4e83b5cef2b60dac6e0
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-09 19:02:59.227000+00:00  /lava-3492157/1/../bin/lava-test-case
    2021-04-09 19:02:59.237000+00:00  <8>[   57.070768] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
0a4e83b5cef2b60dac6e6
        failing since 3 days (last pass: next-20210323, first fail: next-20=
210406)

    2021-04-09 19:03:00.349000+00:00  <8>[   58.183321] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8173-elm-hana            | arm64 | lab-collabora   | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6070a59acce7e5644bdac6f6

  Results:     17 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6070a59acce7e5644bdac709
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210407)

    2021-04-09 19:05:55.047000+00:00  <8>[   57.273982] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/607=
0a59acce7e5644bdac70f
        failing since 2 days (last pass: next-20210323, first fail: next-20=
210407)

    2021-04-09 19:05:56.160000+00:00  <8>[   58.385808] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a8e3d3ae1d57e3dac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a8e3d3ae1d57e3dac=
6b3
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a8e0ac2d56f1bedac6d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a8e0ac2d56f1bedac=
6d2
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a8daac2d56f1bedac6c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a8daac2d56f1bedac=
6c5
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a891e48c5b2abadac6b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a891e48c5b2abadac=
6b9
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a8a109754625c5dac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a8a109754625c5dac=
6ca
        failing since 142 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-10 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070b130b89b578bc5dac74c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070b130b89b578bc5dac=
74d
        failing since 57 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | clang-11 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070af7895b05b23b7dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070af7895b05b23b7dac=
6c0
        failing since 57 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe      | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6070a67aae919c0e04dac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210409/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6070a67aae919c0e04dac=
6b4
        failing since 57 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =20
