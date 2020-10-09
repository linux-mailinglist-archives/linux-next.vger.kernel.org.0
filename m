Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC030289B97
	for <lists+linux-next@lfdr.de>; Sat, 10 Oct 2020 00:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389760AbgJIWGL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 18:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389431AbgJIWGL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 18:06:11 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C2FC0613D2
        for <linux-next@vger.kernel.org>; Fri,  9 Oct 2020 15:06:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id m15so5114881pls.8
        for <linux-next@vger.kernel.org>; Fri, 09 Oct 2020 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7nUB4R/sMZ5U2JHa0Mrsju3ZIspBFD2Nf6b5dDfg6wk=;
        b=eCg8LZ3UwPqqOqbY278yPd3cFrp83rPwvynGdYIohoVOZAlr3lCAFmy+ErgKw9b2Mo
         +06FNyOfKuWEv/pnvGJPVi335ZeV532c/Gov2KlB4KKMByyre4tLjYZ6F7yoLjTdW3oQ
         PaG5WJDuKi6sP7OMxTvi6cOwqOChuvzWNCA1NLpF4+CZGR/l16N+adJb9DK4Bko8UQ2a
         PxOnth5jaQk6Roz+2h23Y7d375fsBSjgzqA+a0JfvXwDAC8BbF9+5mhdYhFbJEW8DWO1
         BNtsDFjR0m8mjf75PA1hSqx12e6UbTTxhwLNgqjmVP5ZOQfoychHGiPi5u0MrsP3Ocuk
         6Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7nUB4R/sMZ5U2JHa0Mrsju3ZIspBFD2Nf6b5dDfg6wk=;
        b=oIskITN44Iryc/JA5eCZcMIVnDfKP1UWK24Lej7H3SgnFQapUbUC8arH8IOVoHHa08
         lVUbxtul8MSVoyMq4edGD0RIR/V2aPhzAyeaSWUVM/xnnT7/zW3zib777sbOsoB4DFeh
         uwgcQitmFYhNmPdZ5RXIA9ODSWXG/xnUQijXBVb1ds+cqzqq4GVpxcWupyKaKArE4mYg
         n+VX/9ar9rbm4rrocHSZ5RjMgAcAkrRh5JGlrR4/juaMhGljHvtFQoC1Id73N/oUI/Sh
         n/HbVlog9RWB+7gaiL7M62EKIWxGYUxkzQ/Y+Va3EweaFRCbIiGc1ZnFYoKsqQoa/ZBt
         t7PQ==
X-Gm-Message-State: AOAM5316oiKCk0ZKGCqsMgYb73jIKxzOJzSRk3Wmw/hvaHzuf99lfou1
        uezGQ7xyXSroEd6RzpRrtbckwAZWO6r25g==
X-Google-Smtp-Source: ABdhPJxMfUcv8G39NZugmqiyvpvu4v0I9P3+e3jfZwUsCZfacKOZEtlMZ9Xuts5q3JKaoYo5ZXJQcQ==
X-Received: by 2002:a17:902:b711:b029:d3:f1e5:c9c1 with SMTP id d17-20020a170902b711b02900d3f1e5c9c1mr14212692pls.3.1602281170513;
        Fri, 09 Oct 2020 15:06:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id az18sm12893689pjb.35.2020.10.09.15.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 15:06:09 -0700 (PDT)
Message-ID: <5f80ded1.1c69fb81.cbfdc.77e2@mx.google.com>
Date:   Fri, 09 Oct 2020 15:06:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201009
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 394 runs, 5 regressions (next-20201009)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 394 runs, 5 regressions (next-20201009)

Regressions Summary
-------------------

platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm    | lab-baylibre  | gcc-8    | sama5_defconfig=
              | 0/1    =

bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b       | arm64  | lab-baylibre  | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 3/4    =

panda                 | arm    | lab-collabora | gcc-8    | omap2plus_defco=
nfig          | 0/1    =

qemu_x86_64-uefi      | x86_64 | lab-cip       | gcc-8    | x86_64_defconfi=
g+kvm_guest   | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201009/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201009
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d67bc7812221606e1886620a357b13f906814af7 =



Test Regressions
---------------- =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained | arm    | lab-baylibre  | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f809d60bae76109c64ff42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201009/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201009/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f809d60bae76109c64ff=
42c
      failing since 164 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
bcm2836-rpi-2-b       | arm    | lab-collabora | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8099fe4e08c079b64ff3fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201009/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201009/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8099fe4e08c079b64ff=
3fd
      failing since 9 days (last pass: next-20200929, first fail: next-2020=
0930)  =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b       | arm64  | lab-baylibre  | clang-10 | defconfig+CON..=
._64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f80794ee3fd2c53084ff3f1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201009/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201009/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f80794ee3fd2c53=
084ff3f5
      failing since 8 days (last pass: next-20200930, first fail: next-2020=
1001)
      1 lines

    2020-10-09 14:50:21.680000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-09 14:50:21.680000  (user:khilman) is already connected
    2020-10-09 14:50:37.363000  =00
    2020-10-09 14:50:37.364000  =

    2020-10-09 14:50:37.380000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-09 14:50:37.380000  =

    2020-10-09 14:50:37.380000  DRAM:  948 MiB
    2020-10-09 14:50:37.396000  RPI 3 Model B (0xa02082)
    2020-10-09 14:50:37.485000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-09 14:50:37.517000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (385 line(s) more)
      =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
panda                 | arm    | lab-collabora | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f809b98da0c172a474ff3ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201009/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201009/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f809b98da0c172a474ff=
3eb
      failing since 79 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch   | lab           | compiler | defconfig      =
              | results
----------------------+--------+---------------+----------+----------------=
--------------+--------
qemu_x86_64-uefi      | x86_64 | lab-cip       | gcc-8    | x86_64_defconfi=
g+kvm_guest   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f809b271ecb6bfbdc4ff3f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201009/x86_=
64/x86_64_defconfig+kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201009/x86_=
64/x86_64_defconfig+kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f809b271ecb6bfbdc4ff=
3f6
      new failure (last pass: next-20201008)  =20
