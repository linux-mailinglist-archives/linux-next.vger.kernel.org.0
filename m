Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FB031F3BA
	for <lists+linux-next@lfdr.de>; Fri, 19 Feb 2021 02:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBSB6M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 20:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhBSB6M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2021 20:58:12 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B33C061574
        for <linux-next@vger.kernel.org>; Thu, 18 Feb 2021 17:57:31 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id t2so3193686pjq.2
        for <linux-next@vger.kernel.org>; Thu, 18 Feb 2021 17:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BQWJbwvoH0IQJ39q5DaCG/SwuueqP5pVhOfUGS8Uw1U=;
        b=PFflT1IwQoHAsMFBxRtyCgUzILpAWSNuz6wMtmhdGkcEgFBR3UpVpn8L7c/Ck6yX6Y
         myz6T74DvlWh3Cg0Kv1Rv0+IClICIDgFO36K3GsxN2ESmBDfFSKpDS9RYiqy1jB94dxw
         jL7xpoScem982vqIZYatixAvl5P0wL0Cd0SFNX6S8GN7bAWG3NYSYv/XkelWptVYwu0x
         L1m6Jk2xaeAFRtZYceCwB/Y+Vd5RkxNYiwYw30QHEJTT1zW9QyAnGXmtppdLZC2J9fO1
         uzepY7fd5ASeSn6vczv70/QW+8ppPYBcKVYLRGtADT6qH013lrEmNDPETbX/J+d89hmY
         LzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BQWJbwvoH0IQJ39q5DaCG/SwuueqP5pVhOfUGS8Uw1U=;
        b=umMLBN0p71chqSeHJ7fIWgrQ8ojbbbyWcKKoPZXcGahhcrElo77TPKMoRqy5oxAcN9
         lvUhaHNxKNkxR+tAeZywmTsmLqnwqf4545ZxTpbIwoc1U2iHbvBz8QhxP5zMm7bNPNRz
         7PzRyEUgf7hpTNAHEMtEy6lPHokOwzDGsWteJ5gnaiGwNHHXH+dM+TpjY14AtpbMAu4F
         X82kUGjyYb4D51dNPimK/jdAaqoxpOFzMqOIl0wUcUACJPYv9lUm5yqiE7xgnAo9Z01D
         +zR/CBMmlP+G9wy2qeHpbL/0iW+ie+VRY1tetWLjXBxjPWv83+P8uu+IgwWkHqKEsnps
         4rNg==
X-Gm-Message-State: AOAM533xWw+ATTrZuRsFkv+hHevYBLqUl0ed3V3t8mCHr70MdM3rN49V
        unOXGT4x3bkDS22fLVddO7cZVUdZfSDjZQ==
X-Google-Smtp-Source: ABdhPJzS1n2+IKNEsLqKsqYo9nn5zTw8H7Qncs+WMivOfQrqBcnGJjorLHNpkXkV1PwJOWwS80nfog==
X-Received: by 2002:a17:90a:72c4:: with SMTP id l4mr2190944pjk.52.1613699848072;
        Thu, 18 Feb 2021 17:57:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 9sm7441680pfw.48.2021.02.18.17.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 17:57:27 -0800 (PST)
Message-ID: <602f1b07.1c69fb81.debad.1471@mx.google.com>
Date:   Thu, 18 Feb 2021 17:57:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-2286-g3c15bb8df3365
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 176 runs,
 9 regressions (v5.11-2286-g3c15bb8df3365)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 176 runs, 9 regressions (v5.11-2286-g3c15bb8df=
3365)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-8    | multi_v=
7_defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-2286-g3c15bb8df3365/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-2286-g3c15bb8df3365
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3c15bb8df3365826d67efc332ee490dacc8e901c =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602ee6d5160b4f22b1addd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx=
-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx=
-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ee6d5160b4f22b1add=
d20
        failing since 5 days (last pass: v5.11-rc7-121-gdfed2943da0a, first=
 fail: v5.11-rc7-192-g055e690de1b2) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602eeb7f7a0d05564eaddd55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602eeb7f7a0d05564eadd=
d56
        failing since 14 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ee5c47aa8c67294addd47

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/602ee5c47aa8c672=
94addd4a
        failing since 1 day (last pass: v5.11-619-gde196b2f354e, first fail=
: v5.11-629-gdcd372394d935)
        1 lines

    2021-02-18 22:08:13.858000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-18 22:08:13.858000+00:00  (user:khilman) is already connected
    2021-02-18 22:08:29.111000+00:00  =00
    2021-02-18 22:08:29.111000+00:00  =

    2021-02-18 22:08:29.112000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-18 22:08:29.112000+00:00  =

    2021-02-18 22:08:29.112000+00:00  DRAM:  948 MiB
    2021-02-18 22:08:29.127000+00:00  RPI 3 Model B (0xa02082)
    2021-02-18 22:08:29.215000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-18 22:08:29.247000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (385 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602ee75a297301814faddd0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ee75a297301814fadd=
d0e
        failing since 4 days (last pass: v5.11-rc7-192-g055e690de1b2, first=
 fail: v5.11-rc7-273-g095727507311) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/602ee681f72ddd4f42addcb1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/602ee682f72ddd4=
f42addcb5
        new failure (last pass: v5.11-629-gdcd372394d935)
        8 lines

    2021-02-18 22:12:54.169000+00:00  kern  :alert : Mem abort info:
    2021-02-18 22:12:54.170000+00:00  kern  :alert :   ESR =3D 0x8600000e
    2021-02-18 22:12:54.171000+00:00  kern  :alert :   EC =3D 0x21: IABT (c=
urrent EL), IL =3D 32 bits
    2021-02-18 22:12:54.173000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-02-18 22:12:54.174000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-02-18 22:12:54.175000+00:00  kern  :alert : swapper pgtable: 4k pa=
ges, 48-bit VAs, pgdp=3D0000000002782000
    2021-02-18 22:12:54.184000+00:00  kern  :alert : [ffff800010f500f0] pgd=
=3D000000007ffff003, p4d=3D000000007ffff003, pud=3D000000007fffe003, pmd=3D=
0060000002000781
    2021-02-18 22:12:54.305000+00:00  <8>[   49.555106] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D8>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/602ee682f72ddd4=
f42addcb6
        new failure (last pass: v5.11-629-gdcd372394d935)
        2 lines

    2021-02-18 22:12:54.625000+00:00  kern  :emerg : Code: 00000000 0000000=
0 00000000 00000000 (00000000) =

    2021-02-18 22:12:54.776000+00:00  <8>[   50.025700] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ee60cea48083a0daddcf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ee60cea48083a0dadd=
cf4
        new failure (last pass: v5.11-629-gdcd372394d935) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ee5f6aa12117819addce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ee5f6aa12117819add=
cea
        new failure (last pass: v5.11-629-gdcd372394d935) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602ee614ea48083a0daddd20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-2286-=
g3c15bb8df3365/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602ee614ea48083a0dadd=
d21
        new failure (last pass: v5.11-629-gdcd372394d935) =

 =20
