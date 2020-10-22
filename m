Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EA2295682
	for <lists+linux-next@lfdr.de>; Thu, 22 Oct 2020 04:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895204AbgJVCqc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 22:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895201AbgJVCqc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 22:46:32 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1BEC0613CE
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 19:46:32 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x13so217419pfa.9
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 19:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WSoKm6lcl/MYbHnLeOXqZfER4jj5qg6sLEPM6TWgOUw=;
        b=xa/K5QAZI2zwebq3uY2ZVHYDPv+jMFUFC9LKawuPNvhZyJobFIPzMRtn7p32AvANUH
         syYfisX+FuqDH52vOmd+DeWKtrDClXkrQWcQQvQBj0NQOCgbLCBpdOQwEE9AWT8MBpNr
         Du9AZVOpztfwM8Y6WHQqtI8HHGKewmYOT/BplbmW0simGw/BO2iViQR9cKIdopoT/r3O
         e0cv3P0rGvP4A8wfki8e42PtVZMjdSuR4z5sh0HrRIQlR45LiGoXCbBizSLvQJyNvoyH
         wQts70gZBYJ8q2yr1z92hKhAzOYt/Y/L3d0MadvjZZy/Z05kvHghNTw7oR+3Fi8dZGWD
         RTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WSoKm6lcl/MYbHnLeOXqZfER4jj5qg6sLEPM6TWgOUw=;
        b=qUrjwVjx/H+wBR/kLs1jje/shMD5sB3GX3iZ72LU2cbVZAW0kt/odyNcmL2SRGhmee
         njoA/wqSDGO95Ofl/PgwY0t+tL6eughhxqaaaUEj6Xroql37p9U25jU2R9ubJiX0KmJL
         maOjnZtu+rSEMa+T6jefjnx/JADFOqgDtsqmOJbpt88q+9YakF+0m20G/Xqupe2WNjWR
         4HCVUABdCf3wgG5YJ7+1LRRqfyVKsv66GEjp7b2f9v6p7h3TJMU6KZ7NOX6Z7FDr8rna
         WJVDFIANEoj1EsAidRZde5fxeoP3ExqRJ7RwcgE9zSQNC01BXzfUqndWMzQQW1e5hf9k
         Wflg==
X-Gm-Message-State: AOAM531o4P8WRzGk5UnArYN+OI8C4KbcLqG1/6DzIbc9MI80zxJVlzb7
        tUqSa12nDOLoXEXedrER1BmavqSjqn2+sw==
X-Google-Smtp-Source: ABdhPJwfkekZpj2TfUIVgCFYYLpH/SNgywpmJ2zrOmkc+TUrOMThr5HSRKg2HaDsOKWlIL+E0MInCA==
X-Received: by 2002:a62:5215:0:b029:156:6a80:a257 with SMTP id g21-20020a6252150000b02901566a80a257mr545172pfb.63.1603334790801;
        Wed, 21 Oct 2020 19:46:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q8sm85355pfk.207.2020.10.21.19.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 19:46:30 -0700 (PDT)
Message-ID: <5f90f286.1c69fb81.b974a.05c6@mx.google.com>
Date:   Wed, 21 Oct 2020 19:46:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-12645-gfdba6f84e806
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 321 runs,
 3 regressions (v5.9-12645-gfdba6f84e806)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 321 runs, 3 regressions (v5.9-12645-gfdba6f84e=
806)

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
v5.9-12645-gfdba6f84e806/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-12645-gfdba6f84e806
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fdba6f84e806c8f95cda104af1a2496fabbbe8db =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f90bb9433d06620f74ff3e0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12645-=
gfdba6f84e806/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12645-=
gfdba6f84e806/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f90bb9433d06620=
f74ff3e4
      failing since 0 day (last pass: v5.9-10224-g4054eebdfdd6, first fail:=
 v5.9-12353-gd3f7f27bb8d1)
      2 lines

    2020-10-21 22:49:51.091000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-21 22:49:51.091000  (user:khilman) is already connected
    2020-10-21 22:50:05.896000  =00
    2020-10-21 22:50:05.897000  =

    2020-10-21 22:50:05.897000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-21 22:50:05.897000  =

    2020-10-21 22:50:05.897000  DRAM:  948 MiB
    2020-10-21 22:50:05.912000  RPI 3 Model B (0xa02082)
    2020-10-21 22:50:06  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-21 22:50:06.032000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f90bcdf5f343c710c4ff3f0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12645-=
gfdba6f84e806/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12645-=
gfdba6f84e806/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f90bcdf5f343c7=
10c4ff3f6
      failing since 77 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-21 22:57:29.217000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-21 22:57:29.223000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-21 22:57:29.228000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-21 22:57:29.234000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-21 22:57:29.240000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-21 22:57:29.246000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-21 22:57:29.251000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-21 22:57:29.257000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-21 22:57:29.263000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-21 22:57:29.269000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f90beef69349d3f3b4ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12645-=
gfdba6f84e806/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12645-=
gfdba6f84e806/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f90beef69349d3f3b4ff=
3ea
      failing since 77 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
