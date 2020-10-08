Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9098A28722B
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 12:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgJHKCx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 06:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgJHKCx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 06:02:53 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3475BC061755
        for <linux-next@vger.kernel.org>; Thu,  8 Oct 2020 03:02:53 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q123so3591667pfb.0
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2020 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=O3wW13qVCivI2/hSiqpVnnvx24HSbfo2roQy6XzpGX8=;
        b=0uGfeE7w+3k2vm7RZO3dLc07RyukEzioFUB5DAPS5XKQBmTOunCa/OaK4ezzgTQk6J
         FcpuTdlKEwenVOAEuN8EXC59K4beLZZ6g5WFnqru7PvcMU29ME5BphI0GzAiUNlLTM0r
         /3spem+W7+xoAYgHY1yIfdSRVtng139NyyjiMy9nNMg64JM+zpfhYx/OHQNQw5hMydI5
         l/nf6awU/y2AfWOlAExBgpincdyTlNtDVftFejSaBFjcbgqHAbgZh7UnDiln83/o9PK8
         OxmBqhKzoMN7y5GEeG9Zjz2FLWzVwCmDqQva3cb+7fYg3jEImPKnDYOqCNYJiCfEv1+g
         isVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=O3wW13qVCivI2/hSiqpVnnvx24HSbfo2roQy6XzpGX8=;
        b=HizEytmrKIVf0YUJ95eCAfiuOz1kHiKv80VPV6y8tCcxAjtstBWMD8U93Jtj3WoCOy
         NaXs3o7i9QSnIdg+6N6D84DlwiT/L34BSg04xjUcH1IDd2Iti+pR6IxS8sfVD3RcXh+D
         +l/rY2qzhkV2wZ5sKHkvCaqPuGGk/Ow+MgxwnAs3I9bIXmj7C5LTmSWduR7ndg/G8Umw
         UUJn4h6+TzrUhFYh6Ri0ADGx5evCJ5ULjWGoO7nm/4EljXH+QvohCD1XWibtM3Z1HP58
         V68ItvRuy/GwHhiPxt5sBDQUvcKqz02srZDr5TLiEc+p2Lh2sAIJ0dygxjDMPgI4OAEM
         P2Mg==
X-Gm-Message-State: AOAM530XLPcBJnbqz7aNBydZCdliGTUU0XE/NRInzlEn8c7ioWQutug2
        8XXf5gFEmWfGFXdIEO3RPYHEzR7ecGOXCQ==
X-Google-Smtp-Source: ABdhPJwPa67JcmRPYC2vIZPEMeT/IWi7gd30NWfbm5dDGWhIN72zdVbcvXB5fGDdqCwobQAxgksj1A==
X-Received: by 2002:aa7:96f8:0:b029:152:94c0:7e5 with SMTP id i24-20020aa796f80000b029015294c007e5mr6779606pfq.76.1602151372326;
        Thu, 08 Oct 2020 03:02:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r8sm7783452pgn.30.2020.10.08.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 03:02:51 -0700 (PDT)
Message-ID: <5f7ee3cb.1c69fb81.b39cb.e265@mx.google.com>
Date:   Thu, 08 Oct 2020 03:02:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-323-g7af8fd03242c
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 241 runs,
 4 regressions (v5.9-rc8-323-g7af8fd03242c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 241 runs, 4 regressions (v5.9-rc8-323-g7af8fd0=
3242c)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc8-323-g7af8fd03242c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc8-323-g7af8fd03242c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7af8fd03242ce421e759461d50766830077b0316 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7ea52a0b86534d254ff3e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7ea52a0b86534d254ff=
3e5
      failing since 155 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7e7e438acba96b364ff3ee

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7e7e438acba96b=
364ff3f2
      failing since 6 days (last pass: v5.9-rc7-297-gd069a655f589, first fa=
il: v5.9-rc7-326-g64809246f17a)
      1 lines

    2020-10-08 02:47:32.303000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-08 02:47:32.303000  (user:khilman) is already connected
    2020-10-08 02:47:48.143000  =00
    2020-10-08 02:47:48.144000  =

    2020-10-08 02:47:48.144000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-08 02:47:48.145000  =

    2020-10-08 02:47:48.145000  DRAM:  948 MiB
    2020-10-08 02:47:48.159000  RPI 3 Model B (0xa02082)
    2020-10-08 02:47:48.246000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-08 02:47:48.279000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7ea34340228f80fe4ff3e1

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7ea34340228f8=
0fe4ff3e7
      failing since 64 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-08 05:27:25.812000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-08 05:27:25.817000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-08 05:27:25.823000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-08 05:27:25.828000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-08 05:27:25.834000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-08 05:27:25.840000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-08 05:27:25.846000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-08 05:27:25.852000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-08 05:27:25.858000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-08 05:27:25.863000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7eab1dc0450c18144ff3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-32=
3-g7af8fd03242c/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7eab1dc0450c18144ff=
3f2
      failing since 64 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
