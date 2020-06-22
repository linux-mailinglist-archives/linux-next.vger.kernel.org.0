Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA3F202EF5
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 06:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgFVEH1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 00:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgFVEH1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 00:07:27 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10134C061794
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 21:07:27 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p3so4900291pgh.3
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 21:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kv+mqBsydv5LasVjNwQkqqhY90HId7gsShtkIU9OGYU=;
        b=NacDXM8oQnHUblRUivzu6F7qx1f7ir1f2cQnFx9MaAk9VyLsqqIg274ott7zzlMTi6
         CD/wPrz4zt5j+OsDrCUUeyffzpvQ6ZqOiMkyoVnLiLeIZRWKPrmDl69dSxHMVvdugrOY
         VoShmWmwh2v1mC2u6li0TzDSG6F+vDg+lUIrGqb8KawB3nQtjjn3WSIWW+WNFaU2L2U5
         v3Ui2sUBoA+7uloD0BdyhbGolaSDV79uuR+BpC9vqseq/pD03eF5Rk8Xz68xvvHYT0LR
         GNyZU9KigMuHv6xuAH2M0U87u04uK5TAHh4Q0bK6XH4dAHMB5KXKDx9GjnyUxhl5p8K2
         rrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kv+mqBsydv5LasVjNwQkqqhY90HId7gsShtkIU9OGYU=;
        b=rH61G1JJE8bop245BQi9zHiKPuiJ4D3v3zdZFzgs+W97RdAl8BYmEO/MnECd9ajmFF
         qhYD0txbzAjm0df6xpQK7pwdeu8N0ZAB6TSnE0btJZR1He3Ad6ATOwrFeC5LhHsMInLl
         w62c2ZoJuMLIbbEEEB53IuYKdaAjExej3dwxVxu/3n9pB/4lbNyE1KW7OHI3OZmzgS9L
         sd75BYgdmAlaA3ZdJwZyzfxPCenXiJOdcgPEzHu+UHrvo+FRj4fb9Evu6f3cxxtrZOZ3
         JOg7M3VXdr74B3Eo2mdCUULhPXeZPHcAeQTWswr4yb6CuhkY5YeeuzuuG1XpD9Ean00Z
         varg==
X-Gm-Message-State: AOAM530Z4LHHLtshV+gupSft9qYu/r18j2q9UZINtZwxnK0qqiPZozT+
        ezSEL8i+K2BO6xALtpKlp5gDyzHbh5E=
X-Google-Smtp-Source: ABdhPJyJxKewC0l3yFWEQzTeGxpfg6UBHAl7LKDyKgNTIOr1pqToRtidrJF/Yb84Y8+yFyQl6eLK4w==
X-Received: by 2002:aa7:87d3:: with SMTP id i19mr18101798pfo.203.1592798845328;
        Sun, 21 Jun 2020 21:07:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gm11sm11933947pjb.9.2020.06.21.21.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 21:07:24 -0700 (PDT)
Message-ID: <5ef02e7c.1c69fb81.727a2.5eb8@mx.google.com>
Date:   Sun, 21 Jun 2020 21:07:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc1-586-ga2825885ceeb
Subject: next/pending-fixes baseline: 98 runs,
 3 regressions (v5.8-rc1-586-ga2825885ceeb)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 98 runs, 3 regressions (v5.8-rc1-586-ga2825885=
ceeb)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig  =
            | 0/1    =

bcm2837-rpi-3-b       | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig=
            | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc1-586-ga2825885ceeb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc1-586-ga2825885ceeb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a2825885ceeb92181ef6b3dfdbfd2fe671dbc1f4 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeff763e872edbfeb97bf11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-58=
6-ga2825885ceeb/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-58=
6-ga2825885ceeb/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeff763e872edbfeb97b=
f12
      failing since 47 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm   | lab-baylibre | gcc-8    | bcm2835_defconfig=
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeff3b7358edbabcf97bf14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-58=
6-ga2825885ceeb/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-58=
6-ga2825885ceeb/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeff3b7358edbabcf97b=
f15
      new failure (last pass: v5.8-rc1-559-g6de53dcd5c17) =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eeffb96e9d6fb6d6e97bf22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-58=
6-ga2825885ceeb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-58=
6-ga2825885ceeb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eeffb96e9d6fb6d=
6e97bf25
      failing since 3 days (last pass: v5.8-rc1-231-gbf332658aac2, first fa=
il: v5.8-rc1-339-g3b15f0074015)
      2 lines =20
