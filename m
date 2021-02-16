Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245D931C751
	for <lists+linux-next@lfdr.de>; Tue, 16 Feb 2021 09:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhBPIYS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Feb 2021 03:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhBPIXs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2021 03:23:48 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D830C061574
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2021 00:23:06 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id b145so5697473pfb.4
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2021 00:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vxc6dYCB7ItO6aB69Q8PBqa3OUCziun8nUbHfDo2Hd4=;
        b=k71Gh8y2kyOr/zG9IJpnQYzjugAVcGSFz7tIkLrHh08nEv7NsOwGQJEUUyJRMmZUIk
         CJrVrhKQQ+jMyY/hjFaKRC57VSC60cof14zCzR78jBQ89llIcNNusun4cN5B1ti1e2ft
         ilh8cNJD9zLVPPOoUbmP+D9r6z570m9D6wbh09xmSAg16HTHRETomnwR6SopVT5ntzRi
         +vqS0jrIFljkPkthcFISsrlZT8QBrZGuC8Qzgk7x+txurIpHSKZlKayrVJeQqqigHFbz
         U6UXKx5LWKvuiqunVuQkr/PuIPCqrWIIuKbdvvsyh1zM3l1yg5EgnrWPT5s9VrCcfnbJ
         /h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vxc6dYCB7ItO6aB69Q8PBqa3OUCziun8nUbHfDo2Hd4=;
        b=eRQFOzkNdBLnOt3vdxKsCD1uP11dQFyNkPDYVcSXBkScM5MTETbNooH71Cn/7gq+5b
         LA4fp0UhBICutqZBs6b0qtz5nAAw2IYdrJOTM6DJVYXVfjAQcHlUSCjDy6NeqS6YQ2Pa
         U2H/LSXI3i+NAk64u9WBBKL+pM8sFdfnfQ1EoZ9WlsMB1+LpmUS5rwDUvY7+p7Bkw4o7
         /Pn6DoAGNZFNhD1SZ8M+zCA1kOYc+/ISHOkIXad6wwSWWdybcUyt1HLeUm8KguEhYKhb
         wCj02gI7ENSNmP4H9D6RIpKGu4w/vpUyd2i/ji8snC8P/P1tSO31q1n6n7YpyAduNaqt
         /buA==
X-Gm-Message-State: AOAM532dAgZ5q2jKsRqcdoVNHZqNdmzf2k3bZeDSxB9aZz8T4CNBhA2/
        +YaCTz/7LAiC2ivYH3dowY1TGWvKXNIXwg==
X-Google-Smtp-Source: ABdhPJzpIj126jgtsKQmhkRUUka4/NRaPmUsGcD6ukJ/SZMfm0JuGa+uLVmITDsQeMZO5UKNhqCVPQ==
X-Received: by 2002:a05:6a00:148a:b029:1ae:6d20:fbb3 with SMTP id v10-20020a056a00148ab02901ae6d20fbb3mr18295067pfu.55.1613463785687;
        Tue, 16 Feb 2021 00:23:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n4sm21473962pgg.68.2021.02.16.00.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 00:23:05 -0800 (PST)
Message-ID: <602b80e9.1c69fb81.52b44.d6b9@mx.google.com>
Date:   Tue, 16 Feb 2021 00:23:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-619-gde196b2f354e
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 145 runs,
 4 regressions (v5.11-619-gde196b2f354e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 145 runs, 4 regressions (v5.11-619-gde196b2f35=
4e)

Regressions Summary
-------------------

platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15        | arm  | lab-linaro-lkft | gcc-8    | multi_v7_def=
config           | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 1          =

imx6ul-pico-hobbit       | arm  | lab-pengutronix | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-619-gde196b2f354e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-619-gde196b2f354e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      de196b2f354ebd1775c772c6b92805ae04f8a1e0 =



Test Regressions
---------------- =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15        | arm  | lab-linaro-lkft | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/602b55991451e94475addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-b=
eagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-b=
eagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602b55991451e94475add=
cb6
        failing since 3 days (last pass: v5.11-rc7-121-gdfed2943da0a, first=
 fail: v5.11-rc7-192-g055e690de1b2) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602b4c5986d21afc3daddd09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/basel=
ine-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/basel=
ine-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602b4c5986d21afc3dadd=
d0a
        failing since 1 day (last pass: v5.11-rc7-192-g055e690de1b2, first =
fail: v5.11-rc7-273-g095727507311) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/602b4e25b90e7e408baddcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-d=
t6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-d=
t6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602b4e25b90e7e408badd=
cb3
        new failure (last pass: v5.11-rc7-273-g095727507311) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit       | arm  | lab-pengutronix | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/602b4ca6b37f1b567daddcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-=
pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-619-g=
de196b2f354e/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-=
pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602b4ca6b37f1b567dadd=
cbc
        new failure (last pass: v5.11-rc7-273-g095727507311) =

 =20
