Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AA327784F
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 20:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbgIXSNh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 14:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728577AbgIXSNh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 14:13:37 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36EAC0613CE
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 11:13:37 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 34so62732pgo.13
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 11:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/8fRxhM3iH2uip7yuvc9KPwOpRaldJLCWwlpXGzhApc=;
        b=D+6kCQ5NCIrQCWKkCcdE4luXwcpxmt+srOnlZrH4PfIcbMT2tTm3P+KzjhQw1gcr8k
         N2KCEy2ObRxsIMqs8kt5btuc+jXPEWyM+mom1uOZUimxmBVRRVUfOGKFxXmOx2uffDDc
         NrCn2BAqYcVG+2i1TDxdKBGy0PWXH9m7X0vn5N4XZnHKWh0uhujc34De4AH4+CHWjIOe
         0C03Uf+c6KYZhNvON7e7vVtUwzxPpkMxlEbaWCTimiSvGRCT55Ampy1z0b/sQ52DdRco
         rKWxl2kEEWTWWEsypwzw6zRGEBu04MeL7eEzvG1TZXEWRJsNCkYyd2BEJBbHQmwyfHBh
         0f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/8fRxhM3iH2uip7yuvc9KPwOpRaldJLCWwlpXGzhApc=;
        b=ZY+x9RWvjyYbGr5orL52K3migTBR5Ww0Gt+OUoMGN6n2fbtRnZ5TbAk6I2xdmyYiIb
         j6lard1aERIYHNnXxMQQA6ViRXtbzRWyiW7y1SAw6XX1F00VtgbHKbQKn47zghoyIX/J
         AfD3SVEn0WlacnGZDz1AQuM1M+tRT1bK1kcx4aMjKmeKzODN17Iy/M+LDeOJEQN7hzKW
         d3YL/T+IsukAzleEbdmR/0lS61DKF18htmWok9o2WlTzcP0bcnh/Wz1BRl7fP59+kAuD
         zHoRULxBnarLgI+TlUIW6MWcfSLeuavyFxZGaLKzqjvGzA0eON4IvVSBhk6EtqdK8yhH
         2xTg==
X-Gm-Message-State: AOAM532rWxwDQMbFkTpHd3teRy2XqsRLcTKAjHH9psbBmKMPR2/YZHp/
        GhdwVNak2VFqrCZZb4tfLkuxS0fWN+QL3g==
X-Google-Smtp-Source: ABdhPJxGmRlzFh7V81x01ZmrNrppqnap167jj6lEBdfKSb2xB/iwMvps0aMXOAKjcla3pzIH3oERlA==
X-Received: by 2002:a17:902:b18f:b029:d2:1ec0:4161 with SMTP id s15-20020a170902b18fb02900d21ec04161mr417505plr.58.1600971216377;
        Thu, 24 Sep 2020 11:13:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m25sm172106pfa.32.2020.09.24.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 11:13:35 -0700 (PDT)
Message-ID: <5f6ce1cf.1c69fb81.6e462.085d@mx.google.com>
Date:   Thu, 24 Sep 2020 11:13:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200924
Subject: next/master baseline: 376 runs, 7 regressions (next-20200924)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 376 runs, 7 regressions (next-20200924)

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
.G_ARM_LPAE=3Dy | 0/1    =

rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defcon=
fig           | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200924/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200924
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d1d2220c7f39d0fca302c4ba6cca4ede01660a2b =



Test Regressions
---------------- =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre    | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6c7a5d280bad764dbf9dc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200924/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200924/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6c7a5d280bad764dbf9=
dc8
      failing since 148 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
dove-cubox            | arm  | lab-pengutronix | gcc-8    | mvebu_v7_defcon=
fig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f6c7d17230a2fc042bf9dbc

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200924/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200924/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6c7d17230a2fc=
042bf9dc2
      failing since 10 days (last pass: next-20200911, first fail: next-202=
00914)
      4 lines

    2020-09-24 14:23:06.177000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-24 14:23:06.178000  kern  :alert : pgd =3D (ptrval)
    2020-09-24 14:23:06.178000  kern  :alert : [0000001c] *pgd=3D3fde7831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6c7d17230a=
2fc042bf9dc3
      failing since 10 days (last pass: next-20200911, first fail: next-202=
00914)
      29 lines

    2020-09-24 14:23:06.214000  kern  :emerg : Process dropbear (pid: 157, =
stack limit =3D 0x(ptrval))
    2020-09-24 14:23:06.214000  kern  :emerg : Stack: (0xee457e30 to 0xee45=
8000)
    2020-09-24 14:23:06.222000  kern  :emerg : 7e20:                       =
              00000004 c027d5c8 c0eab79c 00000002
    2020-09-24 14:23:06.233000  kern  :emerg : 7e40: c0b0232c c0b02330 eea4=
a428 eea4a410 00000003 000003c4 eea4a428 0000002a
    2020-09-24 14:23:06.240000  kern  :emerg : 7e60: 00000000 00000000 ee45=
7f78 c0107e3c eea4a428 0000002a 00000000 eea4a410
    2020-09-24 14:23:06.249000  kern  :emerg : 7e80: eea4a428 c027e444 0000=
0000 00001000 be832848 eea4a438 00000000 c0a09cbc
    2020-09-24 14:23:06.258000  kern  :emerg : 7ea0: c0e2de34 c0b17574 0a97=
4bf6 ef1a1f80 c027e0c8 eeaa80c0 be832848 00001000
    2020-09-24 14:23:06.267000  kern  :emerg : 7ec0: ee457f78 00000001 c02d=
3ec8 c02d3f70 ee456000 00001000 00000000 be832848
    2020-09-24 14:23:06.268000  kern  :emerg : 7ee0: eeaa80c0 ee457f78 0000=
0001 c0255944 00000008 00000000 00000051 c026ad84
    2020-09-24 14:23:06.276000  kern  :emerg : 7f00: fffff0b8 ffffffff 0000=
0001 00000000 3b9abab8 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
panda                 | arm  | lab-collabora   | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6c7dd4f1c7116510bf9db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200924/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200924/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6c7dd4f1c7116510bf9=
db4
      failing since 64 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6c7c8b6cf47cc074bf9eee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200924/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200924/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6c7c8b6cf47cc074bf9=
eef
      new failure (last pass: next-20200923)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defcon=
fig           | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6c7f51820b5797d0bf9dbf

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200924/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200924/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6c7f51820b579=
7d0bf9e05
      failing since 3 days (last pass: next-20200918, first fail: next-2020=
0921)
      4 lines

    2020-09-24 14:51:09.964000  kern  :alert : pgd =3D d4f74a19
    2020-09-24 14:51:09.964000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6c7f51820b=
5797d0bf9e06
      failing since 3 days (last pass: next-20200918, first fail: next-2020=
0921)
      42 lines

    2020-09-24 14:51:09.988000  kern  :emerg : Process kworker/1:1 (pid: 52=
, stack limit =3D 0xe5296628)
    2020-09-24 14:51:09.989000  kern  :emerg : Stack: (0xee4a1d70 to 0xee4a=
2000)
    2020-09-24 14:51:10.001000  kern  :emerg : 1d60:                       =
              ee4a1da2 00000001 ffffffff c07384fc
    2020-09-24 14:51:10.013000  kern  :emerg : 1d80: ee4a1df0 ffffff04 ffff=
0a00 c0cad224 00000016 ed4d5000 ee4a1da2 ed4d5000
    2020-09-24 14:51:10.014000  kern  :emerg : 1da0: c14c4350 c073c368 c14c=
4350 ffffff04 ffff0a00 c09fb934 ed36c020 ed4d5000
    2020-09-24 14:51:10.026000  kern  :emerg : 1dc0: 12b2afff ee4a0000 ed36=
c000 ffffff04 ffff0a00 31e8cadd ee1697c0 ee4a0000
    2020-09-24 14:51:10.038000  kern  :emerg : 1de0: ee4a0000 00000002 ed4d=
5000 ed36c020 c19ee240 ed36c000 c2aa0000 c073c6e8
    2020-09-24 14:51:10.050000  kern  :emerg : 1e00: ee4a1e18 31e8cadd ed4d=
5000 00000000 c0cdd624 c14c4350 003bffc4 31e8cadd
    2020-09-24 14:51:10.051000  kern  :emerg : 1e20: ffff0a00 31e8cadd 003b=
ffc4 31e8cadd ee4a0000 c19ed0c4 ed4d5000 0000004a
    2020-09-24 14:51:10.063000  kern  :emerg : 1e40: c2aa0000 c2aa0000 ed4d=
5000 c149bcb8 c2aa0000 c0cdd6c8 0000000f 00000000
    ... (31 line(s) more)
      =20
