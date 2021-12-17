Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86AD74785A5
	for <lists+linux-next@lfdr.de>; Fri, 17 Dec 2021 08:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhLQHje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Dec 2021 02:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhLQHje (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Dec 2021 02:39:34 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212EEC061574
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 23:39:34 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so1928944pjb.1
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 23:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ig7ZjxrV34VwT/1cGdgO3QHZInKWAhnwWYfHbsaEpc8=;
        b=w8zqlUY30LuDp4ea2ZMdPZ7Mk2QD2RJBFf6blEd4YJ7syzq4Atta0bv0oLBXjuG4Q6
         9IS7bfjkC9kIGUj8RGVLhcaDoSwlCTjHuUWvZS71JvjSRXH5Tbvp4CAMWnTBNPZOJg6A
         DANZPJRHJsMmD1T1dcqsU9c6+6/mIPu+cgf++guJb60E8G63SGZpv7z0P44rzUMvZSAA
         TFdY8gHQ31lycDMb9cBJWo9VIg5hc1pxXdM4DUe9yRdlYyuKNFaw22uEYgnhIb+ZdZ/q
         p2Nr1uxlu/hiO3WQTOUMnw14p8NaSrMQI6G0cEJ4STyTWjVQxC1EHLRpM4XLOPemMuoR
         4aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ig7ZjxrV34VwT/1cGdgO3QHZInKWAhnwWYfHbsaEpc8=;
        b=t/tXYZiFyOeGiGjI01kDGb4UxXlQ0OakTPnxqRKGyzVRwIIGmi+dCD1QIvmLabdEyG
         vQYUpMixsENEyaWdcRPHsRMS2t6Tn9SmfWT/8TAfjK3oDZV05jxxxYJrMI4KAYLg91W5
         bG4Hd6P5AzNnoIyhDzYnn6Mfq746YtHKp61QDNQMVfJeQTl9sAgnTqZUvO3HxnZ7Z8IB
         TY3h/exI4Sv7TXQQtLRZ+5Q9+1XjNH5xcHqHbDKkdoeuM1VA2C7Tlx+h5Zc7q5H7Ca7y
         rztEr+ZA1HdAWbmsDVRtTszWLgmokQdnrPFwuR+aSUVwl/yhu6pZjMEEGWlEoCICJDbf
         jwEA==
X-Gm-Message-State: AOAM533XtBIBrjLmvRn0aXHiLcof0mf+pSpZe9zvPGYf0tg2xtSkdQLC
        DWCyYtmsbABc3KHJWWrefQR2vx9JqG4aZOyc
X-Google-Smtp-Source: ABdhPJwoU7MtZ23AG+6f+JfQtOWMrBRoU8Xk3SgxY1fzWw9UwIeYCFaVrZdbBJbEqBaOgoQ9Wv+Yyg==
X-Received: by 2002:a17:90b:3e85:: with SMTP id rj5mr10745054pjb.172.1639726773256;
        Thu, 16 Dec 2021 23:39:33 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y12sm7957890pfe.140.2021.12.16.23.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 23:39:32 -0800 (PST)
Message-ID: <61bc3eb4.1c69fb81.127e3.7b9f@mx.google.com>
Date:   Thu, 16 Dec 2021 23:39:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-257-g713f2fcb90ea
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 572 runs,
 3 regressions (v5.16-rc5-257-g713f2fcb90ea)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 572 runs, 3 regressions (v5.16-rc5-257-g713f2f=
cb90ea)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc5-257-g713f2fcb90ea/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc5-257-g713f2fcb90ea
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      713f2fcb90ea0dcc5b638743af7df162cd56ca9a =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc12646cc846aaf539711f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
57-g713f2fcb90ea/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
57-g713f2fcb90ea/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc12646cc846aaf5397=
120
        failing since 37 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc1e3bfd6762254739712e

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
57-g713f2fcb90ea/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
57-g713f2fcb90ea/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61bc1e3bfd67622=
547397133
        new failure (last pass: v5.16-rc5-221-g69b486b26c17)
        2 lines

    2021-12-17T05:20:40.551210  kern  :emerg : reboot: HARDWARE P<8>[   15.=
619084] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dli=
nes MEASUREMENT=3D2>
    2021-12-17T05:20:40.552551  ROTECTION shu<8>[   15.627554] <LAVA_SIGNAL=
_ENDRUN 0_dmesg 1271922_1.5.2.4.1>
    2021-12-17T05:20:40.553708  tdown (Temperature too high)
    2021-12-17T05:20:40.554800  + set +x   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc04eff73a10df5b397126

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
57-g713f2fcb90ea/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc5-2=
57-g713f2fcb90ea/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc04eff73a10df5b397=
127
        new failure (last pass: v5.16-rc5-221-g69b486b26c17) =

 =20
