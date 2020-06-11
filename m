Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC6A1F6692
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 13:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgFKLYj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 07:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgFKLYj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2020 07:24:39 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226C9C08C5C1
        for <linux-next@vger.kernel.org>; Thu, 11 Jun 2020 04:24:39 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id bh7so2210450plb.11
        for <linux-next@vger.kernel.org>; Thu, 11 Jun 2020 04:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6lD9BU/M5PB1agnkk3iQNzTQvMH+X0Z/OOcc1a/6ZOA=;
        b=UyO0KVLU+IDW0W0gimV4eK9vg1HRTkCv9vUYbzGIZPlJ0NnMtbwOlq0YIvKZRV/VI2
         Y4NxYw0FkffI0FqM1zTJTQe5/0B7OKMbJCVTWaxr2uBgMo/gneN9FMuvQWdvGMlpwsLp
         IRHO8QpAkAfuN8Z4HtU5Y/yC52Ym0d/u7jZkN6gJpzzPPE4s9QkPeeqA3u6pgOCRIOMy
         jRt+sjyfEoOlpIq8gGIAVy/+39NiiyvnqOu61XNDHu7NU/NU/yR4sTMZK4OfJ/VXrUta
         3haWHGK1tzLhWqmPs+7kLQt9+ohvJOIOD3Qf3PnbTA3piNxpUsMHLLTAUgjAz2FDjxJF
         S/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6lD9BU/M5PB1agnkk3iQNzTQvMH+X0Z/OOcc1a/6ZOA=;
        b=CPBsJMNz26l4IxDdOJ8SPB21LhmZoQNvzjP9KBfC8+ylw9CeXh6rzO1NiFABtzG7gz
         eA0HQFDUFrEh7Xik3HWV81axFbsdys08YPw7T3CGGpGrjqyD4FYGCCCf0kvQRRgHX3UW
         GSdfWDX+35Saw/l6TRt+UeQ1veh55N4Q17w7t2ENUb5Bhp0EBHgaGBlS+IV0t7phefww
         oTh9+bWNNZ7+eDXDjwQwMI6sxc5tpR5czVKT2qJGZxHeoKqozZF0ZCn/wW91MLr+iop0
         puiqci94S1AXuFvyRd72xqWC0WhHJXGLntrblGX39EuI3B/vD5nXyz81FUUAbDb3WUTu
         HGBQ==
X-Gm-Message-State: AOAM530m60r7lIequNYGdvK2dugya89oQ03zhYZFYRzONsP1EY5hIOw2
        iehPRKrBEMR6Uea7FB0i42hFvgvLviw=
X-Google-Smtp-Source: ABdhPJwJWfV8KgTmE8y+k1r/0fcOQNFexJ6aziWgQNE++ZuNk6d0aWkdLZU+WOUk4koCHlRvB1hMpQ==
X-Received: by 2002:a17:902:7408:: with SMTP id g8mr6395367pll.143.1591874678291;
        Thu, 11 Jun 2020 04:24:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm2909883pfi.71.2020.06.11.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 04:24:37 -0700 (PDT)
Message-ID: <5ee21475.1c69fb81.4cc13.857e@mx.google.com>
Date:   Thu, 11 Jun 2020 04:24:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200611
Subject: next/master baseline: 118 runs, 3 regressions (next-20200611)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 118 runs, 3 regressions (next-20200611)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
            | 4/5    =

meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200611/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200611
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      192e08e14e37b78e83cc2f5b9eb5a15a7d71c4e2 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee1cab38a1b7b534d97bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200611/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200611/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee1cab38a1b7b53=
4d97bf0c
      failing since 1 day (last pass: next-20200608, first fail: next-20200=
609)
      3 lines =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
            | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee1d4263d8c973a3797bf31

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200611/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200611/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee1d4263d8c973a=
3797bf34
      new failure (last pass: next-20200610)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre | gcc-8    | defconfig+CON...B=
IG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee1cfc85dc875964597bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200611/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200611/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee1cfc85dc875964597b=
f0a
      new failure (last pass: next-20200610) =20
