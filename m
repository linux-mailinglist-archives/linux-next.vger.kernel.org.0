Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF42B2197C3
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 07:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgGIFSg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jul 2020 01:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgGIFSg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jul 2020 01:18:36 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D448FC061A0B
        for <linux-next@vger.kernel.org>; Wed,  8 Jul 2020 22:18:35 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x11so351351plo.7
        for <linux-next@vger.kernel.org>; Wed, 08 Jul 2020 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=L9vGl1Y97fmzmSl94DGEUGgkPJiKZVQ83le6d9jugjQ=;
        b=oZH2ye4ww8stv01c+0Zmuxd8NTRYf4T/w67HU8a4F2lU7SMx3gul3Av6SgfFCm/E7W
         SSBDF4XonRM5UfrJ+xaE2aZgkTLVUKVRPqVEkZnN+bBjv3snZX2XqnQPARzCYHg7yORF
         vujVLF7DzxwQ+ywgIZq0HrY5SMTPmMNXNE++fsTWLxVzwQ8B/sGRIm6R2I6TmSWRK10p
         FDJMNscmp1XsOv4oTQ+L8l27QmtWt9IqlwrOlSnVmqoYSpOQ81WsRly/ip7Ck4VsP2++
         CoFu9Gr/F6m36keOBPqjG0SQqFhglPQjsSnCquo8AymjoOZoo4mcvg/wbbq/ae85FedW
         HF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=L9vGl1Y97fmzmSl94DGEUGgkPJiKZVQ83le6d9jugjQ=;
        b=M3WKxrtBGpbaH/vkvcAn95rBT2qpHGNwfWb+uuH/oGZk7lmOhbOew1tWm5NTvF4Gfd
         Ng/t+OYeNCC/i3MLytPoPPeheLeab/QPazVcoHUGRyjPGkDmmSMDCFRL6zsTxsm+mG/F
         3bUvxMyiOM9dqVEMmv2Tdp7tYC+z/mWLbL5Ern2ODzfZ6RN7RL/XKkJ2V+z/N6rwVlbz
         AdzA+TTtFXjg4Gb8yEEvJQr2U6uC73R2rxDX2IHv2lgojXvwpAjKXohqZ8oZnftAHwOo
         3NhdTECedyoPeobWyPFNh7ZBraiRnSyCmK6vV8xwgsK08I3lWKIIIeZB90vVIE/PsnNS
         WN9A==
X-Gm-Message-State: AOAM530voQCe/KTKpk6Y26mOAIsKluViGx2wYj3Phyp4HVati3/1LTIj
        zHC298Ow90gRemvZuKioUabZwNoiflc=
X-Google-Smtp-Source: ABdhPJzOgwD87PvJmhbFPuRFwBHNlj1L1ygnc1iwps6DZ3cHyfVVcBzgP0imSr15YAoD0Mhol2VGWw==
X-Received: by 2002:a17:902:d392:: with SMTP id e18mr39881651pld.139.1594271914779;
        Wed, 08 Jul 2020 22:18:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e13sm1315754pfn.204.2020.07.08.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:18:34 -0700 (PDT)
Message-ID: <5f06a8aa.1c69fb81.a59b7.4b51@mx.google.com>
Date:   Wed, 08 Jul 2020 22:18:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc4-410-gf11279e61036
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 246 runs,
 6 regressions (v5.8-rc4-410-gf11279e61036)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 246 runs, 6 regressions (v5.8-rc4-410-gf11279e=
61036)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 4/5    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc4-410-gf11279e61036/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc4-410-gf11279e61036
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f11279e61036eebd990b3511aa83bf339ee97ea8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f066ca2bea674473a85bb1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f066ca2bea674473a85b=
b1f
      failing since 64 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f06733db22f35916185bb3a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f06733db22f359=
16185bb3f
      new failure (last pass: v5.8-rc4-328-g1432f824c2db)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f067562777095b5b785bb2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f067562777095b5b785b=
b2e
      new failure (last pass: v5.8-rc4-328-g1432f824c2db) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f066cb7bea674473a85bb33

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f066cb7bea67447=
3a85bb36
      failing since 10 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip       | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f066cc1bea674473a85bb46

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f066cc2bea67447=
3a85bb49
      failing since 10 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f066cc8358ccf555e85bb19

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-41=
0-gf11279e61036/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f066cc8358ccf55=
5e85bb1c
      failing since 10 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
