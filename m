Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD2625DD27
	for <lists+linux-next@lfdr.de>; Fri,  4 Sep 2020 17:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730224AbgIDPXQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Sep 2020 11:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730220AbgIDPXP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Sep 2020 11:23:15 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2D5C061244
        for <linux-next@vger.kernel.org>; Fri,  4 Sep 2020 08:23:14 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id w186so4486198pgb.8
        for <linux-next@vger.kernel.org>; Fri, 04 Sep 2020 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lcGlfp3Pedd1LO4pCtcQgx4VbCmJ+NEurE+IFtZcvSg=;
        b=fOSvFP1QoJwLg7EZzA2GidajbklUY9pCbvumXOSUOZmauTsvtGoj2/Qd0dFFTGayG+
         S97+1DeDJtreaqsDM8kz5/Gv9SOgyb98V/mp+du+A7IdS8sSZE7sXritKRSw7KmA2buc
         DwPpUtuK9XWISyUohD9W2ccSaMcbeUMiROzy23+IVg24bPKE00DXFGI36GAoxSCITKpO
         d7pw+KrJ40+Rh3hyVobdQEi/IQejqtozcjkm6vFLDwBRmr5PL6k1N5mI1eMKtuRKokMi
         ImJ49kJ4DubdXb644IMu7a4EWyquWOaMxSgmtIoBJ7yP2/QPjcc07Ub6JZoHdGFTxmi6
         tOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lcGlfp3Pedd1LO4pCtcQgx4VbCmJ+NEurE+IFtZcvSg=;
        b=hUVAgwD1p2iV5cknypUiYgbwGY+adeaRllVuvBhu0siqxdl/n8RSR0P0XhJdwlxDtg
         T889YVshvDiEAV/S9wtJEcQALtNBZzCP2C3wMPCjMyOlwF1zV7XyyCIeg5+tr8Ni1PAe
         Cpz/71AuRsT3H3MNDBdPWa8mIrBZbIcN1OtT905WCpy8kabhfhQmtmi5LetZpAxMuDK+
         CC++sHrbTHLmqHtDIQH1MpjY1isOh2sx1+zVY+o7dR7VyPtWo8qdvMxzXqkarYovCdpE
         O+7vd+V6x27wdOvUsvLTZp1m8O7jIlk6A2SYFP6m78Er9vXfd4hbZObjNECxx5cZmhUs
         wutw==
X-Gm-Message-State: AOAM532RCGZcG56pUSZdm54hx6oKdh5/xxaiHGt8G0oCZroTWlNCKYhA
        6OWCla7iutV56hMy9tsDxlMXaFLJaN7MYA==
X-Google-Smtp-Source: ABdhPJxC4eZtRrEZNSGx2eMBWrpxiLNhS6a/8EhE9WGqr90OI05xyVRaqEe9/Wrp6EtVUMp7vTevyg==
X-Received: by 2002:aa7:9ab0:0:b029:13c:1611:66bb with SMTP id x16-20020aa79ab00000b029013c161166bbmr7368036pfi.6.1599232993560;
        Fri, 04 Sep 2020 08:23:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w192sm7356997pfd.156.2020.09.04.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:23:12 -0700 (PDT)
Message-ID: <5f525be0.1c69fb81.4c488.02ae@mx.google.com>
Date:   Fri, 04 Sep 2020 08:23:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200903
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 304 runs, 12 regressions (next-20200903)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 304 runs, 12 regressions (next-20200903)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b-32       | arm  | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 2/4    =

imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 2/4    =

odroid-xu3               | arm  | lab-collabora | clang-10 | multi_v7_defco=
nfig           | 0/1    =

odroid-xu3               | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 0/1    =

odroid-xu3               | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =

odroid-xu3               | arm  | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 0/1    =

panda                    | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 4/5    =

panda                    | arm  | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 4/5    =

panda                    | arm  | lab-collabora | gcc-8    | omap2plus_defc=
onfig          | 0/1    =

rk3288-veyron-jaq        | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200903/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200903
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7a6956579ce6950890ea706f6fcf7874a7981f50 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b-32       | arm  | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f5222a0631f019c81d35370

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5222a0631f019=
c81d35373
      new failure (last pass: next-20200902)
      8 lines

    2020-09-04 11:18:44.261000  kern  :alert : pgd =3D fb3e3c5a
    2020-09-04 11:18:44.262000  kern  :alert : [00000000] *pgd=3D041ed835, =
*pte=3D00000000, *ppte=3D00000000
    2020-09-04 11:18:44.263000  kern  :alert : 8<--- cut here ---
    2020-09-04 11:18:44.264000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000
    2020-09-04 11:18:44.265000  kern  :alert : pgd =3D fb2e0514
    2020-09-04 11:18:44.265000  kern  :alert : [00000000] *pgd=3D0410f835, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5222a0631f=
019c81d35374
      new failure (last pass: next-20200902)
      88 lines

    2020-09-04 11:18:44.308000  kern  :emerg : Process udevd (pid: 101, sta=
ck limit =3D 0x47193979)
    2020-09-04 11:18:44.309000  kern  :emerg : Stack: (0xc41c7d98 to 0xc41c=
8000)
    2020-09-04 11:18:44.309000  kern  :emerg : 7d80:                       =
                                ea615690 00000000
    2020-09-04 11:18:44.310000  kern  :emerg : 7da0: c41c7e14 c41c7db0 c020=
2a58 c0260888 ea37e880 00000000 c41c7e14 c41c7dd0
    2020-09-04 11:18:44.347000  kern  :emerg : 7dc0: c025eab0 c025e308 0000=
0006 00000000 1f97287d c41c7df8 ea615690 ea501000
    2020-09-04 11:18:44.348000  kern  :emerg : 7de0: 00000006 28d2b926 1f97=
287d 00020070 c41c7e98 00000000 ea615690 c41c7ec0
    2020-09-04 11:18:44.349000  kern  :emerg : 7e00: ea37e880 00000000 c41c=
7e8c c41c7e18 c0260be0 c02028f8 0b973993 00000005
    2020-09-04 11:18:44.350000  kern  :emerg : 7e20: ea501015 c41c7e30 0000=
0000 c0e04248 c41c7e94 00002190 00000002 c02482c0
    2020-09-04 11:18:44.351000  kern  :emerg : 7e40: 00000000 ea4d656c 0000=
0006 00000000 1f97287d c41c7df8 c0264f20 28d2b926
    2020-09-04 11:18:44.352000  kern  :emerg : 7e60: ea61570c 00000000 c0e0=
4248 c41c7f1c ea61570c 00000000 01aef3a8 00000000
    ... (77 line(s) more)
      =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f52292fa194790e29d35370

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f52292fa194790=
e29d35373
      failing since 2 days (last pass: next-20200828, first fail: next-2020=
0902)
      4 lines

    2020-09-04 11:46:47.983000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000313
    2020-09-04 11:46:47.984000  kern  :alert : pgd =3D 48c8e549
    2020-09-04 11:46:47.984000  kern  :alert : [00000313] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f52292fa194=
790e29d35374
      failing since 2 days (last pass: next-20200828, first fail: next-2020=
0902)
      46 lines

    2020-09-04 11:46:48.027000  kern  :emerg : Process kworker/2:0 (pid: 21=
, stack limit =3D 0xa3c5f717)
    2020-09-04 11:46:48.027000  kern  :emerg : Stack: (0xee927d60 to 0xee92=
8000)
    2020-09-04 11:46:48.027000  kern  :emerg : 7d60: ed2205b0 ed2205b4 ed22=
0400 ed220414 c143bda8 c099f9f8 ee926000 c09a0dbc
    2020-09-04 11:46:48.028000  kern  :emerg : 7d80: efd9b180 ed220400 0000=
02f3 0000000c c19988a4 ee801d80 ed174500 c09ad228
    2020-09-04 11:46:48.028000  kern  :emerg : 7da0: efd9ae80 c143bda8 c199=
8888 38ed4fa2 c19988a4 ed18c940 ed165780 ed220400
    2020-09-04 11:46:48.069000  kern  :emerg : 7dc0: ed220414 c143bda8 c199=
8888 0000000c c19988a4 c09ad1f8 c1439ad0 00000000
    2020-09-04 11:46:48.070000  kern  :emerg : 7de0: ed220400 bf048000 ffff=
fdfb eeac8c10 ed0fb040 c0983e04 ed220400 bf044138
    2020-09-04 11:46:48.071000  kern  :emerg : 7e00: ed179580 ed0ce708 0000=
0120 ed0f8140 ed0fb040 c09de4d4 ed179580 ed179580
    2020-09-04 11:46:48.072000  kern  :emerg : 7e20: eea22c10 ed179580 ed0f=
b040 00000000 c199889c bf18508c bf186014 0000001f
    2020-09-04 11:46:48.073000  kern  :emerg : 7e40: ffffe000 c09de5b4 eea2=
2c10 00000000 bf186014 00000000 00000000 c09e794c
    ... (35 line(s) more)
      =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
odroid-xu3               | arm  | lab-collabora | clang-10 | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f522f7332824462cfd3537b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f522f7332824462cfd35=
37c
      failing since 14 days (last pass: next-20200820, first fail: next-202=
00821)  =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
odroid-xu3               | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f522732fe4abfb888d3537a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f522732fe4abfb888d35=
37b
      failing since 41 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
odroid-xu3               | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f522736fe4abfb888d35389

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f522736fe4abfb888d35=
38a
      failing since 41 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
odroid-xu3               | arm  | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f522b372b70d27aafd35389

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f522b372b70d27aafd35=
38a
      failing since 11 days (last pass: next-20200821, first fail: next-202=
00824)  =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
panda                    | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f52267efa45321a02d353a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f52267efa45321=
a02d353aa
      failing since 51 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-04 11:35:21.390000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-04 11:35:21.396000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-04 11:35:21.402000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-04 11:35:21.407000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-04 11:35:21.413000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-04 11:35:21.419000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-04 11:35:21.425000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-04 11:35:21.430000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-04 11:35:21.436000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-04 11:35:21.442000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
panda                    | arm  | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f52281010e63d38f6d3538a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f52281010e63d3=
8f6d3538e
      failing since 51 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-04 11:41:49.471000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-04 11:41:49.476000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-04 11:41:49.482000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-04 11:41:49.488000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-04 11:41:49.494000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-04 11:41:49.500000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-04 11:41:49.506000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-04 11:41:49.512000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-04 11:41:49.518000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-04 11:41:49.524000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
panda                    | arm  | lab-collabora | gcc-8    | omap2plus_defc=
onfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5225c586b2a49a41d35379

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5225c586b2a49a41d35=
37a
      failing since 44 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                 | arch | lab           | compiler | defconfig     =
               | results
-------------------------+------+---------------+----------+---------------=
---------------+--------
rk3288-veyron-jaq        | arm  | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f522735fe4abfb888d35386

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f522735fe4abfb888d35=
387
      new failure (last pass: next-20200902)  =20
