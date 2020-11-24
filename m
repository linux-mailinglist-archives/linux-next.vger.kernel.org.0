Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0692C1E84
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 07:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbgKXGvQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 01:51:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729797AbgKXGvP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 01:51:15 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4F1C0613CF
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 22:51:15 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id t21so16611072pgl.3
        for <linux-next@vger.kernel.org>; Mon, 23 Nov 2020 22:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/0huMwagpnuD6WLmXC82gdKKY5qx/oHYlE0kVKxWBsM=;
        b=0SOC6uxCk2fkbejUxD58LFIJ1nu+mCXpptc8I+kprc/yMsm3h3SeHkPPPh6lcelJju
         ij8PwlLz6JWWt/sKU37E4pQ923SFjWfZ4N5myjeQrMErMrkA/HFubX3bkjNZGIHpcZcD
         ThbTtAM4sn6XmrTLAIsm+mpbgXn3CpmyRFlj2FZeSQuSb/FlC7+DR1c5+AEhCSf6iOxm
         u0a1biY6W/c+2DHkGMezhASr1BorYuqgzc0YHqHdrGKaG9jsTCAK9J2K5/pBH7hYBIAm
         wTYzHHRSIXdJJIbRCr2/sn+T5ko8F2rZonrS0Fz5XlspICSh/dQNPptuIPye43XCCxUn
         vpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/0huMwagpnuD6WLmXC82gdKKY5qx/oHYlE0kVKxWBsM=;
        b=c/5NK2OSLuk3K8gn9zRB1AHkEMr6LULjRJ758oYalWWRwwtmYzfJNiWYF/WC7eym9H
         Qfprucsr4dR48MmWemKhqTA+PguPPmA80lyJE7+oxhXCUKQMGY+QGYJtJ4j67RABgyM5
         3+izSjVJIpbCH2zwdIpLRIsM3GYlUqAFder44tLAZyFbU/ndCrcMoZHCok4Vz6Ogdhf/
         kSqzHGqXm1SwIAoltAjhpLf9JWlHMhf5fmYsDu1wDUyRuGgruZaqvUrpBDo4dvjut708
         YWzx+VnZGUXNED/JbRF/JnYWcxye08sU25t4HhwKWj/uz9L7Q6phxRs91BX1SDykpy4S
         PpNQ==
X-Gm-Message-State: AOAM531YWOs3SCmNeWVlFVjrQw1e9Um6ht/ML4qkiDRJNBEtdRGeEJoE
        TTMiYFPBRQhuQ6hAiFNRkznj98kG6Jt0Jg==
X-Google-Smtp-Source: ABdhPJxK96K/xiJXryplZSsSq2aHuNBVRXjAzCC6ZCTv2tVy+N/9Rtg5+jw0Cq22WKCvqODfQT7kAA==
X-Received: by 2002:a17:90a:4405:: with SMTP id s5mr3185787pjg.219.1606200674818;
        Mon, 23 Nov 2020 22:51:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e29sm12387855pgl.58.2020.11.23.22.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 22:51:14 -0800 (PST)
Message-ID: <5fbcad62.1c69fb81.f9325.ccdf@mx.google.com>
Date:   Mon, 23 Nov 2020 22:51:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-rc5-256-gea2235a03b2c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 305 runs,
 10 regressions (v5.10-rc5-256-gea2235a03b2c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 305 runs, 10 regressions (v5.10-rc5-256-gea223=
5a03b2c)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained    | arm    | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 1          =

bcm2837-rpi-3-b          | arm64  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =

imx6q-sabresd            | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-8    | x86_64_def=
config             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc5-256-gea2235a03b2c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc5-256-gea2235a03b2c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ea2235a03b2c1f9deace7f390d3fe56b35622364 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained    | arm    | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc794d0241428230c94ce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc794d0241428230c94=
ce2
        failing since 202 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b          | arm64  | lab-baylibre    | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc76c693ea090509c94ccd

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fbc76c693ea0905=
09c94cd0
        new failure (last pass: v5.10-rc4-615-gd0b6b0cb24dad)
        1 lines

    2020-11-24 02:56:07.341000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-24 02:56:07.341000+00:00  (user:khilman) is already connected
    2020-11-24 02:56:23.013000+00:00  =00
    2020-11-24 02:56:23.014000+00:00  =

    2020-11-24 02:56:23.014000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-24 02:56:23.014000+00:00  =

    2020-11-24 02:56:23.014000+00:00  DRAM:  948 MiB
    2020-11-24 02:56:23.030000+00:00  RPI 3 Model B (0xa02082)
    2020-11-24 02:56:23.117000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-24 02:56:23.148000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-sabresd            | arm    | lab-nxp         | gcc-8    | imx_v6_v7_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc7cce7714185adbc94cd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc7cce7714185adbc94=
cd1
        failing since 29 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc7b6303af96969dc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc7b6303af96969dc94=
ccf
        new failure (last pass: v5.10-rc4-615-gd0b6b0cb24dad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-nxp         | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc79f2d22356cf11c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc79f2d22356cf11c94=
cc3
        failing since 11 days (last pass: v5.10-rc3-337-ge83d2e1f2d190, fir=
st fail: v5.10-rc3-420-g5364e201065c) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc75a21812ff3585c94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc75a21812ff3585c94=
cc1
        failing since 7 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc759d7511260d17c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc759d7511260d17c94=
ccf
        failing since 7 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc75973432760a01c94d18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc75973432760a01c94=
d19
        failing since 7 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc90df9bdd47978fc94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc90df9bdd47978fc94=
cca
        failing since 7 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-8    | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbc76b293ea090509c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-2=
56-gea2235a03b2c/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbc76b293ea090509c94=
cbb
        new failure (last pass: v5.10-rc4-615-gd0b6b0cb24dad) =

 =20
