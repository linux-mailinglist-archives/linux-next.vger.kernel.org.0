Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A5921EA22
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 09:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgGNHen (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 03:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNHen (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jul 2020 03:34:43 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E74C061755
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2020 00:34:43 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id s189so2181502pgc.13
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2020 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TQqdZJV06rYL08oSaYuXqwL6hI5hwGb9/Hu/NgvOmvw=;
        b=fct+f195rvUnHMIis10WbxGjRoU99Wyo0sJFMtULq3BfHy4/w66gAkXpaArCHfeObe
         4qZNgHGUH2eM3ps2MyicHwyMxQ9cSPBLjYKrwDuf3FDO/Ou1suDfHkk/JQFR4axsEUNZ
         UQLS20O1Wl2hT/4NBifDG+z6a+/msQjQ3+zHt6aoaivpzTpg6P8L1BqUljYnPEr3gY36
         AV8kmd3OLOj1nFPkhVPGFc6Osd78T+QXg+E6Gc1eEx8H8jF2J2l7AtXyv9Uq5IMYiWHx
         /oa5sMGml9HNidSlCwwMprrKvUlmOqqv6pARXTf00ZoPfYTMxCZd4Bg+MHKScyoO4/au
         Bagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TQqdZJV06rYL08oSaYuXqwL6hI5hwGb9/Hu/NgvOmvw=;
        b=N1RGzBRgUROx2bSy7yId4o5gMxd1NQzCR3b6AnIebqyhF29+3lcHXeihFnSJbNwaAO
         urR778J4wAbCof3fdqhi3f+3VamgziOr7vY2pJO4tOcIBrJxASULsUA8gXTywlLHLF8B
         RX7kFqikzm5aWpGfhc9tMgW+iUoHT8n3/klfdGPKCWKdwpErdm4slnUpO1yh8uFx+nj0
         qXxtIirH01uFloeAnqav2hmuQjLyk+CI9PMEHjBqTsufjDEwt5UVl1HlQWFpe+ebx1F6
         r84o8Gu7hPX20mdretUPvjOAFGdIoTUAtA1jVyaQr0fQnxJWhnuCG08tIenPWubsrYUG
         PquQ==
X-Gm-Message-State: AOAM5306KQWjYuQHDqutctvy31VJHSLXsSPKgDj/5zKYSct+2uwVC8S/
        k9tAQHQnnUxf7YUqo/idFazE1ZIazOk=
X-Google-Smtp-Source: ABdhPJzWFxr3hZ6jIaksLtAS2ONtG/zmRLJACOdHr8ivi6QpOti84B6JecWUKhCTuv2JvZKuNVhi9g==
X-Received: by 2002:a63:3e09:: with SMTP id l9mr2454567pga.235.1594712082332;
        Tue, 14 Jul 2020 00:34:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h6sm16547744pfo.123.2020.07.14.00.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 00:34:41 -0700 (PDT)
Message-ID: <5f0d6011.1c69fb81.5d2fc.90c5@mx.google.com>
Date:   Tue, 14 Jul 2020 00:34:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-214-g5ec74c90dca2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 199 runs,
 2 regressions (v5.8-rc5-214-g5ec74c90dca2)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 199 runs, 2 regressions (v5.8-rc5-214-g5ec74c9=
0dca2)

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
v5.8-rc5-214-g5ec74c90dca2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc5-214-g5ec74c90dca2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5ec74c90dca24f2d9abaae2527941b801070651c =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig       |=
 results
----------------------+-------+--------------+----------+-----------------+=
--------
at91-sama5d4_xplained | arm   | lab-baylibre | gcc-8    | sama5_defconfig |=
 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0d2c6acf8f76820a85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-21=
4-g5ec74c90dca2/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-21=
4-g5ec74c90dca2/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0d2c6acf8f76820a85b=
b19
      failing since 69 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab          | compiler | defconfig       |=
 results
----------------------+-------+--------------+----------+-----------------+=
--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig       |=
 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0d2f5529d21502eb85bb2e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-21=
4-g5ec74c90dca2/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-21=
4-g5ec74c90dca2/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0d2f5529d21502=
eb85bb31
      new failure (last pass: v5.8-rc4-597-gb8976598d3c1)
      1 lines =20
