Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A96A1F86BD
	for <lists+linux-next@lfdr.de>; Sun, 14 Jun 2020 06:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgFNEmo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Jun 2020 00:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNEmn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Jun 2020 00:42:43 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17DBC03E96F
        for <linux-next@vger.kernel.org>; Sat, 13 Jun 2020 21:42:43 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n9so5443342plk.1
        for <linux-next@vger.kernel.org>; Sat, 13 Jun 2020 21:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VT3XEFsj1D7Qt/ORdzTZ2JXpU3Pp8ssxdj6kAN6vKec=;
        b=o4RUQytKmsjVvSF7zX77skO9shN/EOW5XhTjRYg2FdzjbXjocob3pWBncyGwwdThlR
         uaFzF4S33sch8h6REEFyCiaF5MgQtXkL09Ptawzy5iyVABq+3clUj2yH3nBxYkCyzL3H
         f7ZRjLKqT/5C0wu3EVZjUz982IQkcHlrfkORa6p3F0YrZluvHt+2SSFnwLqxZSyc/MLA
         1dIKBN8CQiDQMdkuB2m5NZMXDnF/RyiHUQipIXhtptr+X+Z4uzJS4nZQ86jttgBOM3+e
         tk2fr+/tgWtW91FmXUWc9Gy0rzLeHl+kavij3BfSUkUFX2tv4l1dAULh2lJIF4GY9DS3
         YTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VT3XEFsj1D7Qt/ORdzTZ2JXpU3Pp8ssxdj6kAN6vKec=;
        b=GR0qSVHwMb0kY8HnQBtNTA5wR1O954TRz/ob//BFN+dx3MJEzHcU71gy6zAPvkEcMp
         /njC//1LxN9NPIkoorEf2d2LHI398PDg7K18gyS+c/p4cymfl+xjg6mtiprpaWra+NCJ
         FMimeJcAA3kpIvngl/+HTBtPMu6JM53Ex7QyL3ETxEpVL/x2mq/mas5of9NYkh78eftq
         AokWOgMb3pKdLu74PC4NuuAqo4/hK0hiKCcyqi63/dVy3/dBP9dVdStVt7QyfAgHs8kv
         od+BaCL44JWV/cEXmFhds6r3PTrUqu5GkfQ4k/4T6phAiCjDU7T93nkEdB4phlEARWNG
         tDaw==
X-Gm-Message-State: AOAM531cTOJBMltHCHi+ThLmvm1yTKFeTDkTr6oIGvtjdRgpvg6Zrp82
        kt/FTlqoC3iPjp1LYTv8Z/hT4qDeG0o=
X-Google-Smtp-Source: ABdhPJxEiFwkr1bxSFXyd99yfRtvhHIrqIVbg5mNb4wwDX25gGYEnw2Pf0Klr1wxVI8XluV294f7Rg==
X-Received: by 2002:a17:902:b28a:: with SMTP id u10mr17102535plr.178.1592109762417;
        Sat, 13 Jun 2020 21:42:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i67sm10083839pfb.82.2020.06.13.21.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 21:42:41 -0700 (PDT)
Message-ID: <5ee5aac1.1c69fb81.fc31e.5a54@mx.google.com>
Date:   Sat, 13 Jun 2020 21:42:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-15164-g875d8f7462d6
Subject: next/pending-fixes baseline: 155 runs,
 5 regressions (v5.7-15164-g875d8f7462d6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 155 runs, 5 regressions (v5.7-15164-g875d8f746=
2d6)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 0/1    =

at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 4/5    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-15164-g875d8f7462d6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-15164-g875d8f7462d6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      875d8f7462d6423f7230a87d5fded6bf90a991fe =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee574e6bbfe5f398f97bf2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee574e6bbfe5f398f97b=
f2b
      failing since 0 day (last pass: v5.7-14137-g60392f4b277d, first fail:=
 v5.7-14706-g24b012885d29) =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee577a2dbcec29f4197bf0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee577a2dbcec29f4197b=
f0f
      failing since 1 day (last pass: v5.7-14137-g60392f4b277d, first fail:=
 v5.7-14413-gf19136b39e47) =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee57428b3edd76d3b97bf21

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee57428b3edd76d=
3b97bf24
      new failure (last pass: v5.7-14706-g24b012885d29)
      1 lines =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee57a3957f955a41697bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee57a3957f955a4=
1697bf0c
      failing since 0 day (last pass: v5.7-14413-gf19136b39e47, first fail:=
 v5.7-14706-g24b012885d29)
      2 lines =



platform                 | arch  | lab          | compiler | defconfig     =
               | results
-------------------------+-------+--------------+----------+---------------=
---------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee57840271473bb4397bf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-15164-=
g875d8f7462d6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee57840271473bb4397b=
f0b
      new failure (last pass: v5.7-14413-gf19136b39e47) =20
