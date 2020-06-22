Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B33F203506
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 12:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgFVKpK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 06:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbgFVKpK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 06:45:10 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6845FC061794
        for <linux-next@vger.kernel.org>; Mon, 22 Jun 2020 03:45:10 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ne5so7970856pjb.5
        for <linux-next@vger.kernel.org>; Mon, 22 Jun 2020 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nSoCi6RoEztgLDg1nv1/8IRtbbz4H+0OsNSoV+eugxY=;
        b=iPnKz6a6OEZLTRysdRiCfPOhm6GZ8/g57NvvJ1QvnB29gvWn5Mi10cm+bk9a4O7Rxu
         tsIXrDDaGYL/gabxK5MS1b7fO3zW4N+bqEKuqjjy+rZ32x+x7dL0bGihsqYLl2qCW/VS
         4rjHXZcgm1b7N8K4Rh2pIhYc1yiv+5HHX76q880lnjQtWVGNF04zdxLxPDkoTSfwuWbI
         U0i5ZY8/CCrJs5x5waVmNyz+aEpBkFai+NTwZC1Lyakwsr6+lHMYAGho/xSHKDzdoq9y
         0pDSNTtR3gR/BMcHtNGJ4mW/YABvPDhFPKFLVZpgCQmvTjWeLCcyUT261gy0yRCKRsp8
         TQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nSoCi6RoEztgLDg1nv1/8IRtbbz4H+0OsNSoV+eugxY=;
        b=Sxz1c/yuS3FsBwg9j3fiifFQsl+6GsBXUjKDPrC/E7FlNEHwZw/WPXiYIPh0KYMlmC
         92T96DaSoJSqeFqqTrp4upqhJxNWZyB36xj4IK3bo9XH3VStSvMHyXgitvxrkQIlmdhN
         CIPtnZadcFqqILCHJjCisAltoDID6ASTC/qd+smMt7nP8J+XrKhT5DdaEt6zrAPCvfRS
         rEWlv8QYNMn6nkHrILA+iZF/OL02i0MzxcmOCKntNOJf/qfgtHdvyX+eTZCpPIH2ZiXr
         OlhiH1k54mqJoyzCj5q93+VNp45EQbueCQihWXehe+FwlVIpVGOAqoPeKHyKPBBVLdoo
         tnjA==
X-Gm-Message-State: AOAM533GOEzVwswQ1UA+aAL6uvaC7LcCl47KO+3lDOiceLLROU+lQXoM
        pZURgzLXnFx6bSyu4pS7ssdaaFD+cX0=
X-Google-Smtp-Source: ABdhPJzTuTR4ol+20YeKDXGh8BNaQDwyTriJrPXiiS+jxgDUPSpJw6dBUV8zbiFSIHpa0efTRNQ7vg==
X-Received: by 2002:a17:90a:7446:: with SMTP id o6mr18102287pjk.217.1592822709567;
        Mon, 22 Jun 2020 03:45:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ca6sm13987313pjb.46.2020.06.22.03.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:45:08 -0700 (PDT)
Message-ID: <5ef08bb4.1c69fb81.75301.9d3f@mx.google.com>
Date:   Mon, 22 Jun 2020 03:45:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200622
Subject: next/master baseline: 114 runs, 2 regressions (next-20200622)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 114 runs, 2 regressions (next-20200622)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
  | 4/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-baylibre | gcc-8    | vexpress_defconfi=
g | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200622/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200622
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      27f11fea33608cbd321a97cbecfa2ef97dcc1821 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef051fdbe355d5fd397bf31

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200622/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200622/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef051fdbe355d5f=
d397bf34
      failing since 0 day (last pass: next-20200618, first fail: next-20200=
621)
      1 lines =



platform              | arch  | lab          | compiler | defconfig        =
  | results
----------------------+-------+--------------+----------+------------------=
--+--------
vexpress-v2p-ca15-tc1 | arm   | lab-baylibre | gcc-8    | vexpress_defconfi=
g | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef05036a8a2efcdc497bf1a

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200622/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200622/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef05036a8a2efcd=
c497bf1d
      failing since 16 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
