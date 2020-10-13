Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F6E28C7BD
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 06:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbgJMEIT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 00:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgJMEIT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 00:08:19 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E5BC0613D0
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 21:08:19 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id r10so16599672pgb.10
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 21:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ek7D7aMgL+ZAVs0RkQ3iGbQIB+62taLA3yWjnJjd4vE=;
        b=l+zySyRvVj7PhUOCprzOAD4kK12RWuyaTY0eVCeMlLRbBmgDybFa4cEjj3XZr0K+Pt
         8IHXjVt/4iNA4ZWKTlwic61agapoFveQhCQZa9DtUPNY84k7b/YO1KrLjHXeFZj+l/1Z
         C2BpHmLC5Pm6LEY03Rjfqdia0dKbzcp0s4znFCdGWVNcOP65CL/m/hHaKmtLUHomG5OB
         7yT3RbzNkOMqnwkJTHsgaYvnqQ0RcBJXtE2JQx3f1EzK5c8rnkFZkQoj92BOBTU+aBmW
         kCCnQBer1FDIUlH20sPPWY70NNofRFJx/17HXWiG+issEFnU2+yUeZtN8NeeTDBweYMQ
         70Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ek7D7aMgL+ZAVs0RkQ3iGbQIB+62taLA3yWjnJjd4vE=;
        b=g5w7/hgv2VP/ruEH4Gw7UPEozVTVHjVjKZRUqFRncOer1B+/5/Q9DWXvNIcqVrdsKU
         JfClxy2uXwuimYtw5bSDbhI2xMIoQi0YuWGaULRnJ6qPTgQEjPUjLUtGjqUrD5aTJ0R+
         E0SpE7gZE8SdRdM4DtySyL79xTfIg+urMxqUr77kTXFt9RWYXYKgFowoPAEGfyI00Jwo
         ECY4Ll0bBH9QTvm2Gm9s9GGXQgGS3Dy5HJgNC4FNRCosjOZiCb8yICarQE1Q0sfEnD8t
         znfm/RbGOMYd2nW4/O71aRa9abddKYhRyx952roYgZZ2HxiVyOAye37E2ABXUK9t/rF7
         ZQaA==
X-Gm-Message-State: AOAM530bo8aAOFaJ1cT44Fm+fvHATnV3dXC8oUkRI3FWuxH60Y4c3omm
        ivj9Rp7bJ4Ns2wCuBZye5EF2XCUWxVL+pQ==
X-Google-Smtp-Source: ABdhPJw/sq43XOmX7+oE5j6yoRzbx2etXuZIrYkjBDoIWzOiWQzb43vw06O+dD0AhDTd9n3gn9BdLw==
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr15431073pgu.162.1602562099006;
        Mon, 12 Oct 2020 21:08:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gd14sm25447934pjb.31.2020.10.12.21.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 21:08:18 -0700 (PDT)
Message-ID: <5f852832.1c69fb81.22e00.2a66@mx.google.com>
Date:   Mon, 12 Oct 2020 21:08:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201012
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 175 runs, 3 regressions (next-20201012)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 175 runs, 3 regressions (next-20201012)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
    | results
----------------------+-------+---------------+----------+-----------------=
----+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
    | 0/1    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
    | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201012/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201012
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      148fdf990dee4efd23c1114811b205de9c966680 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
    | results
----------------------+-------+---------------+----------+-----------------=
----+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f84ebfd5edae393f44ff425

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201012/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201012/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f84ebfd5edae393f44ff=
426
      failing since 167 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
    | results
----------------------+-------+---------------+----------+-----------------=
----+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f84f35637d771a4db4ff3f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201012/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201012/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f84f35637d771a4db4ff=
3fa
      failing since 33 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
    | results
----------------------+-------+---------------+----------+-----------------=
----+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f84ec3eda0c9799794ff3ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201012/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201012/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f84ec3eda0c9799794ff=
3ef
      failing since 82 days (last pass: next-20200706, first fail: next-202=
00721)  =20
