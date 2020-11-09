Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7F22AB017
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 04:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgKID4v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 22:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKID4v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 22:56:51 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3604BC0613CF
        for <linux-next@vger.kernel.org>; Sun,  8 Nov 2020 19:56:51 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id z3so6807127pfb.10
        for <linux-next@vger.kernel.org>; Sun, 08 Nov 2020 19:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0x4m9dxjQeiQL2M3+RnCtYI9++swc/TFtYxfhFoxtTQ=;
        b=Br58LHz8S5IM0GC+Lft2UKJmXg3Z+q4/QBROWJB9W6OArNaKOBmDR2m+X+aLQdgXNn
         Kv/QhKa9FZ1rkqEQfKOUXjjMnIGf+YUx4Gg77SdebGEWS9SnA4oS7K9jAFs+7qkcuaG/
         2h3Y4c11uvBJXGvHJiTVDIN8+j8RNyzNo0x1sHC+9Agtwy8uLdWNTZefcV6pIlIGTAz/
         IQkjd7YGaQAMTNIerfOuobASIRmRqrzF7YLKutlNQASySpMwnF2ECDpKKbc+74KJey5X
         heGsO2oPMHCEBtKZ5lkWjXvUhornNmElpDIPQy9xw49B+Cnmk/JxK5PdTpD+N0g7bqa9
         vXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0x4m9dxjQeiQL2M3+RnCtYI9++swc/TFtYxfhFoxtTQ=;
        b=SvCazuiM7udOt+ja+YyrbjxSa0jl/EtoJ6mD4DGzoOB54hRfgDXXlHOGGgnRR3ecz+
         ATt/rZVuhHwNytfWbeYqXdDALbDC4qaaLilv32298Add7DJcfv7TU+i/BBaFrJQmkiEQ
         VfW+H3pV88d2ws5Hgv9qIE5+5BGJsyZ8NP2+f50W0MUyKyV1PiAcEouIrRXL7UjHndFH
         5gtlR92Aq0ndQfcs8kKIE6yZ6nCwiDpWQQzur0fxAGuK2SkurKFHDxl72r0dHEh2LRBT
         J86jRHAIdj+f7hf1BlCQiD4ew421Ii39MAKJCfp65rBufa4tT/Kx+6XlBLjytliO/CSg
         iAqA==
X-Gm-Message-State: AOAM531iBP3AcV8whnCe6gQXHrgq7SzaGYDJGcZH7nlhvpCU5/PEVFd7
        9mm+n64/oZ5CWIx8AnvAlkjWKe8vE3tfnA==
X-Google-Smtp-Source: ABdhPJyLQJasrLmN1ailp2fceR2Exji9GwA9CDO8kBzj8V6Dg8go37VB1IP/fKkWlaM1pmZeOdY+jQ==
X-Received: by 2002:a17:90a:4684:: with SMTP id z4mr10870152pjf.97.1604894210283;
        Sun, 08 Nov 2020 19:56:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o10sm8129691pgp.16.2020.11.08.19.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 19:56:49 -0800 (PST)
Message-ID: <5fa8be01.1c69fb81.5567f.1059@mx.google.com>
Date:   Sun, 08 Nov 2020 19:56:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.10-rc2-660-g8b54310a22d78
Subject: next/pending-fixes baseline: 373 runs,
 7 regressions (v5.10-rc2-660-g8b54310a22d78)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 373 runs, 7 regressions (v5.10-rc2-660-g8b5431=
0a22d78)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 2          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

sun8i-h3-orangepi-pc     | arm   | lab-clabbe   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc2-660-g8b54310a22d78/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc2-660-g8b54310a22d78
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8b54310a22d784c5eadd56f270003d570bc91658 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa885ac5a05451e65db8874

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837=
-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837=
-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa885ac5a05451e65db8=
875
        new failure (last pass: v5.10-rc2-457-g3952050a63fb) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa8892b4803afc740db886d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa8892b4803afc740db8=
86e
        failing since 14 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fa88a33851d8b5b3fdb8853

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-=
var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-=
var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fa88a33851d8b5=
b3fdb8857
        new failure (last pass: v5.10-rc2-457-g3952050a63fb)
        4 lines

    2020-11-09 00:15:38.088000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2020-11-09 00:15:38.088000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-11-09 00:15:38.088000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fa88a33851d8b5=
b3fdb8858
        new failure (last pass: v5.10-rc2-457-g3952050a63fb)
        26 lines

    2020-11-09 00:15:38.131000+00:00  kern  :emerg : Process kworker/1:2 (p=
id: 79, stack limit =3D 0x(ptrval))
    2020-11-09 00:15:38.131000+00:00  kern  :emerg : Stack: (0xc35cbeb0 to =
0xc35cc000)
    2020-11-09 00:15:38.131000+00:00  kern  :emerg : bea0:                 =
                    00000000 00000001 c35ca000 cec60217
    2020-11-09 00:15:38.131000+00:00  kern  :emerg : bec0: 00000000 0000000=
0 00000003 00000000 00000000 8fe49ffa c38e5040 cec6008f
    2020-11-09 00:15:38.132000+00:00  kern  :emerg : bee0: cec6020f ef7ad40=
0 00000000 c09b2e68 fffffc84 fffffc84 c3a0e000 ef7ad400
    2020-11-09 00:15:38.173000+00:00  kern  :emerg : bf00: 00000000 c1a1e86=
0 00000000 c09b3350 c3a0e1a0 c322e780 ef7aa1c0 c0360768
    2020-11-09 00:15:38.174000+00:00  kern  :emerg : bf20: c240ce00 ef7aa1c=
0 00000008 c322e780 c322e794 ef7aa1c0 00000008 c1803d00
    2020-11-09 00:15:38.174000+00:00  kern  :emerg : bf40: ef7aa1d8 ef7aa1c=
0 ffffe000 c0360d54 c240ce00 c1a1df57 c137fa28 c0360aac
    2020-11-09 00:15:38.175000+00:00  kern  :emerg : bf60: c322e780 c23660c=
0 c3230640 00000000 c35ca000 c0360aac c322e780 c2137ea4
    2020-11-09 00:15:38.175000+00:00  kern  :emerg : bf80: c23660e4 c0366ec=
8 00000001 c3230640 c0366d78 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa88c5ad399b41cbddb886b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa88c5ad399b41cbddb8=
86c
        failing since 14 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa88a09eb04dee419db8871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa88a09eb04dee419db8=
872
        failing since 4 days (last pass: v5.10-rc2-346-g3261d524354a, first=
 fail: v5.10-rc2-396-ga212a20610dd8) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
sun8i-h3-orangepi-pc     | arm   | lab-clabbe   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa88c7d3f6bcde7efdb8889

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/ba=
seline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-6=
60-g8b54310a22d78/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/ba=
seline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa88c7d3f6bcde7efdb8=
88a
        new failure (last pass: v5.10-rc2-457-g3952050a63fb) =

 =20
