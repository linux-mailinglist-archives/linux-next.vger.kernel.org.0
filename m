Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF8D27D6B5
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 21:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgI2TS0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 15:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgI2TS0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Sep 2020 15:18:26 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E7DC061755
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2020 12:18:25 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id v14so3197441pjd.4
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2020 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4STiRUsppAc2ELSana10blSJyZJMwLF6yFcCmZP6Fvg=;
        b=jffje/KBfPUqJbWrP0ds9/u9JXZegqYbX0blS/Bnq1+RpIcXRhjYkwW4XE4XUBhT6a
         iKkLaMR6uiCe9f+zh30mBNBM0zEiPAEEc3phqlu7dKke6slEq00xumnwEuI16gb83RZK
         QaLKYbT64pCIeFatxXig1yl1CZyWf1xCQgR5jBXdEW3YZ0nZFgEyT3422okDklaraTDJ
         YuhIXskjP3zVpzcN5oKRXUbeZfLEnun9OwQHKsA+Tz4qIOrUO/LV/wNUwRFfv4tmKz/B
         WhOLKqK9oDhr5LP+UaNPsxQjgubFTldoCphAKyE1A3PdeqdQyebPtNGv1MltlIQJeAdF
         SvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4STiRUsppAc2ELSana10blSJyZJMwLF6yFcCmZP6Fvg=;
        b=Kiy4VAIQwT410m+Ln5x0HzOA5QyOWDh7UII8YDxR2leuZyyRz2vsiHqz4Au4YRvE5H
         gVFDFITwFUOxN3LRc8qFx4VJgbIf7hgQLOlCy4hakEOO/yw437nF/fnFMIn9O3MPrUcG
         O8j/bxrDa7rlVLZBsES6nZm6bt1VWszXpmTGmA7oZmXmsFJXQl21NBQCPFQtUisxPnqg
         2HKWT/4Pd6J+8sHmpfghR60OyMy/IA5m+qShB/6sb+YxCjm62VIr3CWFgWRsklmRAncE
         j4mlyLOsdT0P2sm4YbaBHzl4p7e5P+VgcIyP192BlBNXRvTrNRNApZQ3vyoQdIB46FDB
         tSxg==
X-Gm-Message-State: AOAM530L/PZT7H5mTLqZghaGJKi1VpW4BWKTVuZF4fVqnGMM45klb/Nq
        HziH00ytfmRr3R4kSyCpPg7txnjsraAx+w==
X-Google-Smtp-Source: ABdhPJzXOGBlSJIKwp1zDQMxTCpYRIPGwhKP+URXaLZXXQhgIWkW1kr+ZyMVhDVy4fulmrLOsqhcNw==
X-Received: by 2002:a17:90a:46cd:: with SMTP id x13mr5235109pjg.101.1601407104757;
        Tue, 29 Sep 2020 12:18:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t3sm1032259pgm.42.2020.09.29.12.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:18:23 -0700 (PDT)
Message-ID: <5f73887f.1c69fb81.60fc8.20e7@mx.google.com>
Date:   Tue, 29 Sep 2020 12:18:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200929
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 459 runs, 10 regressions (next-20200929)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 459 runs, 10 regressions (next-20200929)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | clang-10 | multi_v7_defc=
onfig           | 2/4    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 2/4    =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3288-veyron-jaq        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 67/69  =

rk3288-veyron-jaq        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | clang-10 | defconfig    =
                | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200929/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200929
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      49e7e3e905e437a02782019570f70997e2da9101 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7354a08dfe239b33877174

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7354a08dfe239b33877=
175
      failing since 154 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | clang-10 | multi_v7_defc=
onfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f7356457c21512576877172

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7356457c21512=
576877177
      new failure (last pass: next-20200928)
      4 lines

    2020-09-29 15:43:58.148000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000313
    2020-09-29 15:43:58.149000  kern  :alert : pgd =3D (ptrval)
    2020-09-29 15:43:58.150000  kern  :alert : [00000313] *pgd=3D4933d831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f7356457c21=
512576877178
      new failure (last pass: next-20200928)
      64 lines

    2020-09-29 15:43:58.192000  kern  :emerg : Process udevd (pid: 113, sta=
ck limit =3D 0x(ptrval))
    2020-09-29 15:43:58.194000  kern  :emerg : Stack: (0xed12bb70 to 0xed12=
c000)
    2020-09-29 15:43:58.194000  kern  :emerg : bb60:                       =
              eda7edb4 ed12bba8 eda7ec00 eda7ec14
    2020-09-29 15:43:58.195000  kern  :emerg : bb80: c147838c 00000122 0000=
0100 c0a5c098 00030003 ed12bb94 ed12bb94 c314ff86
    2020-09-29 15:43:58.196000  kern  :emerg : bba0: ed3a4040 eda7ec00 eda7=
ec00 000002f3 c314ff86 eda7ec00 ede5fa00 ed0ea340
    2020-09-29 15:43:58.235000  kern  :emerg : bbc0: eda7ec14 c147838c 0000=
0122 00000100 00000021 c0a6994c c146dbcc 00000000
    2020-09-29 15:43:58.236000  kern  :emerg : bbe0: eda7ec0c eda7ec00 ffff=
fdfb ed1d1140 ed0f4b08 ed0f4b10 ed0f4b0c c0a3ba00
    2020-09-29 15:43:58.237000  kern  :emerg : bc00: eda7ec00 eead8c10 0000=
0021 bf0406ac ed1cd040 0000000c c1ac4290 ed1d1140
    2020-09-29 15:43:58.238000  kern  :emerg : bc20: 00000021 c0a9be64 0000=
001c ed9f2940 ed0e98c0 ed0e98c0 00000000 ed1cd040
    2020-09-29 15:43:58.238000  kern  :emerg : bc40: c1ac4288 c1b75fec c1b7=
5ff4 00000014 00000100 c0a9c450 eea32c10 00000000
    ... (53 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f73554d77ec8d3047877173

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f73554d77ec8d3=
047877178
      new failure (last pass: next-20200928)
      4 lines

    2020-09-29 15:39:42.172000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000313
    2020-09-29 15:39:42.172000  kern  :alert : pgd =3D 6d92929e
    2020-09-29 15:39:42.172000  kern  :alert : [00000313] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f73554d77ec=
8d3047877179
      new failure (last pass: next-20200928)
      47 lines

    2020-09-29 15:39:42.216000  kern  :emerg : Process kworker/0:2 (pid: 75=
, stack limit =3D 0x19654867)
    2020-09-29 15:39:42.216000  kern  :emerg : Stack: (0xedac1d58 to 0xedac=
2000)
    2020-09-29 15:39:42.217000  kern  :emerg : 1d40:                       =
                                ed203db0 ed203db4
    2020-09-29 15:39:42.217000  kern  :emerg : 1d60: ed203c00 ed203c14 c144=
4cb0 c09ac0dc edac0000 efda0920 ee801e40 ed203c00
    2020-09-29 15:39:42.218000  kern  :emerg : 1d80: 000002f3 c09ad49c c144=
4cb0 ee801d80 eda4ac00 efdac940 c09b982c c1444cb0
    2020-09-29 15:39:42.259000  kern  :emerg : 1da0: c19c6a60 dd4a93dd c19c=
6a7c ed449fc0 edf98900 ed203c00 ed203c14 c1444cb0
    2020-09-29 15:39:42.259000  kern  :emerg : 1dc0: c19c6a60 0000000c c19c=
6a7c c09b97fc c14429d8 00000000 ed203c0c ed203c00
    2020-09-29 15:39:42.259000  kern  :emerg : 1de0: fffffdfb eead8c10 ed22=
9d40 c098f73c ed203c00 bf048000 fffffdfb bf044138
    2020-09-29 15:39:42.260000  kern  :emerg : 1e00: ed4495c0 eda5cf08 0000=
0120 ed21e0c0 ed229d40 c09e9048 ed4495c0 ed4495c0
    2020-09-29 15:39:42.260000  kern  :emerg : 1e20: 00000040 ed4495c0 ed22=
9d40 00000000 c19c6a74 bf09908c bf09a014 00000024
    ... (36 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f73534ebc9abb67dc877169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f73534ebc9abb67dc877=
16a
      failing since 69 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3288-veyron-jaq        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f7374806a052ff887877169

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7374806a052ff=
8878771af
      failing since 4 days (last pass: next-20200924, first fail: next-2020=
0925)
      4 lines

    2020-09-29 17:52:57.905000  kern  :alert : pgd =3D 853294d7
    2020-09-29 17:52:57.906000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f7374806a05=
2ff8878771b0
      failing since 4 days (last pass: next-20200924, first fail: next-2020=
0925)
      41 lines

    2020-09-29 17:52:57.930000  kern  :emerg : Process kworker/0:3 (pid: 42=
, stack limit =3D 0x1860ea40)
    2020-09-29 17:52:57.930000  kern  :emerg : Stack: (0xc2953d80 to 0xc295=
4000)
    2020-09-29 17:52:57.943000  kern  :emerg : 3d80: c2953db2 ffffffb6 ffff=
ffff c06ce454 c2953e00 ffffff04 ffff0a00 c0c16618
    2020-09-29 17:52:57.955000  kern  :emerg : 3da0: 00000016 c3057000 c295=
3db2 c3057000 c13b7174 c06d2260 c13b7174 ffffff04
    2020-09-29 17:52:57.956000  kern  :emerg : 3dc0: ffff0a00 a0000093 8000=
0013 c3057000 3cfa8fff c1704048 80000013 ffffff04
    2020-09-29 17:52:57.968000  kern  :emerg : 3de0: ffff0a00 1e2704de 0000=
004a c1704048 c1704048 00000002 c3057000 c3027820
    2020-09-29 17:52:57.981000  kern  :emerg : 3e00: c18f5dcc c3027800 c3<4=
>[   10.151803] btmrvl_sdio mmc1:0001:2: Direct firmware load for mrvl/sd88=
97_uapsta.bin failed with error -2
    2020-09-29 17:52:57.993000  1b8000 c06d25d4 c2953e28 1e2704de c3057000 =
00000000
    2020-09-29 17:52:58.008000  kern  :emer<3>[   10.167581] Bluetooth: req=
uest_firmware(firmware) failed, error code =3D -2
    2020-09-29 17:52:58.023000  g : 3e20: c0c456d4 c13b7174 003bffc4 1e2704=
de ffff0a00 1e2704de <3>[   10.183851] Bluetooth: Failed to download firmwa=
re!
    ... (34 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3288-veyron-jaq        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f737864627d1b31d5877172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f737864627d1b31d5877=
173
      new failure (last pass: next-20200925)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | clang-10 | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7353405ad3285790877181

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200929/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200929/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7353405ad3285790877=
182
      new failure (last pass: next-20200928)  =20
