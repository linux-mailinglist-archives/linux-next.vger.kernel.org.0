Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495B11F8173
	for <lists+linux-next@lfdr.de>; Sat, 13 Jun 2020 09:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgFMHAW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 13 Jun 2020 03:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgFMHAP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 13 Jun 2020 03:00:15 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D91C03E96F
        for <linux-next@vger.kernel.org>; Sat, 13 Jun 2020 00:00:12 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id h95so4803829pje.4
        for <linux-next@vger.kernel.org>; Sat, 13 Jun 2020 00:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IaFbUufDasaVfTNn/sN4pMoL/jUeqeTPE4GBO0iKsDQ=;
        b=rAq7wRbetdM7Egq9dvY6sbgKGsdbC+0voqVaLUZb3Lwtb7K4Vs5Ul8yuAV7SvKcR7k
         4p8EipptbiXV7h4ul1cX4l3YTZ7LiaDKXMJA3mvdcPdwNUmt4uMMdClL/0te639ST6vj
         ZZiGBxRAsow42ywa4OTH6zmOEf15i+rp2ArNO64y5CgkzqnR8+BPw05j3E7vWWDnr2nT
         GGhbRPwZbRZOZvSrYiLFbVdSjI/01vrXHgvg1GQ2iTSorGwPXSJhVdDAU4Ronnydhh1N
         tsDFjUCUY5qA1cN38GkNhgTvZPg1U17q2iqmPIp/cCUqMUkYoopTIX8DCeVA18jfmnvX
         fzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IaFbUufDasaVfTNn/sN4pMoL/jUeqeTPE4GBO0iKsDQ=;
        b=G68ItR/iGZFsW0oLQR9PCzIJ3phFGDwSmgfisCI0jVktAHqSThWm9tme6KxcWouaji
         TDTLMMFPRiWHspu4I9JZFHOnzo/0PJ7wi2A6Y+erT0IJHgSTj8NMS2RnweUiu1hjuHI5
         VCHBCBW5FPKaDVPeoEwexMPUknApq606CQyMO/+B6zH6fd6Sn/twM+Wsj28jkm6Osr7N
         zQq/k5YKHLSSHKp4zPys0liGWjrqgoeQSECSnTE2clwujB+ULy9RCQKXk/pT7bby4nWm
         ZXP2srPaZZRFlZ15hWvsMv+KdJTv83I0q78Xson8lg+vMLSb7IBie8ZBO0jx2FroN2Al
         0OxA==
X-Gm-Message-State: AOAM531OgVJB+yFaqMTgpDAT2jBpKjKlBUqanwdyYl5pkWN1RCyTi7CS
        PBzV86qHnNY+jDfXdN90EhzPzwgk0bY=
X-Google-Smtp-Source: ABdhPJySWo/FGnoygMAO3Fkw2fTK6lF1gzuCIMVOya28HwsHeYX5rt+PXfV878dS10ZoG8jpokwjEw==
X-Received: by 2002:a17:90a:ae11:: with SMTP id t17mr2524945pjq.157.1592031611477;
        Sat, 13 Jun 2020 00:00:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z1sm2191218pfn.178.2020.06.13.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 00:00:10 -0700 (PDT)
Message-ID: <5ee4797a.1c69fb81.58e81.93db@mx.google.com>
Date:   Sat, 13 Jun 2020 00:00:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-14706-g24b012885d29
Subject: next/pending-fixes baseline: 167 runs,
 3 regressions (v5.7-14706-g24b012885d29)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 167 runs, 3 regressions (v5.7-14706-g24b012885=
d29)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-14706-g24b012885d29/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-14706-g24b012885d29
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      24b012885d29e4417cbbe62ebc2f4675099bb362 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee4450ed02dabf00697bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14706-=
g24b012885d29/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14706-=
g24b012885d29/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee4450ed02dabf00697b=
f0a
      new failure (last pass: v5.7-14137-g60392f4b277d) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee444421e8757a64a97bf10

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14706-=
g24b012885d29/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14706-=
g24b012885d29/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee444421e8757a6=
4a97bf13
      new failure (last pass: v5.7-14413-gf19136b39e47)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee446719d20c100c197bf60

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14706-=
g24b012885d29/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14706-=
g24b012885d29/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee446719d20c10=
0c197bf65
      new failure (last pass: v5.7-14413-gf19136b39e47)
      2 lines =20
