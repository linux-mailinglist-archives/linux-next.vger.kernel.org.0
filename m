Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949A92A29F0
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 12:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgKBLve (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 06:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgKBLve (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 06:51:34 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A51C0617A6
        for <linux-next@vger.kernel.org>; Mon,  2 Nov 2020 03:51:32 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 13so10907934pfy.4
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 03:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=31p2K0OZQYTs474Z0oi9xmfE7vEIPJ79J6mDJn6E1Bs=;
        b=Axb3FGhh/YXCgXHONfJJ9k4zdpqVU/pwz2xf+varApmy1MCGrYlsx/KZ7+eU4IMEd+
         YGdqYnYaFVm9nI+cmbm/l1SAFAYiEfswnrZG2wyyfueGw2bX1A93QNQHVqHeVeXDjV4c
         mUZoo7koFKQJv5p4s/cRSe/FCGZ8f+9MZR2BLKgZQJYBS/AzafsuXvpT2P3IA0B87lHW
         dB9gAdPr9VHkqFzg5KfcZ0CPX0Qsy9ImmVx/EcFV/rf7bfm53Q7WgUUB+ho+8MzBP7r0
         G7dRf+iS1pcJ5kBVUZsvabfEmgPs4lr2WQswIZTjbHtci3p6WX6e0bBCaDJBVT2feQPi
         0RWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=31p2K0OZQYTs474Z0oi9xmfE7vEIPJ79J6mDJn6E1Bs=;
        b=fhWflSJ/5p2LahmK7oFa4c/32pcquvlOGL+VwOXfQNRrqXXvnrzBTWiugAeJi84ff1
         0jkcrm8l0V5KMlWlfONd4Pj3r64Bnfb8Hm98dGmAraypCcmuvA345TUlUFIavUIooBBD
         XOjwEdQ9f7tU9AfLGPtmksC9Bs9B/lwR8aK1l1oU8qV9AYw5gQdAuqDAkNbYxYdBXDdw
         xDaGwnRMbVgbDpfRMCKwzVydgwZPOUh3gHObp4n48t9kuvihROdtAI6SCjbB4e/kUbWT
         A7JstcrIcCpHVwjgi6IPIng2pXlex0o37QA+ImmWCu89AijPm1osDv79LwN1UcNvz3r3
         65Zg==
X-Gm-Message-State: AOAM53241QkOuQ8kHCvHBNVeSR30zCT3YFR4V56X2cFt3theUxjMzKVq
        6gYjXMauR3KR7FZEDQpX9aEICRF0fO/Rcg==
X-Google-Smtp-Source: ABdhPJyCOE9+CoPp1USgjUmp6K6VXIXRj5Nii5WIyakl8ZyNL5iPkxBtzAyIlWPuZik5OqtiQAQ8Vw==
X-Received: by 2002:a63:495d:: with SMTP id y29mr12633063pgk.384.1604317891897;
        Mon, 02 Nov 2020 03:51:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k5sm2981137pjs.14.2020.11.02.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:51:31 -0800 (PST)
Message-ID: <5f9ff2c3.1c69fb81.f6792.80a2@mx.google.com>
Date:   Mon, 02 Nov 2020 03:51:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-622-ga2808d2bc1fb
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 310 runs,
 7 regressions (v5.10-rc1-622-ga2808d2bc1fb)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 310 runs, 7 regressions (v5.10-rc1-622-ga2808d=
2bc1fb)

Regressions Summary
-------------------

platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
at91-sama5d4_xplained       | arm  | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 1          =

beagle-xm                   | arm  | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 1          =

imx6q-sabresd               | arm  | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6q-var-dt6customboard    | arm  | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

panda                       | arm  | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

panda                       | arm  | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 1          =

sun8i-r40-bananapi-m2-ultra | arm  | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc1-622-ga2808d2bc1fb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc1-622-ga2808d2bc1fb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a2808d2bc1fbfd71e47ffe18f53b4ab14ba1775f =



Test Regressions
---------------- =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
at91-sama5d4_xplained       | arm  | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fbe615c083ae7ca3fe812

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9fbe615c083ae7ca3fe=
813
        failing since 181 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
beagle-xm                   | arm  | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fbc8753b8cf39903fe853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9fbc8753b8cf39903fe=
854
        new failure (last pass: v5.10-rc1-410-g125436cab6b8) =

 =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
imx6q-sabresd               | arm  | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fbd7612ea79134d3fe89f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9fbd7612ea79134d3fe=
8a0
        failing since 7 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard    | arm  | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fc41c5e8acaa47f3fe7de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9fc41c5e8acaa47f3fe=
7df
        failing since 7 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
panda                       | arm  | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fbee80cb0eb97063fe818

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f9fbee80cb0eb9=
7063fe81e
        failing since 89 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-11-02 08:10:10.649000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-11-02 08:10:10.655000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-11-02 08:10:10.660000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-11-02 08:10:10.665000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-11-02 08:10:10.671000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-11-02 08:10:10.677000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-11-02 08:10:10.683000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-11-02 08:10:10.689000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-11-02 08:10:10.694000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-11-02 08:10:10.700000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
panda                       | arm  | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fbc8053b8cf39903fe7eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9fbc8053b8cf39903fe=
7ec
        failing since 89 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =



platform                    | arch | lab           | compiler | defconfig  =
                  | regressions
----------------------------+------+---------------+----------+------------=
------------------+------------
sun8i-r40-bananapi-m2-ultra | arm  | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9fd38934f8b66bba3fe7d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/bas=
eline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-6=
22-ga2808d2bc1fb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/bas=
eline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9fd38934f8b66bba3fe=
7d6
        new failure (last pass: v5.10-rc1-327-ge6d922c77db2) =

 =20
