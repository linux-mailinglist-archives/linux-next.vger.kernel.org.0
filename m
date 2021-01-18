Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BF12F9958
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 06:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbhARFjm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 00:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731791AbhARFjk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2021 00:39:40 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E61FC061575
        for <linux-next@vger.kernel.org>; Sun, 17 Jan 2021 21:39:00 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id f63so1730141pfa.13
        for <linux-next@vger.kernel.org>; Sun, 17 Jan 2021 21:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=v6mlrR29F5Vdjf0dxSkubcKp2rwnO3v3yV1CI6bgS0g=;
        b=uKcwUVHyY/BDRWJvaoSVl2DpCMtNMmuIxa7QnZ1M3tJH99Ujg9znygOtYdeBewX7ys
         JKrDq49j2i5AehPCPiadwEAuilnUukmh5MLsVaF9N5LrV7U/1+OrHI2JCbJuuTsCD/bV
         b/Fx2ZnIirvGk7pM8QiNUqYKLbERjfW1oiogehv8PK7JSG3kPKwBuPKlCYDZpGJL5Cuc
         9LqNVK3fWvpCzEmyx4cnUCxlYpsi67tOEPGUZ/Ja+ey5JOBNpqHsQTVEG4cIBSdqN2ii
         2eVeSMHNNloMkhJk/sg2FdBfn5a7uQpGV7rOQQI35rClhaxb/zTaW2qFNZuWnPFXkdSn
         TcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=v6mlrR29F5Vdjf0dxSkubcKp2rwnO3v3yV1CI6bgS0g=;
        b=Tr0sMqYpphiGwSY5pzaBTJdH/titC/pRvJ5egb+iwvTqLFV8g4tsPzRsV6KHuvV3OH
         6GDJKyF7x4f6wr0W07HLpxTwFgg+DPEuh1E/HWriWyq5eddn5qnsNMmKYlLzFt67pv5W
         CibqLDZMpwTbGaK2mepfR/TIk7CHmtvsCms7FQzKj+o2iW9DJufxg6o6nT3gXzrZsdnf
         hJAD8GS86iBxKtVZsm7ULipNb5CFXd8KrssQJ+rfW9KHO02Ikc0YkHFEXKiiN1o0XslE
         k+PfnLn7X+W06WIUne/NUNuLiyBuioCuqRPWREuzF2t4+FomxjImYoJFsXh4o7TNKhT6
         MobQ==
X-Gm-Message-State: AOAM532XrS8hBZq4z1/WHzdga5DvCbEyO8ZOBGafYYBw84sb3mNkOsq2
        maygXIYpg/RxJ8YZu55mJYz5xY+32jRRqw==
X-Google-Smtp-Source: ABdhPJwVH3z2haJNNyXdKPHT1Mo4ODWaJS5ZPQgWsbZWYaSTDYcP/tpgzpSe48LwcZFMWEc46ecTFA==
X-Received: by 2002:a63:e246:: with SMTP id y6mr24270694pgj.412.1610948339480;
        Sun, 17 Jan 2021 21:38:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k64sm13840986pfd.75.2021.01.17.21.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:38:58 -0800 (PST)
Message-ID: <60051ef2.1c69fb81.86242.35a0@mx.google.com>
Date:   Sun, 17 Jan 2021 21:38:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.11-rc3-576-g69c0c89b7d692
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 238 runs,
 8 regressions (v5.11-rc3-576-g69c0c89b7d692)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 238 runs, 8 regressions (v5.11-rc3-576-g69c0c8=
9b7d692)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

meson-gxm-q200           | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-8    | x86_64_def=
config+kvm_guest   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc3-576-g69c0c89b7d692/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc3-576-g69c0c89b7d692
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      69c0c89b7d69281e67950c9a5cb8cbbab9fbb12d =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6004ec56ccf8fc8e08c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004ec56ccf8fc8e08c94=
cc7
        failing since 31 days (last pass: v5.10-9016-g31c318f75dc4, first f=
ail: v5.10-11328-gc41c506b38eb) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
meson-gxm-q200           | arm64  | lab-baylibre    | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6004eab44e0a8a5907c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004eab44e0a8a5907c94=
cdb
        new failure (last pass: v5.11-rc3-364-g5bd8ecf03410) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre    | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6004e7e1ed8ce56ad3c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004e7e1ed8ce56ad3c94=
cd2
        failing since 62 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-broonie     | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6004e928ae862b67cac94d01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004e928ae862b67cac94=
d02
        failing since 62 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-cip         | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6004e7d029440602a7c94cdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004e7d029440602a7c94=
ce0
        failing since 62 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-collabora   | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6004e795fc48668991c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004e795fc48668991c94=
cc2
        failing since 62 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb     | arm    | lab-linaro-lkft | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6004e78a19a03c323cc94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004e78a19a03c323cc94=
cbe
        failing since 62 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-8    | x86_64_def=
config+kvm_guest   | 1          =


  Details:     https://kernelci.org/test/plan/id/6004e9839d9d7008d6c94cdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/x86_64/x86_64_defconfig+kvm_guest/gcc-8/lab-broonie/basel=
ine-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc3-5=
76-g69c0c89b7d692/x86_64/x86_64_defconfig+kvm_guest/gcc-8/lab-broonie/basel=
ine-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6004e9839d9d7008d6c94=
cde
        new failure (last pass: v5.11-rc3-364-g5bd8ecf03410) =

 =20
