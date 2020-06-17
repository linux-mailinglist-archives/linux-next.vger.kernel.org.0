Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D4F1FC4F5
	for <lists+linux-next@lfdr.de>; Wed, 17 Jun 2020 06:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgFQEBB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 00:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgFQEBA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 00:01:00 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EE2C061573
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2020 21:01:00 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s135so628165pgs.2
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2020 21:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SQ6lUYDCUa/yNyUqLL8tKG2wtQ5B6YPkATH9FhnXUK0=;
        b=F/tLPoKwBHtb9/mhcQ7Afr6/coBTckkI7rHZdM52ndWcyM71eBgTp3w9bXgqelrxJ4
         VlgyQbMKsCHz6XZOw4uFMqIbly6pAaqY6cLv7u+dIQjF926d0A8SKvNV1EZf9206MvDi
         Xz+YAytrPr0+xhOxJsNu9CYg1AfLZEzliXDNtv/mKb0pidpmLzwIQkegSkH+CSEv1KGm
         VYP8YSVtH8mbFv3iFzMJp591vFHQuwD3rvO/moMjWK0i0tJzR1ndbRHX7XVefF1payeo
         nhQTjraoqc2w0Hbrr7zP8LfE3wJfyCU5RBAel7FqJPmWobVjvHDvSWwmr3kEtXX3wWd8
         Kqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SQ6lUYDCUa/yNyUqLL8tKG2wtQ5B6YPkATH9FhnXUK0=;
        b=uIQWrPKY/+n3sgMfxzyj+OculK0ayP6lUDo9EkzlRuj5zhbNxrUODv2P3IuZ1yP+1c
         y6UeapMARw3QBDSQuiKpYdg9Crh2+/qMWNyXmcVT5zYSu3koY+rApYZgsN+1UV2s4tQi
         S/3kjK4liecWks/5EcXPCXMz820z4gSCpG2TPh6FIvRJp2MvllVmXJF9xafSFYskE0AL
         nOY1l865QljzpLnGna+OEDZejOEMR2SU0tjqU6bsZwja++hCTo9ur4F3Mv0I/C+OqVVs
         api3c1mK3rb7L66Ybfp2akpvajhXhMGlK2nkfvQz6QN/U5pHD8MAf5t+qqzYwW8QeZFr
         T0mQ==
X-Gm-Message-State: AOAM533FR51XCEbDhylejrQlJXbsox6Bt75812g6jMDUUlM9WglmPid5
        tcUP6uowXdUNWIQY8lXEUcvciXy/w0M=
X-Google-Smtp-Source: ABdhPJw5LpWjAM8JzX4+WpaPAIP1RYxjchn0xFbXsJ7coEArm2R12h8COooSZ7RJJHrpI1pvZtOV9Q==
X-Received: by 2002:a63:214e:: with SMTP id s14mr4614861pgm.20.1592366458378;
        Tue, 16 Jun 2020 21:00:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b1sm3910573pjc.33.2020.06.16.21.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 21:00:57 -0700 (PDT)
Message-ID: <5ee99579.1c69fb81.d5e14.b771@mx.google.com>
Date:   Tue, 16 Jun 2020 21:00:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc1-231-gbf332658aac2
Subject: next/pending-fixes baseline: 95 runs,
 2 regressions (v5.8-rc1-231-gbf332658aac2)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 95 runs, 2 regressions (v5.8-rc1-231-gbf332658=
aac2)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig       |=
 results
----------------------+-------+--------------+----------+-----------------+=
--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig |=
 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig       |=
 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc1-231-gbf332658aac2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc1-231-gbf332658aac2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bf332658aac21c73969216e8858c7b647be1b208 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig       |=
 results
----------------------+-------+--------------+----------+-----------------+=
--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig |=
 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee95fdadc350964f597bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-23=
1-gbf332658aac2/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-23=
1-gbf332658aac2/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee95fdadc350964f597b=
f11
      failing since 42 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab          | compiler | defconfig       |=
 results
----------------------+-------+--------------+----------+-----------------+=
--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig       |=
 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee96105139db7511497bf0c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-23=
1-gbf332658aac2/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-23=
1-gbf332658aac2/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee96105139db751=
1497bf0f
      failing since 0 day (last pass: v5.8-rc1-88-ga69361f43850, first fail=
: v5.8-rc1-168-gd1a574997c4e)
      1 lines =20
