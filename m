Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E883574DC
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 21:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355590AbhDGTUW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 15:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhDGTUV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 15:20:21 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A27DC06175F
        for <linux-next@vger.kernel.org>; Wed,  7 Apr 2021 12:20:11 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id b17so10149936pgh.7
        for <linux-next@vger.kernel.org>; Wed, 07 Apr 2021 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WwVMhOaRJv88a3JoxW/vo3U3aG63ZackNhl6s/tlp8E=;
        b=fHlAL+1oZJZBGUdbaQpTZCWdHtDVGglYio7w0+/BWRQHdw9bu3xhyh1AL7WuG33Wxo
         TaZ7aqKZHwMvjskvsS8cBYBR8hRan/M6KeEUwdyB89oy3nV47++TNWmcuk+ktRLF6s2a
         eIZrRLlkMNNAj4Afqlgq9cttVsDpp0WjZDIeyYlEgNWP5ySVzbdBOchpKjSSEW7J+vIy
         9Be20DZ4EhB0AjYoKjTONBSesmAB7yHNMpI0oWJXx1n5NJvHZK5NgrxdCGeoai31/LSm
         nz34o3sByUKGKY03lIRRd//MSFcQukTtU7T0NY8C7Oz/7tu2wdsweRkcx1BBKeFR+kUe
         CSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WwVMhOaRJv88a3JoxW/vo3U3aG63ZackNhl6s/tlp8E=;
        b=M6eXdNkYyJlvr06RIwqveSJYmx8O92nWYPJ1bW2PE1aHO/CeTRrWJzq1BnhBQpnTou
         JatIt8ts58CsI/dWGA3MdpFyX60cEnPkkQg1bLqf6SPgfKYgjsQ7bB5ea4QqSJbaMr0u
         2e6uNOMB7RIgEPW7NVrQp5nXEUGmlBBSzyjEdP2NTKteqau51T10wwLz3/sn0+Hh6UoJ
         0w0pgInVbS3puapZMHP3SVJGw4TfVb+W/RVM0TsQ79p4K8t7LWgA925uicUZIcaloeJB
         qvVuy69EoaXdej72iCL/aiP5bXUbFlzVhJYjrKK5SitSxOnwo1OP2e/Ygf0tsijfkDZd
         8Y3Q==
X-Gm-Message-State: AOAM532AkPjuOP1FO5t25bncCN/68XzZ/jdXmEKXAE8tWThXWvrbNmID
        Sxhw/EP5dQa3HQWyWMRpmHpqRFpjG0zSsbwV
X-Google-Smtp-Source: ABdhPJz/F7lVrVMiNyc+Ub0z1LXatPYzeUXvVB6Q7cyC9RVxew16XaU3reivHGsMC2mQ6aKiPVs5Ag==
X-Received: by 2002:a63:1203:: with SMTP id h3mr4718536pgl.223.1617823208998;
        Wed, 07 Apr 2021 12:20:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h68sm22686277pfe.111.2021.04.07.12.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 12:20:08 -0700 (PDT)
Message-ID: <606e05e8.1c69fb81.61595.91f0@mx.google.com>
Date:   Wed, 07 Apr 2021 12:20:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210407
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 560 runs, 51 regressions (next-20210407)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 560 runs, 51 regressions (next-20210407)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig    =
                | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-11 | defconfig    =
                | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 2          =

bcm2837-rpi-3-b-32       | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 1          =

beaglebone-black         | arm   | lab-cip       | clang-10 | multi_v7_defc=
onfig           | 1          =

imx8mp-evk               | arm64 | lab-nxp       | clang-10 | defconfig    =
                | 1          =

imx8mp-evk               | arm64 | lab-nxp       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana          | arm64 | lab-collabora | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 2          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-10 | defconfig    =
                | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-11 | defconfig    =
                | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | clang-10 | defconfig    =
                | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | clang-11 | defconfig    =
                | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | clang-10 | defconfig    =
                | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | clang-11 | defconfig    =
                | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | clang-10 | defconfig    =
                | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | clang-11 | defconfig    =
                | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210407/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210407
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5103a5be098c0dae5d4b057520d7e9f4c5570979 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/606dc72e51dad03b6ddac6e4

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606dc72e51dad03=
b6ddac6ea
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        11 lines

    2021-04-07 14:52:07.921000+00:00  kern  :alert : Mem [   21.470552] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-07 14:52:07.922000+00:00  abort info:
    2021-04-07 14:52:07.923000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606dc72e51dad03=
b6ddac6eb
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        2 lines

    2021-04-07 14:52:07.927000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-07 14:52:07.927000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-07 14:52:07.928000+00:00  kern  :alert : Data abort info:
    2021-04-07 14:52:07.929000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-07 14:52:07.963000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-07 14:52:07.964000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit[   21.509096] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-07 14:52:07.965000+00:00   VAs, pgdp=3D000000003a92e[   21.5196=
14] <LAVA_SIGNAL_ENDRUN 0_dmesg 73550_1.5.2.4.1>
    2021-04-07 14:52:07.966000+00:00  000   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606dcb02ecb7a0fafedac6eb

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606dcb03ecb7a0f=
afedac6f1
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        11 lines

    2021-04-07 15:08:26.883000+00:00  kern  :alert : Mem abort info:
    2021-04-07 15:08:26.884000+00:00  kern  :aler[   21.590094] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-07 15:08:26.885000+00:00  t :   ESR =3D 0x96000007
    2021-04-07 15:08:26.885000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-07 15:08:26.886000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-07 15:08:26.886000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-07 15:08:26.887000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606dcb03ecb7a0f=
afedac6f2
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        2 lines

    2021-04-07 15:08:26.890000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-07 15:08:26.934000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D00000000041b1800
    2021-04-07 15:08:26.935000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000c040003
    2021-04-07 15:08:26.936000+00:00  kern  :emerg : Internal error: Oops: =
96000[   21.637737] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | clang-11 | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/606dcf134351e731f1dac6b5

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606dcf134351e73=
1f1dac6bb
        failing since 1 day (last pass: next-20210322, first fail: next-202=
10406)
        11 lines

    2021-04-07 15:25:48.188000+00:00  kern  :alert : Mem [   21.470644] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D11>
    2021-04-07 15:25:48.189000+00:00  abort info:
    2021-04-07 15:25:48.190000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606dcf134351e73=
1f1dac6bc
        failing since 1 day (last pass: next-20210322, first fail: next-202=
10406)
        2 lines

    2021-04-07 15:25:48.194000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-07 15:25:48.194000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-07 15:25:48.195000+00:00  kern  :alert : Data abort info:
    2021-04-07 15:25:48.195000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-07 15:25:48.230000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-07 15:25:48.232000+00:00  kern  :alert : user pgtable: 4k pages=
[   21.508555] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D2>
    2021-04-07 15:25:48.232000+00:00  , 48-bit VAs, pgdp=3D00000[   21.5191=
32] <LAVA_SIGNAL_ENDRUN 0_dmesg 73793_1.5.2.4.1>
    2021-04-07 15:25:48.233000+00:00  00006fee000   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606dc8d286474b4f7fdac6d1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606dc8d286474b4=
f7fdac6d7
        new failure (last pass: next-20210323)
        11 lines

    2021-04-07 14:59:09.233000+00:00  kern  :alert : Mem abort info:
    2021-04-07 14:59:09.234000+00:00  kern  :aler[   21.588051] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1=
1>
    2021-04-07 14:59:09.234000+00:00  t :   ESR =3D 0x96000007
    2021-04-07 14:59:09.235000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-07 14:59:09.235000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-07 14:59:09.235000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-07 14:59:09.236000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606dc8d286474b4=
f7fdac6d8
        new failure (last pass: next-20210323)
        2 lines

    2021-04-07 14:59:09.239000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-07 14:59:09.275000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, pgdp=3D0000000002c82400
    2021-04-07 14:59:09.276000+00:00  kern  :alert : [0000000000000050] pgd=
=3D080000000d630003, p4d=3D080000000d630003, pud=3D080000000d630003, pmd=3D=
08[   21.635774] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D2>
    2021-04-07 14:59:09.277000+00:00  0000000d640003   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606dcc1beb76937da7dac6be

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606dcc1beb76937=
da7dac6c4
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        11 lines

    2021-04-07 15:13:10.298000+00:00  kern  :alert : Mem abort in[   21.514=
852] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-07 15:13:10.299000+00:00  fo:
    2021-04-07 15:13:10.299000+00:00  kern  :alert :   ESR =3D 0x96000006
    2021-04-07 15:13:10.300000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-04-07 15:13:10.300000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-07 15:13:10.301000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-07 15:13:10.301000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606dcc1beb76937=
da7dac6c5
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        2 lines

    2021-04-07 15:13:10.339000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-07 15:13:10.340000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a8cc[   21.554219] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-07 15:13:10.340000+00:00  000   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/606dcd5bee3ffd337bdac6bc

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/606dcd5bee3ffd3=
37bdac6c2
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        11 lines

    2021-04-07 15:18:29.790000+00:00  kern  :alert : Mem abort in[   21.602=
519] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D11>
    2021-04-07 15:18:29.791000+00:00  fo:
    2021-04-07 15:18:29.792000+00:00  kern  :alert :   ESR =3D 0x96000006   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/606dcd5bee3ffd3=
37bdac6c3
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)
        2 lines

    2021-04-07 15:18:29.796000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-04-07 15:18:29.796000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-04-07 15:18:29.797000+00:00  kern  :alert : Data abort info:
    2021-04-07 15:18:29.798000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2021-04-07 15:18:29.833000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-04-07 15:18:29.834000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000003a9c3[   21.642382] <LAVA_SIGNAL_TESTCASE TEST=
_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-04-07 15:18:29.835000+00:00  000
    2021-04-07 15:18:29.835000+00:00  kern  :alert : [000[   21.653013] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 73735_1.5.2.4.1>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcb2abf799af7c0dac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcb2abf799af7c0dac=
6c2
        failing since 13 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beaglebone-black         | arm   | lab-cip       | clang-10 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/606dd177fe81117722dac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dd177fe81117722dac=
6be
        new failure (last pass: next-20210330) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc9127decb699f0dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc9127decb699f0dac=
6bb
        new failure (last pass: next-20210406) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcc334cb89d6b14dac741

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcc334cb89d6b14dac=
742
        failing since 19 days (last pass: next-20210317, first fail: next-2=
0210319) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcaa36d7497835ddac6b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcaa36d7497835ddac=
6b3
        failing since 15 days (last pass: next-20210322, first fail: next-2=
0210323) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
mt8173-elm-hana          | arm64 | lab-collabora | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606dcafcbc1a9a5f26dac6c1

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/606dcafdbc1a9a5f26dac6d5
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)

    2021-04-07 15:08:39.622000+00:00  <8>[   57.210199] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/606=
dcafdbc1a9a5f26dac6db
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)

    2021-04-07 15:08:40.725000+00:00  /lava-3481117/1/../bin/lava-test-case=
   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/606dc85012d8b39c2bdac6b5

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/606dc85012d8b39c2bdac6c9
        new failure (last pass: next-20210323)

    2021-04-07 14:57:15.529000+00:00  <8>[   57.781454] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/606=
dc85012d8b39c2bdac6cf
        new failure (last pass: next-20210323)

    2021-04-07 14:57:16.641000+00:00  <8>[   58.893098] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/606dcc8902d86d0eb0dac6d8

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/606dcc8902d86d0eb0dac6ec
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)

    2021-04-07 15:15:16.175000+00:00  <8>[   57.626545] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/606=
dcc8902d86d0eb0dac6f2
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406)

    2021-04-07 15:15:17.280000+00:00  /lava-3481299/1/../bin/lava-test-case=
   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc564d93ddc8722dac6cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc564d93ddc8722dac=
6cd
        failing since 140 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc58ba45156aad2dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc58ba45156aad2dac=
6c1
        failing since 140 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc57b90d7090a02dac6d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc57b90d7090a02dac=
6d9
        failing since 140 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc50a27cb87e4d2dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc50a27cb87e4d2dac=
6b8
        failing since 140 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc8ec6f0c650a62dac6c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc8ec6f0c650a62dac=
6c6
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcc222e781b23bddac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcc222e781b23bddac=
6c2
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | clang-11 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dd29cf0f3085cd3dac6ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dd29cf0f3085cd3dac=
6cb
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dca68c54c9f256bdac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dca68c54c9f256bdac=
6bb
        failing since 86 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcdb191d855767cdac6d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcdb191d855767cdac=
6d2
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcf418d6077e746dac6c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcf418d6077e746dac=
6c9
        failing since 84 days (last pass: next-20210108, first fail: next-2=
0210112) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc83a218e36ed6edac7a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc83a218e36ed6edac=
7a7
        failing since 43 days (last pass: next-20210218, first fail: next-2=
0210222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcbf8eb504c03d3dac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcbf8eb504c03d3dac=
6c2
        failing since 43 days (last pass: next-20210219, first fail: next-2=
0210222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | clang-11 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dd093552761bed3dac6ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dd093552761bed3dac=
6ef
        failing since 43 days (last pass: next-20210219, first fail: next-2=
0210222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc9c8befd857cfcdac6d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc9c8befd857cfcdac=
6d9
        failing since 43 days (last pass: next-20210219, first fail: next-2=
0210223) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcd88a3671be945dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcd88a3671be945dac=
6c0
        failing since 44 days (last pass: next-20210218, first fail: next-2=
0210219) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcf044f49fabce6dac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcf044f49fabce6dac=
6b4
        failing since 43 days (last pass: next-20210217, first fail: next-2=
0210222) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc839218e36ed6edac7a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc839218e36ed6edac=
7a3
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcc0ceb504c03d3dac6f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcc0ceb504c03d3dac=
6fa
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | clang-11 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dd0a7552761bed3dac71e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dd0a7552761bed3dac=
71f
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc9c922ca386460dac6d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc9c922ca386460dac=
6d5
        failing since 86 days (last pass: next-20210107, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcdb21ce3bf4814dac6bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcdb21ce3bf4814dac=
6c0
        failing since 86 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774c0-ek874           | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcf408d6077e746dac6c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcf408d6077e746dac=
6c6
        failing since 84 days (last pass: next-20210108, first fail: next-2=
0210112) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | clang-10 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc7fb3eca7fd188dac6d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc7fb3eca7fd188dac=
6da
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | clang-10 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcbbbf1532ee06adac6d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcbbbf1532ee06adac=
6d7
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | clang-11 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dd1c03e5fa552ffdac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dd1c03e5fa552ffdac=
6be
        failing since 1 day (last pass: next-20210322, first fail: next-202=
10406) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dc67fca5c9e4be9dac6e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dc67fca5c9e4be9dac=
6e5
        failing since 16 days (last pass: next-20210319, first fail: next-2=
0210322) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606dcd0fe3b59a1132dac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dcd0fe3b59a1132dac=
6c1
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/606dd06caacc787a25dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210407/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606dd06caacc787a25dac=
6b2
        failing since 1 day (last pass: next-20210323, first fail: next-202=
10406) =

 =20
