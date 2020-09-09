Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2619263393
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 19:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730319AbgIIRGV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 13:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730326AbgIIPlg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 11:41:36 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4095EC061756
        for <linux-next@vger.kernel.org>; Wed,  9 Sep 2020 08:41:19 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id l191so2346563pgd.5
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2020 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ae/BAeKKGrpJE9nNNmtzkkiow2Q6ivSY5feho4meiq8=;
        b=d96Q/vGFD19bZBMu4eY3CQcpcPIm9C5RVKSZSbC9H/AJWRqGaeNctCamiTQ5lrR3II
         4CzDa4yGIyzcOKtWnK7RkGL0UVoBpZzYmiUDrRc9/0f9U9PzXa4eFt9PNz9qz4nbL/SC
         ljlPNS5/3gkghsD2zef900W7Oc0UxmyiR1YEtLYzuo6vZ/Z9Z51PnHruYKttzRC7b0NI
         k76ABSpIsqlRd7TUbt4An1GmUQzWVZEAGpqYl78LDtleHFlnXzlo+3VUjZ+/SDWxxve3
         Gj+0BmOM5fCUPM6BBAqL6vSfAD2PxH0h3sdaypPeC8LaqBXdsz3mxuGD3RP0qGxRkRYT
         tsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ae/BAeKKGrpJE9nNNmtzkkiow2Q6ivSY5feho4meiq8=;
        b=myNlFn1ToUbAtJzL4H2llCDKG2xRGnUMh4IUeLg6luDEzHbY2yjxQtLrnrHRG6PiCQ
         tJa7qCy1Juqpxq0yy2HYuP/ykUPRm4ZlYeHmg/idvWvsvP0mRJBa8wkYrpfrkit6fpDC
         EU/+nmTCpAQnVjBWdqHDSfw1AYskxzd2EYzoLBmwrLX3AMZJZIZUC/NeP6fh5soXbYbc
         Zt64Y9XkE3LbH8G13A6P00bw5xuRCvnkcTMhgOuLBLcJy5lfzpXY5HBqLlP9N+1UpDFT
         8MxFigAKAq5man1MklPCyPDDRJbcdr4wRhdYJtLNF0Bpp93GuUq0+OY4EyzdL+W1ZyC4
         TYiA==
X-Gm-Message-State: AOAM532Piec7GJSpcs1VHL+IOA/Hnm5qNbq1Qepx9d2A+Cpv/Us5O+Wv
        jsrKM5xtBcq0UrQn6BLg/MdnAcMglEOEPA==
X-Google-Smtp-Source: ABdhPJxdQ8xgtavpkbwGb6PurYRNILjBxcuUCC8VgT2I5ynla7CXuFTHxYKfPXWBceJr0GMsm52gQg==
X-Received: by 2002:a17:902:aa0a:b029:d0:89f4:6224 with SMTP id be10-20020a170902aa0ab02900d089f46224mr1451741plb.12.1599666066623;
        Wed, 09 Sep 2020 08:41:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 2sm2560738pjg.32.2020.09.09.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 08:41:05 -0700 (PDT)
Message-ID: <5f58f791.1c69fb81.52745.6c48@mx.google.com>
Date:   Wed, 09 Sep 2020 08:41:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc4-322-g03ef16f8dff9
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 327 runs,
 3 regressions (v5.9-rc4-322-g03ef16f8dff9)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 327 runs, 3 regressions (v5.9-rc4-322-g03ef16f=
8dff9)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =

panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc4-322-g03ef16f8dff9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc4-322-g03ef16f8dff9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      03ef16f8dff93dcaf454582ffb92d47b62db096a =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f58bf7904a34619f4d3537f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-32=
2-g03ef16f8dff9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-32=
2-g03ef16f8dff9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f58bf7904a34619=
f4d35381
      failing since 5 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first fa=
il: v5.9-rc3-474-gc41730a9bddc)
      2 lines

    2020-09-09 11:39:29.716000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-09 11:39:29.716000  (user:khilman) is already connected
    2020-09-09 11:39:45.653000  =00
    2020-09-09 11:39:45.653000  =

    2020-09-09 11:39:45.669000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-09 11:39:45.669000  =

    2020-09-09 11:39:45.669000  DRAM:  948 MiB
    2020-09-09 11:39:45.685000  RPI 3 Model B (0xa02082)
    2020-09-09 11:39:45.776000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-09 11:39:45.808000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (382 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f58c7951e7cb6c053d35382

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-32=
2-g03ef16f8dff9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-32=
2-g03ef16f8dff9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f58c7951e7cb6c=
053d35386
      failing since 35 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-09 12:16:15.263000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-09 12:16:15.268000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-09 12:16:15.274000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-09 12:16:15.283000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-09 12:16:15.286000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-09 12:16:15.292000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-09 12:16:15.297000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-09 12:16:15.303000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-09 12:16:15.309000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-09 12:16:15.314000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f58c3d06aa0f03755d35382

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-32=
2-g03ef16f8dff9/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-32=
2-g03ef16f8dff9/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f58c3d06aa0f03755d35=
383
      failing since 35 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
