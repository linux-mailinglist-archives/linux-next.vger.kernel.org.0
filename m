Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463892A934F
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 10:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKFJtD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 04:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgKFJtC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 04:49:02 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CD0C0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 01:49:02 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id 1so430241ple.2
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 01:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lVAMb5FcUl0cTCXFZxdXmh7LrhJ2+w0mdGsORy6B2iI=;
        b=FMXwIe/7Bn7/hdKlipoQ1f0/xSBydeCmaDM9u/aa/Kpms/RnKFmmn8M2/r3vHsrDoq
         8hYXJVno9uKpQS6nPKoaZxrCI/yW4kXuPlZrz6Hwj+XbkrDWh2O7glktHeCTkLxlcftJ
         0SQMbE+q4G41zBlZpcTKn4GiIuDeB+5i/V3UwwWlHrs5dede0pEhOWZiNEv3wCp7aOF5
         h7Wu97kguYV8I6X2KCwXMSQ96lsDx9KQ84fVNvZotZj5Gtv+07n1WpWiLPXYV2H17A1N
         771h7AJPhbiOL1K6bt+7j7K2hOipZElAbA83CaS7G1YF+JiXZgFrlvm1nEDqMhaMtn4t
         kXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lVAMb5FcUl0cTCXFZxdXmh7LrhJ2+w0mdGsORy6B2iI=;
        b=TiCrXlt3CS+ZWX09vdeQh3Xll6/SgrjQaoYcJpp31rSqLXsEqDXBywrSkON+xwhhSs
         hpZKEd0pDUXotnYy1NG0T6HThwiwhYYJNnY2eWZBB6QIG2zO9rd/rW5/6nzp6oPNHR3f
         126HLSm6K7x+w12tNkSqtUpWzLn55OOkUvNxiZ+OBuMMGDLHwBfaTvGtqwmRJ3M194Ju
         dnDZCxWxmLv5RVBQfpLGdSVHE+tAeHrIVFQrlVM9vWCF477g7G+MCgEYfLUuf5xrjTcz
         f+Twj4PV7G/3e0msKXLANVPyliVn6x9ca/mTSVnmewtUgOUNwccFTQjaoLt934v0COa6
         qYRA==
X-Gm-Message-State: AOAM530IDi0h5oJUUhUBG1sXTCHLm4Yxk13t8q1KJxYCMSZ9bS1r9FsJ
        jjKJWgP2XsfMpJ0LtPB3ibgMpnisaLwCLQ==
X-Google-Smtp-Source: ABdhPJzarHptlaH68kZ6X5YDa03H5yYmObSbd2zD/7DXchrhZqMkmExZdJiPWPEboJX6C0ijawg53w==
X-Received: by 2002:a17:902:7281:b029:d6:c8e9:da75 with SMTP id d1-20020a1709027281b02900d6c8e9da75mr1089395pll.48.1604656141624;
        Fri, 06 Nov 2020 01:49:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y124sm1394779pfy.28.2020.11.06.01.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 01:49:00 -0800 (PST)
Message-ID: <5fa51c0c.1c69fb81.71481.2750@mx.google.com>
Date:   Fri, 06 Nov 2020 01:49:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.10-rc2-457-g3952050a63fb
Subject: next/pending-fixes baseline: 354 runs,
 9 regressions (v5.10-rc2-457-g3952050a63fb)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 354 runs, 9 regressions (v5.10-rc2-457-g395205=
0a63fb)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 2          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

meson-gxl-s805x-p241     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc2-457-g3952050a63fb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc2-457-g3952050a63fb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3952050a63fbdcb7738971a91bfe2222efe7f17c =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e0cf28c3443fb3db8886

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa4e0cf28c3443fb3db8=
887
        failing since 184 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e48636f2cc67e7db88a5

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fa4e48636f2cc67=
e7db88a8
        failing since 1 day (last pass: v5.10-rc2-346-g3261d524354a, first =
fail: v5.10-rc2-396-ga212a20610dd8)
        1 lines

    2020-11-06 05:49:44.455000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-06 05:49:44.455000+00:00  (user:khilman) is already connected
    2020-11-06 05:50:00.262000+00:00  =00
    2020-11-06 05:50:00.262000+00:00  =

    2020-11-06 05:50:00.279000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-06 05:50:00.279000+00:00  =

    2020-11-06 05:50:00.279000+00:00  DRAM:  948 MiB
    2020-11-06 05:50:00.294000+00:00  RPI 3 Model B (0xa02082)
    2020-11-06 05:50:00.384000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-06 05:50:00.416000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 2          =


  Details:     https://kernelci.org/test/plan/id/5fa4dfc6934158365adb8853

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fa4dfc69341583=
65adb8857
        new failure (last pass: v5.10-rc2-396-ga212a20610dd8)
        4 lines

    2020-11-06 05:31:39.510000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address aaaaacaa
    2020-11-06 05:31:39.511000+00:00  kern  :alert : pgd =3D f5d66d02
    2020-11-06 05:31:39.511000+00:00  kern  :alert : [aaaaacaa] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fa4dfc69341583=
65adb8858
        new failure (last pass: v5.10-rc2-396-ga212a20610dd8)
        27 lines

    2020-11-06 05:31:39.513000+00:00  kern  :emerg : Process dropbear (pid:=
 137, stack limit =3D 0xb56f13af)
    2020-11-06 05:31:39.514000+00:00  kern  :emerg : Stack: (0xc43dfef8 to =
0xc43e0000)
    2020-11-06 05:31:39.553000+00:00  kern  :emerg : fee0:                 =
                                      c411fc00 00000000
    2020-11-06 05:31:39.554000+00:00  kern  :emerg : ff00: c43dff5c c43dff1=
0 c02543ac c017fb80 c0e04248 00000089 00000051 00000000
    2020-11-06 05:31:39.555000+00:00  kern  :emerg : ff20: 00000100 0000000=
0 c00a1f75 311a2b4e c43dff5c c411fc00 00000000 c1520000
    2020-11-06 05:31:39.555000+00:00  kern  :emerg : ff40: ffffff9c be987e5=
0 be987e60 0000000b c43dff84 c43dff60 c02547d8 c0254124
    2020-11-06 05:31:39.556000+00:00  kern  :emerg : ff60: be987e50 be987e6=
0 be987e60 0000000b c0100264 c43de000 c43dffa4 c43dff88
    2020-11-06 05:31:39.596000+00:00  kern  :emerg : ff80: c0255148 c02546b=
c 00000000 00000008 be987f6d be987e50 00000000 c43dffa8
    2020-11-06 05:31:39.597000+00:00  kern  :emerg : ffa0: c0100060 c025511=
4 be987f6d be987e50 00000000 00000000 00000000 00000000
    2020-11-06 05:31:39.598000+00:00  kern  :emerg : ffc0: 00000000 0000000=
0 00000000 00000000 00000000 00000000 00000000 00000000 =

    ... (16 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e5094d993ad3bddb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa4e5094d993ad3bddb8=
854
        failing since 11 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e50a4d993ad3bddb8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa4e50a4d993ad3bddb8=
859
        failing since 11 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e6c41a78868f04db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa4e6c41a78868f04db8=
855
        new failure (last pass: v5.10-rc2-396-ga212a20610dd8) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e87ae22329a797db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa4e87ae22329a797db8=
854
        failing since 1 day (last pass: v5.10-rc2-346-g3261d524354a, first =
fail: v5.10-rc2-396-ga212a20610dd8) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-gxl-s805x-p241     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa4e561e3f57c4867db886c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-4=
57-g3952050a63fb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa4e561e3f57c4867db8=
86d
        new failure (last pass: v5.10-rc2-396-ga212a20610dd8) =

 =20
