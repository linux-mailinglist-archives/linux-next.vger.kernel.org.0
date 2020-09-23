Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3990274FB7
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 06:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgIWEJX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 00:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIWEJX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 00:09:23 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB4EC061755
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2020 21:09:23 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id z18so14261118pfg.0
        for <linux-next@vger.kernel.org>; Tue, 22 Sep 2020 21:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FkCyNMYgBoQ9HfOhYfs45VQko5GlrD17PgEA1gGP1pg=;
        b=oS5VakYmxTdK4jZ+G8CsG4qk8fLuceSr4UnWE6eJPtGQ0xrwJqWADB6xIGqQfqGJGT
         IjyRScIy6ARpgNq5Plqc0x/VuK32GaZRAM6UBhCQBQ+crHomiRotcbhtiyEjXIvqpZL1
         LFXww1AUb2CVVbsceUCDBNVIGZapjwaHK4mH895duSCMEdOx6xWsahpg6QC+2zF/MuSK
         yO/iKIpLk+Atp9GwRA/pX5pS6nfklNhZvYURLJ3n1DmU8BkJR1+rIIFlxHIvIT56tL7R
         xnd/z/GQG7VzA7zZR8faD3xxDUZL1KlQgf2xOUXvjkKMymiR50jrVxM96V4RJzaW4B3p
         1GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FkCyNMYgBoQ9HfOhYfs45VQko5GlrD17PgEA1gGP1pg=;
        b=lE85Zm9rFKBCp+MtrSxGqIaqAnRLIBQcyCWxI+tsiGMvhLs/fkSezDGjOZIMFptAAz
         AC+jzDArnM1Ou6PjQBzv+AT8/e93jQfk04kyh+Qd/ZW1K/eKTi58wTOmFqDtNfIhpB97
         pRNoaqyoi7suK4LXCVkwKhvzYZhrqGkLmOUBuntpWjLS2oSlR/27yUKonAOyY8VgN54h
         1gsRVwYzr792dBAqHeHOxakAebuQmhpGr4jej7SE9foA+X9bDIL8VSXYaJVdALrF9GxL
         m/G+cviCqIYRJx9uFogXJWZMLEbG9vwtligNx4keWgjow+H783F77M6KJ891duz0TZ3x
         RVWQ==
X-Gm-Message-State: AOAM530uzuR+f10h+TOcTj38J3k9XR7L1AXBV5ALyPhIe02qCS/fWbrC
        lU6x96wsSLvqd3Bv8o/YEUQ1YPWRmfMSlQ==
X-Google-Smtp-Source: ABdhPJyK6ntI8/wRYc0MTjnBY2wOAh7cGZJA0Vcdx1fnEPaBMlqSgWeaPB+kZ3HX2MDlKNngJ+iQUg==
X-Received: by 2002:a63:1c4a:: with SMTP id c10mr5988434pgm.22.1600834162555;
        Tue, 22 Sep 2020 21:09:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bt13sm3695090pjb.23.2020.09.22.21.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 21:09:21 -0700 (PDT)
Message-ID: <5f6aca71.1c69fb81.f49df.a708@mx.google.com>
Date:   Tue, 22 Sep 2020 21:09:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200922
Subject: next/master baseline: 414 runs, 7 regressions (next-20200922)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 414 runs, 7 regressions (next-20200922)

Regressions Summary
-------------------

platform          | arch | lab             | compiler | defconfig          =
          | results
------------------+------+-----------------+----------+--------------------=
----------+--------
dove-cubox        | arm  | lab-pengutronix | gcc-8    | mvebu_v7_defconfig =
          | 2/5    =

panda             | arm  | lab-collabora   | gcc-8    | omap2plus_defconfig=
          | 0/1    =

rk3288-veyron-jaq | arm  | lab-collabora   | gcc-8    | multi_v7_defconfig =
          | 67/69  =

rk3288-veyron-jaq | arm  | lab-collabora   | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200922/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200922
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e64997027d5f171148687e58b78c8b3c869a6158 =



Test Regressions
---------------- =



platform          | arch | lab             | compiler | defconfig          =
          | results
------------------+------+-----------------+----------+--------------------=
----------+--------
dove-cubox        | arm  | lab-pengutronix | gcc-8    | mvebu_v7_defconfig =
          | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f6a9126a68655375bbf9def

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200922/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200922/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6a9126a686553=
75bbf9df5
      failing since 8 days (last pass: next-20200911, first fail: next-2020=
0914)
      4 lines

    2020-09-23 00:04:49.813000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-23 00:04:49.814000  kern  :alert : pgd =3D (ptrval)
    2020-09-23 00:04:49.814000  kern  :alert : [0000001c] *pgd=3D3fe09831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6a9126a686=
55375bbf9df6
      failing since 8 days (last pass: next-20200911, first fail: next-2020=
0914)
      29 lines

    2020-09-23 00:04:49.849000  kern  :emerg : Process dropbear (pid: 155, =
stack limit =3D 0x(ptrval))
    2020-09-23 00:04:49.850000  kern  :emerg : Stack: (0xeeb63e30 to 0xeeb6=
4000)
    2020-09-23 00:04:49.859000  kern  :emerg : 3e20:                       =
              00000004 c027d444 c0ea5f9c 00000002
    2020-09-23 00:04:49.868000  kern  :emerg : 3e40: c0b022ec c0b022f0 eea4=
b4c8 eea4b4b0 00000003 000003c4 eea4b4c8 0000002a
    2020-09-23 00:04:49.877000  kern  :emerg : 3e60: 00000000 00000000 eeb6=
3f78 c0107e3c eea4b4c8 0000002a 00000000 eea4b4b0
    2020-09-23 00:04:49.886000  kern  :emerg : 3e80: eea4b4c8 c027e2c0 0000=
0000 00001000 beab8848 eea4b4d8 00000000 c0a09cbc
    2020-09-23 00:04:49.895000  kern  :emerg : 3ea0: c0e28634 c0b174f0 09ff=
116c ef1f5f80 c027df44 eeaf7900 beab8848 00001000
    2020-09-23 00:04:49.903000  kern  :emerg : 3ec0: eeb63f78 00000001 c02d=
3e18 c02d3ec0 eeb62000 00001000 00000000 beab8848
    2020-09-23 00:04:49.904000  kern  :emerg : 3ee0: eeaf7900 eeb63f78 0000=
0001 c0255780 00000008 00000000 00000051 c026abbc
    2020-09-23 00:04:49.913000  kern  :emerg : 3f00: ffffefec ffffffff 0000=
0001 00000000 3b9ab9ec 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform          | arch | lab             | compiler | defconfig          =
          | results
------------------+------+-----------------+----------+--------------------=
----------+--------
panda             | arm  | lab-collabora   | gcc-8    | omap2plus_defconfig=
          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6a94c77c0ce3babebf9dbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200922/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200922/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6a94c77c0ce3babebf9=
dbc
      failing since 63 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform          | arch | lab             | compiler | defconfig          =
          | results
------------------+------+-----------------+----------+--------------------=
----------+--------
rk3288-veyron-jaq | arm  | lab-collabora   | gcc-8    | multi_v7_defconfig =
          | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6aa4a8ff95343aa4bf9db7

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200922/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200922/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6aa4a8ff95343=
aa4bf9dfd
      failing since 1 day (last pass: next-20200918, first fail: next-20200=
921)
      4 lines

    2020-09-23 01:28:00.230000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 003bffc4
    2020-09-23 01:28:00.244000  kern  :alert : pgd =3D 74e364e9
    2020-09-23 01:28:00.244000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6aa4a8ff95=
343aa4bf9dfe
      failing since 1 day (last pass: next-20200918, first fail: next-20200=
921)
      42 lines

    2020-09-23 01:28:00.260000  kern  :emerg : Process kworker/0:3 (pid: 72=
, stack limit =3D 0x3c918a90)
    2020-09-23 01:28:00.272000  kern  :emerg : Stack: (0xc2cc3d70 to 0xc2cc=
4000)
    2020-09-23 01:28:00.272000  kern  :emerg : 3d60:                       =
              c2cc3da2 00000001 ffffffff c073827c
    2020-09-23 01:28:00.290000  kern  :emerg : 3d80: c2cc3df0 ffffff04 ffff=
0a00 c0cabb24 00000016 ed354000 c2cc3da2 ed354000
    2020-09-23 01:28:00.290000  kern  :emerg : 3da0: c14c3d24 c073c0e8 c14c=
3d24 ffffff04 ffff0a00 c09fa22c c2af0c20 ed354000
    2020-09-23 01:28:00.302000  kern  :emerg : 3dc0: 12cabfff c2cc2000 c2af=
0c00 ffffff04 ffff0a00 98d1840e c2910dc0 c2cc2000
    2020-09-23 01:28:00.315000  kern  :emerg : 3de0: c2cc2000 00000002 ed35=
4000 c2af0c20 c19c21d8 c2af0c00 c2a0b000 c073c468
    2020-09-23 01:28:00.315000  kern  :emerg : 3e00: c2cc3e18 98d1840e ed35=
4000 00000000 c0cdbf24 c14c3d24 003bffc4 98d1840e
    2020-09-23 01:28:00.333000  kern  :emerg : 3e20: ffff0a00 98d1840e 003b=
ffc4 98d1840e c2cc2000 c19c105c ed354000 0000004a
    2020-09-23 01:28:00.339000  kern  :emerg : 3e40: c2a0b000 c2a0b000 ed35=
4000 c149b69c c2a0b000 c0cdbfc8 0000000f 00000000
    ... (31 line(s) more)
      =



platform          | arch | lab             | compiler | defconfig          =
          | results
------------------+------+-----------------+----------+--------------------=
----------+--------
rk3288-veyron-jaq | arm  | lab-collabora   | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6aa9ddfe64bc1f9bbf9de0

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200922/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200922/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6aa9ddfe64bc1=
f9bbf9e26
      new failure (last pass: next-20200921)
      4 lines

    2020-09-23 01:50:11.139000  kern  :alert : pgd =3D 5495d30c
    2020-09-23 01:50:11.139000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6aa9ddfe64=
bc1f9bbf9e27
      new failure (last pass: next-20200921)
      41 lines

    2020-09-23 01:50:11.164000  kern  :emerg : Process kworker/0:4 (pid: 46=
, stack limit =3D 0x7bb19ea8)
    2020-09-23 01:50:11.164000  kern  :emerg : Stack: (0xc2969d80 to 0xc296=
a000)
    2020-09-23 01:50:11.174000  kern  :emerg : 9d80: c2969db2 ffffffb6 ffff=
ffff c06c7a74 c2969e00 ffffff04 ffff0a00 c0c0d7f8
    2020-09-23 01:50:11.187000  kern  :emerg : 9da0: 00000016 c2fe1000 c296=
9db2 c2fe1000 c13b7028 c06cb888 c13b7028 ffffff04
    2020-09-23 01:50:11.200000  kern  :emerg : 9dc0: ffff0a00 a0000093 8000=
0013 c2fe1000 3d01efff c1704048 80000013 ffffff04
    2020-09-23 01:50:11.200000  kern  :emerg : 9de0: ffff0a00 4818158c 0000=
004a c1704048 c1704048 00000002 c2fe1000 c30f4020
    2020-09-23 01:50:11.212000  kern  :emerg : 9e00: c18c868c c30f4000 c31b=
0000 c06cbbfc c2969e28 4818158c c2fe1000 00000000
    2020-09-23 01:50:11.225000  kern  :emerg : 9e20: c0c3c874 c13b7028 003b=
ffc4 4818158c ffff0a00 4818158c 003bffc4 4818158c
    2020-09-23 01:50:11.237000  kern  :emerg : 9e40: c1704048 c18c7510 c2fe=
1000 0000004a c31b0000 c31b0000 c2fe1000 c138eba0
    2020-09-23 01:50:11.237000  kern  :emerg : 9e60: c31b0000 c0c3c918 0000=
000f 00000000 c30f4020 c30f4000 c31b0000 c0c3cb10
    ... (30 line(s) more)
      =20
