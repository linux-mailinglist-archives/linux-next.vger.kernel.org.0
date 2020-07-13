Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5599421E160
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 22:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGMU1b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 16:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgGMU1b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 16:27:31 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A03C061755
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 13:27:31 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a14so6542592pfi.2
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 13:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PQj0dGxU8PrlNNyGb6Eq0+VjQ/Q+UlV4qlmgSBNhilU=;
        b=1CBQxAY0GLCft5ruOzCC4F22MU0ISYOaa5jdLxhrpocPQrua6P1UXLV+ERuOyZfEDq
         9zcYRqAYLkjkfC+uIFeCteeeiP5wYRKV1Bki4lXp1hONp5X4BvbjFD9bSjSQH4QwfD1s
         RfbVBRhYtQfgyprsZ6IwIbpnmxz0PXhQHIVxFfdAf4kZQDmaBnz145uJMWO82Vm/B97X
         zwlwnE1sstFiqFnfGLuwJy8qQFcjkSC8cmu27SKLxrTyXekK/8lSSFkP6Az8/4NiENCW
         oJlre14OxSx7DX/mBVsBQuDNWzVynhDILqn/A6YRCx0idhQs0SZsUOLbh6w4dusj4Nfi
         p1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PQj0dGxU8PrlNNyGb6Eq0+VjQ/Q+UlV4qlmgSBNhilU=;
        b=BA4mSLDqUT6y3K9rkD/tvI0yqTeDePsWOKA08OILi/8KgCw8k6oh6qyT4CX5IgCCMl
         U3DyZ+kRp8GxrplzsUPvqgI6b2MmKIf5tds6ZsMLslWNewFe7g/Z6Hp1AvaPOh3mCFsl
         Pc8KZV+ws5/ikwP7d2171FYgydOvwORP4F4qUjIAztW3mYCtehy/zeqkaJ6qVIkITCX6
         tsjtkGm6sXxxgKLV9e/l/UFWksxMbfq/nyqsZ8ojKXtL54SPZcTQ7BXmcJJk5zb2dsFl
         GTX7Ewd9D8PHp7zWoFKFY1ffIUL0qihi4XdF+AQGB4jcW/b/MZvfh1oMrIWy1az4sFzt
         8jpQ==
X-Gm-Message-State: AOAM533ivHelCuLIL1DoAozqxWYmU08G6WXCTFy9aNGh8FPuz3HSElf1
        zZWXQHhNGums/FMfVOwASDvw6wPFsdc=
X-Google-Smtp-Source: ABdhPJwhl8S1S34/yswCMBk63sBa0WZsn/D7sJ/59arlryGwtaUezWuE5l61uEJFVOGcFd5D5S6Z1A==
X-Received: by 2002:a62:be04:: with SMTP id l4mr1331724pff.323.1594672049812;
        Mon, 13 Jul 2020 13:27:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 73sm15415515pfy.24.2020.07.13.13.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 13:27:29 -0700 (PDT)
Message-ID: <5f0cc3b1.1c69fb81.b3ce.4dda@mx.google.com>
Date:   Mon, 13 Jul 2020 13:27:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200713
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 114 runs, 3 regressions (next-20200713)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 114 runs, 3 regressions (next-20200713)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-8    | sama5_defconfig   =
 | 0/1    =

vexpress-v2p-ca15-tc1 | arm  | lab-baylibre | gcc-8    | vexpress_defconfig=
 | 3/5    =

vexpress-v2p-ca15-tc1 | arm  | lab-cip      | gcc-8    | vexpress_defconfig=
 | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200713/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200713
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      be978f8feb1d4678b941a3ccf181eea1039110e2 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-8    | sama5_defconfig   =
 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0c8ad6ad879494ff85bb23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200713/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200713/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0c8ad6ad879494ff85b=
b24
      failing since 76 days (last pass: next-20200424, first fail: next-202=
00428) =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
vexpress-v2p-ca15-tc1 | arm  | lab-baylibre | gcc-8    | vexpress_defconfig=
 | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0c8d0f1bb442d2b085bb21

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200713/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200713/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0c8d0f1bb442d2=
b085bb24
      failing since 37 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
vexpress-v2p-ca15-tc1 | arm  | lab-cip      | gcc-8    | vexpress_defconfig=
 | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0c8c1e78e15ae45c85bb31

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200713/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200713/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0c8c1e78e15ae4=
5c85bb34
      failing since 37 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
