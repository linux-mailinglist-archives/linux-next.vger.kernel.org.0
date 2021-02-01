Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D35930A018
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 02:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhBABuY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Jan 2021 20:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbhBABuJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Jan 2021 20:50:09 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B369DC061573
        for <linux-next@vger.kernel.org>; Sun, 31 Jan 2021 17:49:29 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id g3so9106923plp.2
        for <linux-next@vger.kernel.org>; Sun, 31 Jan 2021 17:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ceYRmkhnX1KCvQ6d3Ys+LEQI6vgVKAvanQ0mmx7IfaI=;
        b=u6fawf8/Hv6DJZ3kzB5hv105vq0DUS44BXnmVWpq5kp4WZvV2u9BYoISylcVr5rccr
         EVB3Vy7XF2Tj+APMbfvG7ujgQu6s7sw2ZwcqIgCb86tR7aIcJtPEHAaXKbXeKZTNU8Rg
         bB/O54QJkeaaa8uhrFLKPFx9bjDQD8eq4m8YH7QkNsMUE3r15qd+mhrnb2DiwAtluvB6
         E4kK3PRnVESxm64jmAEa748T+NSHsSVsw6/rV0Mlj8xMj5aCRseDeSsHXzMK7HV9oet7
         r1fSr9eiMiYNUKN+2oIFhUpfbJwDPGpXvzzd2XYA+JNscI8ctvwY3pbVSvzb4r/jA4Li
         aqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ceYRmkhnX1KCvQ6d3Ys+LEQI6vgVKAvanQ0mmx7IfaI=;
        b=iu7+Yw2giHWFUE0KOh+1fPxnV2c/wLvUXURxlESpPL6ytvJpZMHRz4iBEyB1EFZ6uo
         U9T9FEsPzn5E2yCVbi56t1aoZYd2OWFqJCp1N4YyYFSw+3WFSEX6jqoFAM3PUx5WKs7E
         0zj1CL1YtxPtAkRcCQaqY4SRR79tWGlmX+OgouQXLHpwY8FZieRdd0QZzSarqtVmhyLo
         cBJoF+XDGL3joC6l+z5sZBEamDXuiSZ2om4pZdAqSQi+gZC3J7fs6UnzCLnZg8r048FV
         7Jnhcks3V2X27WAaCrNt+grI+gqZAJsyk/Gaf4DzR7U9tWk5GYavvI09ZdMnNFLJ1txR
         I0tw==
X-Gm-Message-State: AOAM530Y+3/mSiCWq49Q1QNyXdvBGA995XvMfJ+6rDCKkp7zzGgxQdH/
        B+vKoq/lThdysj10ApfhP9+LkVlK+ojeYA==
X-Google-Smtp-Source: ABdhPJx7OoeOAkxDDjUF8bRFRk/+kUk1fRBChfNIxPAo1HEr9h1prKAKT5qs+u4ePJ0vHVqSbHACmQ==
X-Received: by 2002:a17:90a:5912:: with SMTP id k18mr14709378pji.169.1612144167906;
        Sun, 31 Jan 2021 17:49:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k11sm14392259pfc.22.2021.01.31.17.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 17:49:27 -0800 (PST)
Message-ID: <60175e27.1c69fb81.e93a7.385f@mx.google.com>
Date:   Sun, 31 Jan 2021 17:49:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-rc5-524-g99fcb426f858
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 274 runs,
 7 regressions (v5.11-rc5-524-g99fcb426f858)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 274 runs, 7 regressions (v5.11-rc5-524-g99fcb4=
26f858)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc5-524-g99fcb426f858/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc5-524-g99fcb426f858
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      99fcb426f8584269c46ebe7ddfedc049d7d555f4 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60172c354371867914d3dfc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60172c354371867914d3d=
fca
        failing since 10 days (last pass: v5.11-rc4-275-g31be679b2913, firs=
t fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/601729f6b43b00f215d3e008

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601729f6b43b00f215d3e=
009
        failing since 3 days (last pass: v5.11-rc5-278-g3e6d74db7e02, first=
 fail: v5.11-rc5-322-gc9df5fe15328c) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/601728ceba0dcb647ad3dfce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601728ceba0dcb647ad3d=
fcf
        new failure (last pass: v5.11-rc5-405-g1e76bd25cdcd) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/601725591bb0c69ac9d3dfde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601725591bb0c69ac9d3d=
fdf
        failing since 76 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/601725699d9611327ad3dfc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601725699d9611327ad3d=
fca
        failing since 76 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/601725817484559466d3e000

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/601725817484559466d3e=
001
        failing since 76 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/6017250e8a3a8ab5a9d3dfef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-5=
24-g99fcb426f858/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6017250e8a3a8ab5a9d3d=
ff0
        failing since 76 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
