Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A0121BCF9
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 20:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGJSaG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 14:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgGJSaF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 14:30:05 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D502BC08C5DC
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 11:30:05 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m16so1391572pls.5
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5ayaDv3ib7AI1pFrkcsRSfSeB7hb22oKy9nnCm5i7/k=;
        b=jFVnefKU4UEItwHmP33zKY9m6NaLHa8r9p8epHd4svsS84GOGbLB3EzzNSdsazsN/e
         M6gc4S/4x/5g9g8lup6azHYc85pApfSkI6clwl/2utKNkf/mHVyIcmH0d9UoMV7eTmBS
         H7d+Vsd2mZq6UdMJNHs0anVj43TQXawDdJ/TX/67AUksVfJG2O9azGuztwh1x1n6rks+
         ZumVmdm0vHTIWoovBWRuDvF1QFmYwoYV+TOOOJAeZ3RmF9IFTj19ekZYIgO/E75h+n+u
         9FeVaz5CIme30nwRlvWfvdBp2+BF0Vxz0H2/04E+RatAMufk1AR/jpSeQxKFGjyrLLXB
         3IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5ayaDv3ib7AI1pFrkcsRSfSeB7hb22oKy9nnCm5i7/k=;
        b=dMgcgcTKn5gBTPjY/wphtihAgMPJNXbNVBqfkozRKepABDSZsSgE0gxvQEivsQJ5kK
         WcjrHuN4wWy/0C7tjZwUpJyfms6WJSMEbgfCk0i23xRs+9rIr7uVXwSCVkcRWHukawAk
         f4Gq1LThsoLxZsOxsrHNIQp9hDY/9VGwYG6jAeDqfA1hAwu2prAVTEHWUvJF7bSAX+vs
         onPaF0VeXBTM3ffQYyjAGk0V3vH5RsjaILw5PuKFRFyge6XJctt4mge4HbEJRzjx9iZQ
         5ZTOBaE1yxiXSEebyVz/CK2uuJC9X89i8AMLnxsiiYpPFitRiI42+10P6pVSYP6A5NCh
         gVwA==
X-Gm-Message-State: AOAM532YGv/fjcNUc4hCx27WTOmB8e3A5l+vAFcoUHQ4Z4RNi8jtqEHj
        P1LjcwnIpJDwtQVNL+HR62hqjg8Wyig=
X-Google-Smtp-Source: ABdhPJzH0zLmKUsPRGvH16Byueri1dHFyCQ6O+DGCVNsz4z+T2lsiSJWBEfk1hml/tcnN8mVhbYB7w==
X-Received: by 2002:a17:90a:66c7:: with SMTP id z7mr7241714pjl.172.1594405804788;
        Fri, 10 Jul 2020 11:30:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm6414664pgk.77.2020.07.10.11.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 11:30:04 -0700 (PDT)
Message-ID: <5f08b3ac.1c69fb81.f868c.f4c4@mx.google.com>
Date:   Fri, 10 Jul 2020 11:30:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc4-480-g228d84f5d4f9
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 147 runs,
 8 regressions (v5.8-rc4-480-g228d84f5d4f9)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 147 runs, 8 regressions (v5.8-rc4-480-g228d84f=
5d4f9)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig =
                   | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc4-480-g228d84f5d4f9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc4-480-g228d84f5d4f9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      228d84f5d4f9ba5452fbb21e2c6fbad98bc2d94c =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f086b33f6d7957f5c85bb53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f086b33f6d7957f5c85b=
b54
      failing since 66 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f087e2711aee3c28985bb34

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f087e2711aee3c2=
8985bb37
      new failure (last pass: v5.8-rc4-410-gf11279e61036)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f087038aab93e204085bb4c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-va=
r-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-va=
r-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f087038aab93e2=
04085bb50
      new failure (last pass: v5.8-rc4-410-gf11279e61036)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f08=
7038aab93e204085bb51
      new failure (last pass: v5.8-rc4-410-gf11279e61036)
      54 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f08718ade7171874a85bb25

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f08718ade71718=
74a85bb2a
      failing since 1 day (last pass: v5.8-rc4-328-g1432f824c2db, first fai=
l: v5.8-rc4-410-gf11279e61036)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f087ef3cbf6265d9f85bb35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f087ef3cbf6265d9f85b=
b36
      failing since 1 day (last pass: v5.8-rc4-328-g1432f824c2db, first fai=
l: v5.8-rc4-410-gf11279e61036) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f08784644300f72b585bb31

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f08784644300f72=
b585bb34
      failing since 11 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f08785944300f72b585bb3d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-48=
0-g228d84f5d4f9/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f08785944300f72=
b585bb40
      failing since 11 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
