Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B803426A058
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 10:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgIOIBj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 04:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIOIA1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 04:00:27 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF1AC06174A
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 01:00:26 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d19so920876pld.0
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 01:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SJpr36teYxYZwDIVt9ugPAJd8S/2CUzQ9A72Tl6EnJc=;
        b=fBOCL1PWOxlEEzoeW8Ot9ikvtn/ELU4bnWJrj6F+QKzCwrVX1SkrKapIJ0p36S8FZk
         Fyiei4P+2Bcf7APT7MW8JGr5Kqp1xFX3Ta2DOUzZzH08sicEhH3QVzZiUsIGAT+p3v4d
         2tMSHTdnC3aiUBdiZWFaCTpmOJEuv7p8mNUZUDynt0NgHCt0NhhXBNlwz2N9A+aA6Fhg
         WXw9tmrUD5HNvKx/Xrcxp4/T1kIGSXJvO7Be2grwuz0XcaposoxYGSIj7wfGLzv02JSs
         M+eL6gIah0Rl+ql2gT/NPD+a6mfpNpjem8146rKIwC1XszFOjmMkFdbTtFy9vCJvAFJs
         FWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SJpr36teYxYZwDIVt9ugPAJd8S/2CUzQ9A72Tl6EnJc=;
        b=V9BG5KAZz+IaT0Vp0oXRrjS4chgyq1AuSTPn5C5wQJyl+Ef4LOF638Sb+nDhyNWdNs
         om4fWh4HjZDchfcyz0fhjZ42RGU/ZxUzHMtVZAL5ekCWwhAVWHMeoJ6mnFATeqObwk17
         dSOGu037N/oKlDtJqgjBJqsj8ILYJqOVRK+HWo4JbVL2I3dZ93oUrR3FRV8JZMPTCKos
         nZngHJv9aIf7qSbxyJq7i8jpga5mvYjqmH09fiM486Jf/WG5kC7eKi3D82y1GESUy/Aa
         UEP7ounRRCPDJptmpjUNOjULnTEnZJSCg8co1Zt9ilC+tcl5rFpuP7HULctAgiI7St52
         8Fog==
X-Gm-Message-State: AOAM533VSVeYYBqbd0zXj6rMBqUYzMf2IWsvvq0U56U1r56YgrQTiZKk
        5PXU5HR/cLFfrasIKYqYVdxNkSR/0mgFkw==
X-Google-Smtp-Source: ABdhPJxijmzX+qOFtMGbHHkjVD8/+tYui+v0/dnfT1RMJ8lGxD3rEPGyVsiHbuCY0+wF1Ys3aNN5ow==
X-Received: by 2002:a17:902:ea8b:b029:d1:7ed9:55c6 with SMTP id x11-20020a170902ea8bb02900d17ed955c6mr17897987plb.19.1600156823739;
        Tue, 15 Sep 2020 01:00:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c1sm12712042pfc.93.2020.09.15.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 01:00:22 -0700 (PDT)
Message-ID: <5f607496.1c69fb81.99126.18c3@mx.google.com>
Date:   Tue, 15 Sep 2020 01:00:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200914
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 472 runs, 39 regressions (next-20200914)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 472 runs, 39 regressions (next-20200914)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 0/1    =

beagle-xm                 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/3    =

beaglebone-black          | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

beaglebone-black          | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 2/4    =

beaglebone-black          | arm   | lab-cip         | gcc-8    | omap2plus_=
defconfig          | 3/5    =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | mvebu_v7_d=
efconfig           | 2/5    =

hifive-unleashed-a00      | riscv | lab-baylibre    | gcc-8    | defconfig =
                   | 0/1    =

imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_=
defconfig          | 3/5    =

imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

odroid-x2                 | arm   | lab-collabora   | gcc-8    | exynos_def=
config             | 0/1    =

odroid-x2                 | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

panda                     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =

panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

panda                     | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 0/1    =

panda                     | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 0/1    =

rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 67/69  =

rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 67/69  =

rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =

sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200914/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200914
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f965d3ec86fa89285db0fbb983da76ba9c398efa =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f6042adb7fdd6923da60935

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6042adb7fdd69=
23da60938
      new failure (last pass: next-20200902)
      4 lines

    2020-09-15 04:27:19.131000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 04:27:19.132000  kern  :alert : [0000001c] *pgd=3D3a707831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6042adb7fd=
d6923da60939
      new failure (last pass: next-20200902)
      29 lines

    2020-09-15 04:27:19.244000  kern  :emerg : Process dropbear (pid: 138, =
stack limit =3D 0x(ptrval))
    2020-09-15 04:27:19.244000  kern  :emerg : Stack: (0xc3aa7e30 to 0xc3aa=
8000)
    2020-09-15 04:27:19.244000  kern  :emerg : 7e20:                       =
              00000010 c04c9e94 c19f75bc 00000002
    2020-09-15 04:27:19.244000  kern  :emerg : 7e40: c137d53c c136c02c c3a4=
d018 c3a4d000 00000003 00000428 c3a4d018 00000038
    2020-09-15 04:27:19.244000  kern  :emerg : 7e60: 00000000 00000000 c3aa=
7f78 c0307f4c c3a4d018 00000038 00000000 c3a4d000
    2020-09-15 04:27:19.283000  kern  :emerg : 7e80: c3a4d018 c04cad10 0000=
0000 00001000 bec4e858 c3a4d028 00000000 c100edbc
    2020-09-15 04:27:19.284000  kern  :emerg : 7ea0: c1877434 c138ed64 2b66=
7bbc db20e680 c04ca994 d8693cc0 bec4e858 00001000
    2020-09-15 04:27:19.284000  kern  :emerg : 7ec0: c3aa7f78 00000001 c052=
36a8 c0523750 c3aa6000 00001000 00000000 bec4e858
    2020-09-15 04:27:19.284000  kern  :emerg : 7ee0: d8693cc0 c3aa7f78 0000=
0001 c04a1984 00000008 00000000 00000051 c04b725c
    2020-09-15 04:27:19.284000  kern  :emerg : 7f00: ffffd17b ffffffff 0000=
0001 00000000 3b9a9b7b 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f603ee92736c98bfda6091f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f603ee92736c98bfda60=
920
      failing since 139 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beagle-xm                 | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/3    =


  Details:     https://kernelci.org/test/plan/id/5f6042e0325941c855a60947

  Results:     2 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6042e0325941c=
855a6094a
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:28:01.866000  <4>[   35.648193] WARNING: CPU: 0 PID: 5 at=
 drivers/opp/core.c:678 dev_pm_opp_set_rate+0x494/0x574
    2020-09-15 04:28:01.875000  <4>[   35.657135] Modules linked in: phy_ge=
neric phy_twl4030_usb omap2430 musb_hdrc ehci_omap
    2020-09-15 04:28:01.884000  <4>[   35.665649] CPU: 0 PID: 5 Comm: kwork=
er/0:0 Tainted: G      D W         5.9.0-rc5-next-20200914 #1
    2020-09-15 04:28:01.890000  <4>[   35.674926] Hardware name: Generic OM=
AP36xx (Flattened Device Tree)
    2020-09-15 04:28:01.895000  <4>[   35.681518] Workqueue: events dbs_wor=
k_handler
    2020-09-15 04:28:01.904000  <4>[   35.686279] [<c0310d04>] (unwind_back=
trace) from [<c030b7e4>] (show_stack+0x10/0x14)
    2020-09-15 04:28:01.911000  <4>[   35.694335] [<c030b7e4>] (show_stack)=
 from [<c0f64a9c>] (dump_stack+0xc8/0xdc)
    2020-09-15 04:28:01.918000  <4>[   35.701873] [<c0f64a9c>] (dump_stack)=
 from [<c0343b04>] (__warn+0xd8/0xf0)
    2020-09-15 04:28:01.926000  <4>[   35.709045] [<c0343b04>] (__warn) fro=
m [<c0f60ce0>] (warn_slowpath_fmt+0x64/0xbc)
    2020-09-15 04:28:01.934000  <4>[   35.716857] [<c0f60ce0>] (warn_slowpa=
th_fmt) from [<c0cf76f8>] (dev_pm_opp_set_rate+0x494/0x574)
    ... (179 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f6044082ef55c2cb3a609ab

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6044082ef55c2=
cb3a609ae
      new failure (last pass: next-20200806)
      4 lines

    2020-09-15 04:33:06.337000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:33:06.340000  kern  :alert : pgd =3D 4749b23b
    2020-09-15 04:33:06.346000  kern  :alert : [0000001c] *pgd=3D97a4f831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6044082ef5=
5c2cb3a609af
      new failure (last pass: next-20200806)
      29 lines

    2020-09-15 04:33:06.382000  kern  :emerg : Process dropbear (pid: 127, =
stack limit =3D 0x28d35a9f)
    2020-09-15 04:33:06.387000  kern  :emerg : Stack: (0xd780fe30 to 0xd781=
0000)
    2020-09-15 04:33:06.395000  kern  :emerg : fe20:                       =
              00000010 c04c9e94 c19f75bc 00000002
    2020-09-15 04:33:06.403000  kern  :emerg : fe40: c137d53c c136c02c c361=
6018 c3616000 00000003 0000044f c3616018 0000003d
    2020-09-15 04:33:06.412000  kern  :emerg : fe60: 00000000 00000000 d780=
ff78 c0307f4c c3616018 0000003d 00000000 c3616000
    2020-09-15 04:33:06.420000  kern  :emerg : fe80: c3616018 c04cad10 0000=
0000 00001000 bea97858 c3616028 00000000 c100edbc
    2020-09-15 04:33:06.428000  kern  :emerg : fea0: c1877434 c138ed64 29cb=
ded6 db23d980 c04ca994 c3741900 bea97858 00001000
    2020-09-15 04:33:06.436000  kern  :emerg : fec0: d780ff78 00000001 c052=
36a8 c0523750 d780e000 00001000 00000000 bea97858
    2020-09-15 04:33:06.445000  kern  :emerg : fee0: c3741900 d780ff78 0000=
0001 c04a1984 00000008 00000000 00000051 c04b725c
    2020-09-15 04:33:06.453000  kern  :emerg : ff00: ffffeee9 ffffffff 0000=
0001 00000000 3b9ab8e9 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f60429994f3f904c3a60914

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60429994f3f90=
4c3a60918
      new failure (last pass: next-20200806)
      4 lines

    2020-09-15 04:27:00.770000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:27:00.774000  kern  :alert : pgd =3D fec89872
    2020-09-15 04:27:00.779000  kern  :alert : [0000001c] *pgd=3D8352e831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60429994f3=
f904c3a60919
      new failure (last pass: next-20200806)
      29 lines

    2020-09-15 04:27:00.817000  kern  :emerg : Process dropbear (pid: 125, =
stack limit =3D 0x7564db87)
    2020-09-15 04:27:00.819000  kern  :emerg : Stack: (0xd7825e30 to 0xd782=
6000)
    2020-09-15 04:27:00.828000  kern  :emerg : 5e20:                       =
              00000010 c04c9e94 c19f75bc 00000002
    2020-09-15 04:27:00.836000  kern  :emerg : 5e40: c137d53c c136c02c c350=
8018 c3508000 00000003 0000044f c3508018 0000003d
    2020-09-15 04:27:00.844000  kern  :emerg : 5e60: 00000000 00000000 d782=
5f78 c0307f4c c3508018 0000003d 00000000 c3508000
    2020-09-15 04:27:00.853000  kern  :emerg : 5e80: c3508018 c04cad10 0000=
0000 00001000 befa9858 c3508028 00000000 c100edbc
    2020-09-15 04:27:00.861000  kern  :emerg : 5ea0: c1877434 c138ed64 0765=
bc64 db23d980 c04ca994 c363db40 befa9858 00001000
    2020-09-15 04:27:00.869000  kern  :emerg : 5ec0: d7825f78 00000001 c052=
36a8 c0523750 d7824000 00001000 00000000 befa9858
    2020-09-15 04:27:00.878000  kern  :emerg : 5ee0: c363db40 d7825f78 0000=
0001 c04a1984 00000008 00000000 00000051 c04b725c
    2020-09-15 04:27:00.885000  kern  :emerg : 5f00: ffffedef ffffffff 0000=
0001 00000000 3b9ab7ef 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f6042cf325941c855a6091d

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6042cf325941c=
855a60920
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:27:53.850000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:27:53.854000  kern  :alert : pgd =3D 4ac258b9
    2020-09-15 04:27:53.860000  kern  :alert : [0000001c] *pgd=3D9e180831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6042cf3259=
41c855a60921
      new failure (last pass: next-20200911)
      28 lines

    2020-09-15 04:27:53.904000  kern  :emerg : Process dropbear (pid: 151, =
stack limit =3D 0xa7cb43db)
    2020-09-15 04:27:53.913000  kern  :emerg : Stack: (0xdb18de40 to 0xdb18=
e000)
    2020-09-15 04:27:53.919000  kern  :emerg : de40: db18c000 c02fb888 c0ee=
7f60 00000002 0000065c db0c8460 00000003 0000003e
    2020-09-15 04:27:53.924000  kern  :emerg : de60: 00000000 c0e604f4 db0c=
8478 db0c8478 db18df78 c0108028 00000000 c0e604f4
    2020-09-15 04:27:53.932000  kern  :emerg : de80: db0c8478 db0c8460 0000=
0691 c02fc6bc 1ca4a370 00001000 bef2e858 db0c8488
    2020-09-15 04:27:53.941000  kern  :emerg : dea0: 00000000 00000000 1d87=
1deb de16a380 c02fc334 db159f00 bef2e858 00001000
    2020-09-15 04:27:53.949000  kern  :emerg : dec0: db18df78 00000001 c036=
5a9c c0365b44 db18c000 00001000 00000000 bef2e858
    2020-09-15 04:27:53.960000  kern  :emerg : dee0: db159f00 db18df78 0000=
0001 c02d1be4 ffffeebf ffffffff 00000001 00000000
    2020-09-15 04:27:53.968000  kern  :emerg : df00: 3b9ab8bf 00000000 0000=
0001 00000000 3b9ab8bf 00000000 00000001 000f423b
    2020-09-15 04:27:53.976000  kern  :emerg : df20: 3b9ab8bf 00000000 0000=
0002 be3e024e 00000000 bef2e850 db18c000 db18df68
    ... (17 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-cip         | gcc-8    | omap2plus_=
defconfig          | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f6042e5325941c855a60951

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6042e5325941c=
855a60955
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:28:17.173000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:28:17.177000  kern  :alert : pgd =3D 13c7bc54
    2020-09-15 04:28:17.183000  kern  :alert : [0000001c] *pgd=3D83947831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6042e53259=
41c855a60956
      new failure (last pass: next-20200911)
      28 lines

    2020-09-15 04:28:17.227000  kern  :emerg : Process dropbear (pid: 148, =
stack limit =3D 0x0b38d568)
    2020-09-15 04:28:17.232000  kern  :emerg : Stack: (0xc3927e40 to 0xc392=
8000)
    2020-09-15 04:28:17.239000  kern  :emerg : 7e40: c3926000 c02fb888 c0ee=
7f60 00000002 00000690 c37bf4b0 00000003 0000003e
    2020-09-15 04:28:17.248000  kern  :emerg : 7e60: 00000000 c0e604f4 c37b=
f4c8 c37bf4c8 c3927f78 c0108028 00000000 c0e604f4
    2020-09-15 04:28:17.255000  kern  :emerg : 7e80: c37bf4c8 c37bf4b0 0000=
06c5 c02fc6bc 20486e2c 00001000 be8aa858 c37bf4d8
    2020-09-15 04:28:17.264000  kern  :emerg : 7ea0: 00000000 00000000 117e=
1d6c de16a380 c02fc334 de291300 be8aa858 00001000
    2020-09-15 04:28:17.272000  kern  :emerg : 7ec0: c3927f78 00000001 c036=
5a9c c0365b44 c3926000 00001000 00000000 be8aa858
    2020-09-15 04:28:17.281000  kern  :emerg : 7ee0: de291300 c3927f78 0000=
0001 c02d1be4 ffffeb01 ffffffff 00000001 00000000
    2020-09-15 04:28:17.288000  kern  :emerg : 7f00: 3b9ab501 00000000 0000=
0001 00000000 3b9ab501 00000000 00000001 000f423a
    2020-09-15 04:28:17.297000  kern  :emerg : 7f20: 3b9ab501 00000000 0000=
0002 d6bce3c2 00000000 be8aa850 c3926000 c3927f68
    ... (17 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f6042b9b7fdd6923da60940

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6042b9b7fdd69=
23da60946
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:26:29.687000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:26:29.687000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 04:26:29.688000  kern  :alert : [0000001c] *pgd=3D3b9d1831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6042b9b7fd=
d6923da60947
      new failure (last pass: next-20200911)
      29 lines

    2020-09-15 04:26:29.722000  kern  :emerg : Process dropbear (pid: 132, =
stack limit =3D 0x(ptrval))
    2020-09-15 04:26:29.722000  kern  :emerg : Stack: (0xc41e5e30 to 0xc41e=
6000)
    2020-09-15 04:26:29.725000  kern  :emerg : 5e20:                       =
              00000010 c04c9e94 c19f75bc 00000002
    2020-09-15 04:26:29.742000  kern  :emerg : 5e40: c137d53c c136c02c eef7=
9018 eef79000 00000003 0000040b eef79018 0000002a
    2020-09-15 04:26:29.744000  kern  :emerg : 5e60: 00000000 00000000 c41e=
5f78 c0307f4c eef79018 0000002a 00000000 eef79000
    2020-09-15 04:26:29.776000  kern  :emerg : 5e80: eef79018 c04cad10 0000=
0000 00001000 bea2f848 eef79028 00000000 c100edbc
    2020-09-15 04:26:29.776000  kern  :emerg : 5ea0: c1877434 c138ed64 14be=
502a ee8a5d80 c04ca994 c410d000 bea2f848 00001000
    2020-09-15 04:26:29.777000  kern  :emerg : 5ec0: c41e5f78 00000001 c052=
36a8 c0523750 c41e4000 00001000 00000000 bea2f848
    2020-09-15 04:26:29.777000  kern  :emerg : 5ee0: c410d000 c41e5f78 0000=
0001 c04a1984 00000008 00000000 00000051 c04b725c
    2020-09-15 04:26:29.796000  kern  :emerg : 5f00: ffffef80 ffffffff 0000=
0001 00000000 3b9ab980 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | mvebu_v7_d=
efconfig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f5f454e0c5cb435e6a60929

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5f454e0c5cb43=
5e6a6092d
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:10:19.472000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:10:19.472000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 04:10:19.472000  kern  :alert : [0000001c] *pgd=3D3fdff831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5f454e0c5c=
b435e6a6092e
      new failure (last pass: next-20200911)
      29 lines

    2020-09-15 04:10:19.508000  kern  :emerg : Process dropbear (pid: 152, =
stack limit =3D 0x(ptrval))
    2020-09-15 04:10:19.511000  kern  :emerg : Stack: (0xee953e30 to 0xee95=
4000)
    2020-09-15 04:10:19.517000  kern  :emerg : 3e20:                       =
              00000004 c027c018 c0ea50fc 00000002
    2020-09-15 04:10:19.526000  kern  :emerg : 3e40: c0b01524 c0b01528 eea4=
c428 eea4c410 00000003 000003c4 eea4c428 0000002a
    2020-09-15 04:10:19.535000  kern  :emerg : 3e60: 00000000 00000000 ee95=
3f78 c0107e3c eea4c428 0000002a 00000000 eea4c410
    2020-09-15 04:10:19.544000  kern  :emerg : 3e80: eea4c428 c027ce94 0000=
0000 00001000 beb3c848 eea4c438 00000000 c0a09b7c
    2020-09-15 04:10:19.553000  kern  :emerg : 3ea0: c0e28634 c0b1666c 096f=
2204 ef1f5f80 c027cb18 eea493c0 beb3c848 00001000
    2020-09-15 04:10:19.562000  kern  :emerg : 3ec0: ee953f78 00000001 c02d=
28e4 c02d298c ee952000 00001000 00000000 beb3c848
    2020-09-15 04:10:19.564000  kern  :emerg : 3ee0: eea493c0 ee953f78 0000=
0001 c0254378 00000008 00000000 00000051 c026978c
    2020-09-15 04:10:19.571000  kern  :emerg : 3f00: ffffef74 ffffffff 0000=
0001 00000000 3b9ab974 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
hifive-unleashed-a00      | riscv | lab-baylibre    | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5f4791e8a516e2cfa6091c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5f4791e8a516e2cfa60=
91d
      failing since 4 days (last pass: next-20200818, first fail: next-2020=
0909)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_=
defconfig          | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f5f45506bd26569eca60914

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5f45506bd2656=
9eca60918
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:21:17.444000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:21:17.444000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 04:21:17.445000  kern  :alert : [0000001c] *pgd=3Dc8290831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5f45506bd2=
6569eca60919
      new failure (last pass: next-20200911)
      28 lines

    2020-09-15 04:21:17.520000  kern  :emerg : Process dropbear (pid: 169, =
stack limit =3D 0x(ptrval))
    2020-09-15 04:21:17.521000  kern  :emerg : Stack: (0xdc8d1e40 to 0xdc8d=
2000)
    2020-09-15 04:21:17.529000  kern  :emerg : 1e40: dc51ee00 dc51ee6c c169=
f860 00000002 c1d294dc dc8b8088 00000003 00000171
    2020-09-15 04:21:17.538000  kern  :emerg : 1e60: 00000000 c15a20fc dc8b=
80a0 dc8b80a0 dc8d1f78 c01084d4 00000000 c15a20fc
    2020-09-15 04:21:17.547000  kern  :emerg : 1e80: dc8b80a0 dc8b8088 0000=
0558 c02e0a14 dc8d1ef8 00001000 beb13858 dc8b80b0
    2020-09-15 04:21:17.556000  kern  :emerg : 1ea0: 00000000 00000000 27f0=
c06e dc2adb40 c02e067c dc3bc280 beb13858 00001000
    2020-09-15 04:21:17.565000  kern  :emerg : 1ec0: dc8d1f78 00000001 c034=
d3d4 c034d47c dc8d0000 000010[   11.316665] evbug: Event. Dev: input0, Type=
: 3, Code: 1, Value: 29
    2020-09-15 04:21:17.574000  [   11.324677] evbug: Event. Dev: input0, T=
ype: 0, Code: 0, Value: 0
    2020-09-15 04:21:17.574000  00 00000000 beb13858
    2020-09-15 04:21:17.583000  kern  :emerg : 1ee0: dc3bc280 dc8d1f78 0000=
0001 c02b1c0c ffffc91e ffffffff 00000001 00000000
    ... (19 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f60431c00a415c371a60914

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60431c00a415c=
371a6091a
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:29:10.813000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 04:29:10.813000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 04:29:10.814000  kern  :alert : [0000001c] *pgd=3Dcb21c831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60431c00a4=
15c371a6091b
      new failure (last pass: next-20200911)
      29 lines

    2020-09-15 04:29:10.863000  kern  :emerg : Process dropbear (pid: 128, =
stack limit =3D 0x(ptrval))
    2020-09-15 04:29:10.864000  kern  :emerg : Stack: (0xc81d9e30 to 0xc81d=
a000)
    2020-09-15 04:29:10.872000  kern  :emerg : 9e20:                       =
              00000010 c04c9e94 c19f75bc 00000002
    2020-09-15 04:29:10.881000  kern  :emerg : 9e40: c137d53c c136c02c c802=
40b8 c80240a0 00000003 00000425 c80240b8 00000171
    2020-09-15 04:29:10.890000  kern  :emerg : 9e60: 00000000 00000000 c81d=
9f78 c0307f4c c80240b8 00000171 00000000 c80240a0
    2020-09-15 04:29:10.899000  kern  :emerg : 9e80: c80240b8 c04cad10 0000=
0000 00001000 beaae858 c80240c8 00000000 c100edbc
    2020-09-15 04:29:10.908000  kern  :emerg : 9ea0: c1877434 c138ed64 19e6=
92f4 de9f3680 c04ca994 c81dd000 beaae858 00001000
    2020-09-15 04:29:10.917000  kern  :emerg : 9ec0: c81d9f78 00000001 c052=
36a8 c0523750 c81d8000 00001000 00000000 beaae858
    2020-09-15 04:29:10.918000  kern  :emerg : 9ee0: c81dd000 c81d9f78 0000=
0001 c04a1984 00000008 00000000 00000051 c04b725c
    2020-09-15 04:29:10.929000  kern  :emerg : 9f00: ffffe98a ffffffff 0000=
0001 00000000 3b9ab38a 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
odroid-x2                 | arm   | lab-collabora   | gcc-8    | exynos_def=
config             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5f476371cdfeea7aa6091c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5f476371cdfeea7aa60=
91d
      new failure (last pass: next-20200911)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
odroid-x2                 | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60439e35bd50ab60a60930

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60439e35bd50ab60a60=
931
      new failure (last pass: next-20200911)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6047d68485758888a60934

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6047d68485758888a60=
935
      new failure (last pass: next-20200911)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f6041681f7f735bcea6091e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6041681f7f735=
bcea60922
      failing since 61 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-15 04:21:54.354000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-15 04:21:54.360000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-15 04:21:54.366000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-15 04:21:54.371000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-15 04:21:54.377000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-15 04:21:54.383000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-15 04:21:54.389000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-15 04:21:54.394000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-15 04:21:54.400000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-15 04:21:54.406000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60438835bd50ab60a6092b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60438835bd50ab60a60=
92c
      new failure (last pass: next-20200911)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6049cb44f89d6fffa6093f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6049cb44f89d6fffa60=
940
      failing since 55 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6044d0858e3a13a0a60914

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6044d0858e3a13a0a60=
915
      failing since 55 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f6042479b03d6fc9ea60916

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f6042479b03d6f=
c9ea6091a
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:25:35.218000  kern  :alert : pgd =3D 0d9d50db
    2020-09-15 04:25:35.218000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f6042479b03=
d6fc9ea6091b
      new failure (last pass: next-20200911)
      41 lines

    2020-09-15 04:25:35.242000  kern  :emerg : Process kworker/0:0 (pid: 3,=
 stack limit =3D 0xb722e230)
    2020-09-15 04:25:35.243000  kern  :emerg : Stack: (0xee0e7d80 to 0xee0e=
8000)
    2020-09-15 04:25:35.255000  kern  :emerg : 7d80: ee0e7db2 ffffffb6 ffff=
ffff c06c6934 ee0e7e00 ffffff04 ffff0a00 c0c09fd0
    2020-09-15 04:25:35.267000  kern  :emerg : 7da0: 00000016 c30a7000 ee0e=
7db2 c30a7000 c13b519c c06ca748 c13b519c ffffff04
    2020-09-15 04:25:35.268000  kern  :emerg : 7dc0: ffff0a00 a0000093 8000=
0013 c30a7000 3cf58fff c1704048 80000013 ffffff04
    2020-09-15 04:25:35.280000  kern  :emerg : 7de0: ffff0a00 989c045c 0000=
004a c1704048 c1704048 00000002 c30a7000 c309ec20
    2020-09-15 04:25:35.292000  kern  :emerg : 7e00: c18c87b8 c309ec00 c31a=
8000 c06caabc ee0e7e28 989c045c c30a7000 00000000
    2020-09-15 04:25:35.305000  kern  :emerg : 7e20: c0c38f94 c13b519c 003b=
ffc4 989c045c ffff0a00 989c045c 003bffc4 989c045c
    2020-09-15 04:25:35.305000  kern  :emerg : 7e40: c1704048 c18c763c c30a=
7000 0000004a c31a8000 c31a8000 c30a7000 c138ccac
    2020-09-15 04:25:35.318000  kern  :emerg : 7e60: c31a8000 c0c39038 0000=
000f 00000000 c309ec20 c309ec00 c31a8000 c0c39230
    ... (30 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f604295d47117b0baa60928

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f604295d47117b=
0baa6092c
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:26:54.519000  kern  :alert : pgd =3D 9fd9d23f
    2020-09-15 04:26:54.519000  kern  :alert : [003bffc4] *pgd=3D8000000020=
4003, *pmd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f604295d471=
17b0baa6092d
      new failure (last pass: next-20200911)
      42 lines

    2020-09-15 04:26:54.550000  kern  :emerg : Process kworker/3:3 (pid: 13=
3, stack limit =3D 0xebe417c2)
    2020-09-15 04:26:54.550000  kern  :emerg : Stack: (0xe92d5d70 to 0xe92d=
6000)
    2020-09-15 04:26:54.562000  kern  :emerg : 5d60:                       =
              e92d5da2 00000001 ffffffff c0838c9c
    2020-09-15 04:26:54.562000  kern  :emerg : 5d80: e92d5df0 ffffff04 ffff=
0a00 c0dad680 00000016 e9298000 e92d5da2 e9298000
    2020-09-15 04:26:54.575000  kern  :emerg : 5da0: c16c284c c083caf8 c16c=
284c ffffff04 ffff0a00 c0afcd7c e935e820 e9298000
    2020-09-15 04:26:54.587000  kern  :emerg : 5dc0: 16d67fff e92d4000 e935=
e800 ffffff04 ffff0a00 9368c212 ea3a0b80 e92d4000
    2020-09-15 04:26:54.600000  kern  :emerg : 5de0: e92d4000 00000002 e929=
8000 e935e820 c1bc29b4 e935e800 c2aa4000 c083ce78
    2020-09-15 04:26:54.600000  kern  :emerg : 5e00: e92d5e18 9368c212 e929=
8000 00000000 c0ddd824 c16c284c 003bffc4 9368c212
    2020-09-15 04:26:54.612000  kern  :emerg : 5e20: ffff0a00 9368c212 003b=
ffc4 9368c212 e92d4000 c1bc1838 e9298000 0000004a
    2020-09-15 04:26:54.624000  kern  :emerg : 5e40: c2aa4000 c2aa4000 e929=
8000 c169a0f0 c2aa4000 c0ddd8c8 0000000f 00000000
    ... (31 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
rk3288-veyron-jaq         | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60453e54588671fba60914

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60453e54588671fba60=
915
      new failure (last pass: next-20200911)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f5f52ffe650e219d9a6091e

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5f52ffe650e21=
9d9a60921
      new failure (last pass: next-20200911)
      4 lines

    2020-09-14 11:24:38.796000  kern  :alert : pgd =3D (ptrval)
    2020-09-14 11:24:38.797000  kern  :alert : [0000001c] *pgd=3D4343b831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5f52ffe650=
e219d9a60922
      new failure (last pass: next-20200911)
      29 lines

    2020-09-14 11:24:38.837000  kern  :emerg : Process dropbear (pid: 129, =
stack limit =3D 0x(ptrval))
    2020-09-14 11:24:38.839000  kern  :emerg : Stack: (0xddfe1e28 to 0xddfe=
2000)
    2020-09-14 11:24:38.840000  kern  :emerg : 1e20:                   c0cf=
bdb4 c0c0505c 00000008 c0c04edc c0800578 00000002
    2020-09-14 11:24:38.841000  kern  :emerg : 1e40: c091dbe0 c091dbe4 ddd0=
b018 ddd0b000 00000003 00000655 ddd0b018 00000078
    2020-09-14 11:24:38.842000  kern  :emerg : 1e60: 00000000 00000000 ddfe=
1f78 c01075d4 ddd0b018 00000078 00000000 ddd0b000
    2020-09-14 11:24:38.878000  kern  :emerg : 1e80: ddd0b018 c024c9f0 0000=
0000 00001000 be806858 ddd0b028 00000000 c080557c
    2020-09-14 11:24:38.880000  kern  :emerg : 1ea0: c0c49334 c092e994 1c9c=
3b95 df540b80 c024c674 c3418c00 be806858 00001000
    2020-09-14 11:24:38.881000  kern  :emerg : 1ec0: ddfe1f78 00000001 c029=
b3ac c029b454 ddfe0000 00001000 00000000 be806858
    2020-09-14 11:24:38.883000  kern  :emerg : 1ee0: c3418c00 ddfe1f78 0000=
0001 c0223d90 00000008 00000000 00000051 c0239270
    2020-09-14 11:24:38.884000  kern  :emerg : 1f00: ffffee95 ffffffff 0000=
0001 00000000 3b9ab895 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f604a602bd89f353ca6093c

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f604a602bd89f3=
53ca6093f
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 05:00:01.724000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 05:00:01.725000  kern  :alert : [0000001c] *pgd=3D43af6831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f604a602bd8=
9f353ca60940
      new failure (last pass: next-20200911)
      29 lines

    2020-09-15 05:00:01.751000  kern  :emerg : Process dropbear (pid: 122, =
stack limit =3D 0x(ptrval))
    2020-09-15 05:00:01.753000  kern  :emerg : Stack: (0xc3c19e30 to 0xc3c1=
a000)
    2020-09-15 05:00:01.754000  kern  :emerg : 9e20:                       =
              00000010 c04c9e94 c19f75bc 00000002
    2020-09-15 05:00:01.756000  kern  :emerg : 9e40: c137d53c c136c02c c3a8=
d018 c3a8d000 00000003 00000352 c3a8d018 00000044
    2020-09-15 05:00:01.757000  kern  :emerg : 9e60: 00000000 00000000 c3c1=
9f78 c0307f4c c3a8d018 00000044 00000000 c3a8d000
    2020-09-15 05:00:01.782000  kern  :emerg : 9e80: c3a8d018 c04cad10 0000=
0000 00001000 beb84858 c3a8d028 00000000 c100edbc
    2020-09-15 05:00:01.784000  kern  :emerg : 9ea0: c1877434 c138ed64 2377=
c922 c90f1d80 c04ca994 c3b9ad80 beb84858 00001000
    2020-09-15 05:00:01.785000  kern  :emerg : 9ec0: c3c19f78 00000001 c052=
36a8 c0523750 c3c18000 00001000 00000000 beb84858
    2020-09-15 05:00:01.787000  kern  :emerg : 9ee0: c3b9ad80 c3c19f78 0000=
0001 c04a1984 00000008 00000000 00000051 c04b725c
    2020-09-15 05:00:01.789000  kern  :emerg : 9f00: ffffeebf ffffffff 0000=
0001 00000000 3b9ab8bf 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f5f460b8ad6dead8ca6092a

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200914/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200914/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5f460b8ad6dea=
d8ca6092d
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 04:31:43.654000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 04:31:43.655000  kern  :alert : [0000001c] *pgd=3D47f96831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5f460b8ad6=
dead8ca6092e
      new failure (last pass: next-20200911)
      29 lines

    2020-09-15 04:31:43.695000  kern  :emerg : Process dropbear (pid: 122, =
stack limit =3D 0x(ptrval))
    2020-09-15 04:31:43.697000  kern  :emerg : Stack: (0xc7febe28 to 0xc7fe=
c000)
    2020-09-15 04:31:43.698000  kern  :emerg : be20:                   c0cf=
bdb4 c0c0505c 00000008 c0c04edc c0800574 00000002
    2020-09-15 04:31:43.699000  kern  :emerg : be40: c091dbe0 c091dbe4 c7e1=
80b8 c7e180a0 00000003 0000038f c7e180b8 00000044
    2020-09-15 04:31:43.701000  kern  :emerg : be60: 00000000 00000000 c7fe=
bf78 c01075d4 c7e180b8 00000044 00000000 c7e180a0
    2020-09-15 04:31:43.736000  kern  :emerg : be80: c7e180b8 c024c9f0 0000=
0000 00001000 bebd7858 c7e180c8 00000000 c080557c
    2020-09-15 04:31:43.738000  kern  :emerg : bea0: c0c49334 c092e994 34c3=
2351 c949cf80 c024c674 c7e179c0 bebd7858 00001000
    2020-09-15 04:31:43.740000  kern  :emerg : bec0: c7febf78 00000001 c029=
b3ac c029b454 c7fea000 00001000 00000000 bebd7858
    2020-09-15 04:31:43.741000  kern  :emerg : bee0: c7e179c0 c7febf78 0000=
0001 c0223d90 00000008 00000000 00000051 c0239270
    2020-09-15 04:31:43.742000  kern  :emerg : bf00: fffff036 ffffffff 0000=
0001 00000000 3b9aba36 00000000 00000001 00000000
    ... (18 line(s) more)
      =20
