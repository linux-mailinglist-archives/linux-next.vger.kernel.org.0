Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F37275FE3
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 20:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgIWSck (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 14:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgIWScj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 14:32:39 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13ABC0613CE
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2020 11:32:39 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a9so170466pjg.1
        for <linux-next@vger.kernel.org>; Wed, 23 Sep 2020 11:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t9o8v1IbP7IHYnjXq/trqiZ676lH68ZhzwjOXlCiIgE=;
        b=zLg2dOJgHUy/Q5XXMzsxOURJe7sUj0TAvr/R1PAzfypVf1ZUXIY7P9bFO1HE5CUHXN
         tJobSHbOMotXJ7Ivd5ctAii9Ip+QPTDWzlqE4fwmzLrMgQXyPONiGg80/x0JPHMWeTAs
         nwgURlVpHRUQdq0vNt8eBY0WuD06vUQhumqvv0PInNOb5xLkSpvHaOdjsp3KSrktgmph
         qm5jstsk0GdP1L/ogN1+QJGK5DS2A0ZyH6s/dr+6PVyOgXurdAAOz6XRlefEZ5TQqz3X
         +JBRJ19VevINH0O+rISwXa8zmymFP8aN93mFSg1rZjhWNZyC2mq8GodUfeoqXa7rd7W9
         o8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t9o8v1IbP7IHYnjXq/trqiZ676lH68ZhzwjOXlCiIgE=;
        b=fOdOOnpge7vEGsxxUzd4eSvH8YHzCrL9E8LbxjkKbha2Q7AtoSaxh2fdi1jSpxXNG/
         Anu+R6/CIJu022QVofLmMHOrsgqOfnHbyl0dF3c9aRA2SOfpMRAb8upAgtxByLJgPBQH
         5obmTSMPxVzy3aaGqZYSYZy7DqWeqOG3Htkvu1/3kxqNodf/gLGHBXOSxWSgtB6lHCSg
         K044qU6LSCrtZM8c/DzvlhAhlkScfSvYSKheADCQynbq/M3kBgn3olRZjhWCxHEEv3Qh
         OXhWl6HGftqLWsHdSfCMHKDMbfdKBi/HsL9awMA3ucBdNOeYVtuwpmQ4cb7TBbH2mrz4
         PfEg==
X-Gm-Message-State: AOAM530hwNu8lzUOeyMVnXh4hU7Nhf02mz1gUuPLNjGIAldDy3gecRrO
        avHTA5X3AxYesPsxRZlVFr1CUSUkQcBXhQ==
X-Google-Smtp-Source: ABdhPJzxLCSiacm/xcmYYEK5N4TTpt5z+u4ypdAsUET5VkRegzQ2NLz33dfPSNR+x8fLH8Ua9835Rw==
X-Received: by 2002:a17:90b:140c:: with SMTP id jo12mr618776pjb.41.1600885957606;
        Wed, 23 Sep 2020 11:32:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e1sm392886pfl.162.2020.09.23.11.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 11:32:36 -0700 (PDT)
Message-ID: <5f6b94c4.1c69fb81.1c87b.1207@mx.google.com>
Date:   Wed, 23 Sep 2020 11:32:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200923
Subject: next/master baseline: 361 runs, 8 regressions (next-20200923)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 361 runs, 8 regressions (next-20200923)

Regressions Summary
-------------------

platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre    | gcc-8    | sama5_defconfig=
              | 0/1    =

dove-cubox            | arm  | lab-pengutronix | gcc-8    | mvebu_v7_defcon=
fig           | 2/5    =

panda                 | arm  | lab-collabora   | gcc-8    | omap2plus_defco=
nfig          | 0/1    =

rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 67/69  =

rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defcon=
fig           | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200923/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200923
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dcf2427baa64a21bf208c3ef0eceaca9f551d561 =



Test Regressions
---------------- =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre    | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6b5e3e9bb77574b1bf9db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200923/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200923/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6b5e3e9bb77574b1bf9=
db4
      failing since 148 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
dove-cubox            | arm  | lab-pengutronix | gcc-8    | mvebu_v7_defcon=
fig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f6b5b7ccab50dc7fdbf9e2e

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200923/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200923/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6b5b7ccab50dc=
7fdbf9e34
      failing since 9 days (last pass: next-20200911, first fail: next-2020=
0914)
      4 lines

    2020-09-23 14:28:08.273000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-23 14:28:08.273000  kern  :alert : pgd =3D (ptrval)
    2020-09-23 14:28:08.274000  kern  :alert : [0000001c] *pgd=3D3fe1a831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6b5b7ccab5=
0dc7fdbf9e35
      failing since 9 days (last pass: next-20200911, first fail: next-2020=
0914)
      29 lines

    2020-09-23 14:28:08.310000  kern  :emerg : Process dropbear (pid: 152, =
stack limit =3D 0x(ptrval))
    2020-09-23 14:28:08.310000  kern  :emerg : Stack: (0xeeb89e30 to 0xeeb8=
a000)
    2020-09-23 14:28:08.319000  kern  :emerg : 9e20:                       =
              00000004 c027d4fc c0eab79c 00000002
    2020-09-23 14:28:08.328000  kern  :emerg : 9e40: c0b02338 c0b0233c eea4=
a4c8 eea4a4b0 00000003 000003c4 eea4a4c8 0000002a
    2020-09-23 14:28:08.337000  kern  :emerg : 9e60: 00000000 00000000 eeb8=
9f78 c0107e3c eea4a4c8 0000002a 00000000 eea4a4b0
    2020-09-23 14:28:08.346000  kern  :emerg : 9e80: eea4a4c8 c027e378 0000=
0000 00001000 be9ea848 eea4a4d8 00000000 c0a09cbc
    2020-09-23 14:28:08.355000  kern  :emerg : 9ea0: c0e2de34 c0b17514 0954=
408e ef1f3f80 c027dffc eeaaa480 be9ea848 00001000
    2020-09-23 14:28:08.363000  kern  :emerg : 9ec0: eeb89f78 00000001 c02d=
3e00 c02d3ea8 eeb88000 00001000 00000000 be9ea848
    2020-09-23 14:28:08.364000  kern  :emerg : 9ee0: eeaaa480 eeb89f78 0000=
0001 c0255838 00000008 00000000 00000051 c026ac74
    2020-09-23 14:28:08.372000  kern  :emerg : 9f00: ffffef08 ffffffff 0000=
0001 00000000 3b9ab908 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
panda                 | arm  | lab-collabora   | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6b6048b5c985b081bf9db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200923/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200923/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6b6048b5c985b081bf9=
db4
      failing since 63 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6b5f789346e3f230bf9dc5

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200923/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200923/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6b5f789346e3f=
230bf9e0b
      failing since 0 day (last pass: next-20200921, first fail: next-20200=
922)
      4 lines

    2020-09-23 14:45:04.346000  kern  :alert : pgd =3D 325253a0
    2020-09-23 14:45:04.347000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6b5f789346=
e3f230bf9e0c
      failing since 0 day (last pass: next-20200921, first fail: next-20200=
922)
      41 lines

    2020-09-23 14:45:04.370000  kern  :emerg : Process kworker/0:3 (pid: 42=
, stack limit =3D 0xced20434)
    2020-09-23 14:45:04.370000  kern  :emerg : Stack: (0xc295dd80 to 0xc295=
e000)
    2020-09-23 14:45:04.383000  kern  :emerg : dd80: c295ddb2 ffffffb6 ffff=
ffff c06c7974 c295de00 ffffff04 ffff0a00 c0c0e550
    2020-09-23 14:45:04.389000  kern  :emerg : dda0: 00000016 c30dd000 c295=
ddb2 c30dd000 c13b74f0 c06cb788 c13b74f0 ffffff04
    2020-09-23 14:45:04.401000  kern  :emerg : ddc0: ffff0a00 a0000193 8000=
0113 c30dd000 3cf22fff c1704048 80000113 ffffff04
    2020-09-23 14:45:04.414000  kern  :emerg : dde0: ffff0a00 aa7159d9 0000=
004a c1704048 c1704048 00000002 c30dd000 c309d820
    2020-09-23 14:45:04.415000  kern  :emerg : de00: c18f46b4 c309d800 c2f6=
0000 c06cbafc c295de28 aa7159d9 c30dd000 00000000
    2020-09-23 14:45:04.426000  kern  :emerg : de20: c0c3d5d4 c13b74f0 003b=
ffc4 aa7159d9 ffff0a00 aa7159d9 003bffc4 aa7159d9
    2020-09-23 14:45:04.439000  kern  :emerg : de40: c1704048 c18f3538 c30d=
d000 0000004a c2f60000 c2f60000 c30dd000 c138f058
    2020-09-23 14:45:04.458000  kern  :emerg : de60: c2f60000 c0c3d678 0000=
000f 00000000 c309d820 c309d800 c2f60000 c0c3d870
    ... (30 line(s) more)
      =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defcon=
fig           | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6b61cd3e8763bea9bf9de9

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200923/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200923/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6b61ce3e8763b=
ea9bf9e2f
      failing since 2 days (last pass: next-20200918, first fail: next-2020=
0921)
      4 lines

    2020-09-23 14:55:03.488000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 003bffc4
    2020-09-23 14:55:03.493000  kern  :alert : pgd =3D 90537228
    2020-09-23 14:55:03.499000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6b61ce3e87=
63bea9bf9e30
      failing since 2 days (last pass: next-20200918, first fail: next-2020=
0921)
      42 lines

    2020-09-23 14:55:03.514000  kern  :emerg : Process kworker/0:2 (pid: 66=
, stack limit =3D 0xdd27e44c)
    2020-09-23 14:55:03.527000  kern  :emerg : Stack: (0xc2b21d70 to 0xc2b2=
2000)
    2020-09-23 14:55:03.532000  kern  :emerg : 1d60:                       =
              c2b21da2 00000001 ffffffff c073831c
    2020-09-23 14:55:03.545000  kern  :emerg : 1d80: c2b21df0 ffffff04 ffff=
0a00 c0caca2c 00000016 ed515000 c2b21da2 ed515000
    2020-09-23 14:55:03.558000  kern  :emerg : 1da0: c14c4214 c073c188 c14c=
4214 ffffff04 ffff0a00 c09fb134 ed49dc20 ed515000
    2020-09-23 14:55:03.558000  kern  :emerg : 1dc0: 12aeafff c2b20000 ed49=
dc00 ffffff04 ffff0a00 92d23f3b c2ee44c0 c2b20000
    2020-09-23 14:55:03.570000  kern  :emerg : 1de0: c2b20000 00000002 ed51=
5000 ed49dc20 c19ee240 ed49dc00 ee36c000 c073c508
    2020-09-23 14:55:03.575000  kern  :emerg : 1e00: c2b21e18 92d23f3b ed51=
5000 00000000 c0cdce24 c14c4214 003bffc4 92d23f3b
    2020-09-23 14:55:03.593000  kern  :emerg : 1e20: ffff0a00 92d23f3b 003b=
ffc4 92d23f3b c2b20000 c19ed0c4 ed515000 0000004a
    2020-09-23 14:55:03.593000  kern  :emerg : 1e40: ee36c000 ee36c000 ed51=
5000 c149bb7c ee36c000 c0cdcec8 0000000f 00000000
    ... (31 line(s) more)
      =20
