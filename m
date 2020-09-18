Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A773B26FEE4
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 15:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgIRNke (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 09:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgIRNka (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2020 09:40:30 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0818DC0613CE
        for <linux-next@vger.kernel.org>; Fri, 18 Sep 2020 06:40:30 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d9so3473563pfd.3
        for <linux-next@vger.kernel.org>; Fri, 18 Sep 2020 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eMEAHZ7JOcJHjGRfdFWfbNMJCDeXk13x69C9cZA0HNI=;
        b=iXpLoNorEiNNskT7QzZqTmRlS9guk1cQ6Ce1zd5S1/EdNBf3i8Y4o4XohvvdXCzICV
         pNhnKPPsIB1IpHUWpgb/g6kqKp4A1zT2NkcF7mQPZmhOdT5iVS2fDpZ3/j5wARZz6bqw
         eGRnFA9GJ0iCMlA99SWsPpwtQkQXg/QW3XenAQZgYrSEH88ITxXBZ90jCReV2YzFZtD7
         UsJH7KhgQ47P/9LyxAOGGnHxdIJIbiyCGfizwTytLx3K+BU/fqQVigYDQeIU7H3ncLUd
         ltfVD7/iB+Q0RphZ4W+UHAITh67WD+70F8dLDpW78tnotuwGtIRtjCGQupHzWRvkL78p
         QOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eMEAHZ7JOcJHjGRfdFWfbNMJCDeXk13x69C9cZA0HNI=;
        b=g19P3je6aaIUCvTBzo4eurbiSKySubFNUf9GlOA+RxfNg5O9RqBAY9LrtP5Bxub41S
         iGNsklYJXdESpemxsZ5J7gdIH5Uj6Knq3u+5b7tm7dnkUmEnQw23O+pTqVoISu9g8G7I
         cvV5OSIQFnyyuHgNRUh+xOxqHNMBFiroVJxB00dxX3eoetJuTEU8b6DI+WWqmh+V2FXF
         yl+0upphpNvtYq8iDg+GHBaFBVIWSDi7B8sCx+nBpDO9y3O4RmIBzPIEdb/SRNhN7HJR
         qVW2XZ1EMoYwyLUlNkR1soFwdaO/Lnzcj3+kERWn/JFzaKY4mhUtNwj8WGbbVnnqk1eB
         /+wA==
X-Gm-Message-State: AOAM532pc/rd4iW1GKoUXAa7wDP75p474przrGgdO8dakPfotqcGuUH1
        DkMwE4/5FQrgxykY6XovGaogO+5sL0QPow==
X-Google-Smtp-Source: ABdhPJzBJswcosjW7z/rAw199QXhXlWAND14vd+tOYOsO3ET57n0zpfwqHWhmH9Yl8zD6JeI2Cb11w==
X-Received: by 2002:aa7:84c5:0:b029:13f:ed60:b20b with SMTP id x5-20020aa784c50000b029013fed60b20bmr22042192pfn.26.1600436429005;
        Fri, 18 Sep 2020 06:40:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h8sm3274189pfk.19.2020.09.18.06.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 06:40:28 -0700 (PDT)
Message-ID: <5f64b8cc.1c69fb81.a61ef.736a@mx.google.com>
Date:   Fri, 18 Sep 2020 06:40:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200918
Subject: next/master baseline: 378 runs, 5 regressions (next-20200918)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 378 runs, 5 regressions (next-20200918)

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


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200918/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200918
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b652d2a5f2a4e93d803cc33eb57fdc41ee528500 =



Test Regressions
---------------- =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre    | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6483d4f7c2976433bf9dc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200918/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200918/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6483d4f7c2976433bf9=
dc5
      failing since 142 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
dove-cubox            | arm  | lab-pengutronix | gcc-8    | mvebu_v7_defcon=
fig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f648397fa6ff2cd23bf9db3

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200918/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200918/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f648397fa6ff2c=
d23bf9db9
      failing since 3 days (last pass: next-20200911, first fail: next-2020=
0914)
      4 lines

    2020-09-18 09:53:23.131000  kern  :alert : pgd =3D (ptrval)
    2020-09-18 09:53:23.131000  kern  :alert : [0000001c] *pgd=3D3fdca831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f648397fa6f=
f2cd23bf9dba
      failing since 3 days (last pass: next-20200911, first fail: next-2020=
0914)
      29 lines

    2020-09-18 09:53:23.167000  kern  :emerg : Process dropbear (pid: 152, =
stack limit =3D 0x(ptrval))
    2020-09-18 09:53:23.168000  kern  :emerg : Stack: (0xeeb1de30 to 0xeeb1=
e000)
    2020-09-18 09:53:23.175000  kern  :emerg : de20:                       =
              00000004 c027d2d8 c0ea5f5c 00000002
    2020-09-18 09:53:23.184000  kern  :emerg : de40: c0b01b48 c0b01b4c eea4=
c4c8 eea4c4b0 00000003 000003c4 eea4c4c8 0000002a
    2020-09-18 09:53:23.194000  kern  :emerg : de60: 00000000 00000000 eeb1=
df78 c0107e3c eea4c4c8 0000002a 00000000 eea4c4b0
    2020-09-18 09:53:23.203000  kern  :emerg : de80: eea4c4c8 c027e154 0000=
0000 00001000 bea5a848 eea4c4d8 00000000 c0a09b7c
    2020-09-18 09:53:23.212000  kern  :emerg : dea0: c0e28634 c0b16d4c 0968=
8700 ef1f5f80 c027ddd8 eead2540 bea5a848 00001000
    2020-09-18 09:53:23.220000  kern  :emerg : dec0: eeb1df78 00000001 c02d=
3ba4 c02d3c4c eeb1c000 00001000 00000000 bea5a848
    2020-09-18 09:53:23.221000  kern  :emerg : dee0: eead2540 eeb1df78 0000=
0001 c0255624 00000008 00000000 00000051 c026aa34
    2020-09-18 09:53:23.229000  kern  :emerg : df00: ffffef20 ffffffff 0000=
0001 00000000 3b9ab920 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
panda                 | arm  | lab-collabora   | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6488cad15f8a03b7bf9dbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200918/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200918/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6488cad15f8a03b7bf9=
dbd
      failing since 58 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch | lab             | compiler | defconfig      =
              | results
----------------------+------+-----------------+----------+----------------=
--------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora   | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f64869118b1fdfe55bf9db4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200918/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200918/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f64869118b1fdfe55bf9=
db5
      new failure (last pass: next-20200917)  =20
