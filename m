Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3840D296898
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 04:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374733AbgJWCtL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 22:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374715AbgJWCtL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 22:49:11 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0462C0613CE
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 19:49:09 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id x13so44715pgp.7
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 19:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xO9+TEs3h6Delwf6uK6I5WF9Sb+em1SmM8bffk0QYaM=;
        b=DeoxnqUABD5J1KLRtXs9INucD6OW0EaFs3JNdxj8oOxz5PCa3SroJ8vvCIdIYqiDLW
         CYmz8a2Mlde66XeH9OR4IgKqkj/at3+k9D4M09EGUo/ZidttEynsIRd8h4l/LqW3mRqN
         Mgbrtlc3OgV9J/RWgUeC8RQfFSLzhveJCnm5hm6KFkJRQvyjsPHsL5BYXPFXIZ/39iLo
         6qw/pcRTxoc4pVppdFuVQ0Srb1kSe2JD0fBSQzpweiWZr0nJfNB25GRsEwc+yPRLW5TO
         pb5QH6ky+U+LyMAbYFbc5vtyEHFUsCamaCFfJC4J2Lj0yytdUQwF9KdB0ba5T+zPI7pb
         +mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xO9+TEs3h6Delwf6uK6I5WF9Sb+em1SmM8bffk0QYaM=;
        b=BmPam8ZHx661jaY+eYS2r/1czt2G3ONKDP3HQlHNHN2JrZdgA4HId/h50XSZgErVEf
         dGhdGzyTAhiV4RyKAu7xXjUxwr8VnoX4k+d4JPDqBq8yUaLz0k8b44ZXHsSxbbuppLkJ
         WB2cOewusvuClR6Tnq3VTt4utLbTX+MS6weZptzFwd7rw6KC/18J4ga+mob5komVOyMB
         ZOZEaoh/ILETRh6ceJDRncbsLBXS5+qIEMuu4eLE8bAax827c5b2dC62rnQJ36V7DSf4
         uvO1bIvHp7Skta5ifU3upArvp8DIZwTzDVkGlnj4XkagEiVSiB2MJZl4qbB/zlmNAKWB
         ZuvA==
X-Gm-Message-State: AOAM532eU/1DxND4V67u5TH/QRkbAv5CF+17I7h4NdmSWuH2RwQxZNDS
        c+lPGW5o8AQWOxbSKp0AytdkYOALfwnVXA==
X-Google-Smtp-Source: ABdhPJy1zLFMhe8AbYLc8NTMbbNgEEQ6kmG1kK/asnweb1pYXbhiYSVYutrJzlEdz9dLGpymIRWzeQ==
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr314920pgu.162.1603421348926;
        Thu, 22 Oct 2020 19:49:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q24sm131443pfn.72.2020.10.22.19.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 19:49:08 -0700 (PDT)
Message-ID: <5f9244a4.1c69fb81.6244e.06f4@mx.google.com>
Date:   Thu, 22 Oct 2020 19:49:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-13195-g0281c5220c40
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 323 runs,
 3 regressions (v5.9-13195-g0281c5220c40)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 323 runs, 3 regressions (v5.9-13195-g0281c5220=
c40)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 1          =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =

panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-13195-g0281c5220c40/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-13195-g0281c5220c40
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0281c5220c40dd77262916430036b62e4a52e685 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/5f920f882b08bacee3e0ddaf

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-13195-=
g0281c5220c40/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-13195-=
g0281c5220c40/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f920f882b08bace=
e3e0ddb2
        failing since 1 day (last pass: v5.9-10224-g4054eebdfdd6, first fai=
l: v5.9-12353-gd3f7f27bb8d1)
        2 lines

    2020-10-22 23:00:16.402000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-22 23:00:16.402000+00:00  (user:khilman) is already connected
    2020-10-22 23:00:32.295000+00:00  =00
    2020-10-22 23:00:32.295000+00:00  =

    2020-10-22 23:00:32.296000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-22 23:00:32.296000+00:00  =

    2020-10-22 23:00:32.296000+00:00  DRAM:  948 MiB
    2020-10-22 23:00:32.311000+00:00  RPI 3 Model B (0xa02082)
    2020-10-22 23:00:32.399000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-22 23:00:32.430000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (384 line(s) more)  =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f92103d332344e86be0dd80

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-13195-=
g0281c5220c40/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-13195-=
g0281c5220c40/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f92103d332344e=
86be0dd84
        failing since 78 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-10-22 23:05:27.711000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-10-22 23:05:27.717000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-10-22 23:05:27.723000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-10-22 23:05:27.729000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-10-22 23:05:27.734000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-10-22 23:05:27.740000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-10-22 23:05:27.746000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-10-22 23:05:27.752000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-10-22 23:05:27.757000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-10-22 23:05:27.763000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 1          =


  Details:     https://kernelci.org/test/plan/id/5f920e88f70ebfaccce0dd89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-13195-=
g0281c5220c40/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-13195-=
g0281c5220c40/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f920e88f70ebfaccce0d=
d8a
        failing since 78 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =20
