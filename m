Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA3B1F8F1F
	for <lists+linux-next@lfdr.de>; Mon, 15 Jun 2020 09:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgFOHPW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Jun 2020 03:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgFOHPV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2020 03:15:21 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E826C061A0E
        for <linux-next@vger.kernel.org>; Mon, 15 Jun 2020 00:15:21 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id y17so6429947plb.8
        for <linux-next@vger.kernel.org>; Mon, 15 Jun 2020 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6C8IF3q+sVgKJ33PEPWf6cbDaPopmQXVlzU2GSgWcMA=;
        b=prINsQ24SeIOpz7rI+wkwqnIwHURXAZUqApNdD5BHPiLw+/DdfeNk/mW99VFLVTxIH
         fDBnb4lc3wOB/JQqKPtPXRpym2JE64XegpvKCXHCQktccT1MdW03MPrpywdvz+v6lLvB
         YUq6MwrGcKVFikTC5lzaML5jlPLzMgsl2utfHZlqLb1ZCxkIseFCqr8ohwEu8J9hpEKS
         9DxF/3uBx5MpkQexy7twuHeqOmr1oFvGI7j1EGwIWryV/smUbHfcMdb8xYGDltWPUGt3
         vC+9Cmv1miu5twJkRgmOVdo+X2IbJl6fjXC4TfAdjDKpUfFhXABES9P3HSOKjtlGtUca
         A4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6C8IF3q+sVgKJ33PEPWf6cbDaPopmQXVlzU2GSgWcMA=;
        b=nWRJooOHMKRaQetOZNnO/R/bUBpTMjF4t+sgA6NCj4oIcJgPmQCQdqCak6/GLaTcjC
         atujjY8zEEaa9mX/1gy3jD0OP66rqkoEOO9bPAHRT3hF/5/fwEQS+H2+buuE74jW4EQZ
         tLGqNF1finKcrfPMhVNWOmLi+rbX4djOrzqqJK7YEvj1/qRW9LZPi51CGtj7D+AW1qZ8
         RC1on2l58B+hvehe/koRypX9sgaimw2loHR/SjVr5eBrWCTcUlhKcgxnZJSsq7oDntSg
         PyB2gb/lPTWMY8pZatkN/cT3PqZhkg5IisJFw2CL9eqddX4e0NefPyKuWa3nSyBcxIGY
         /jHw==
X-Gm-Message-State: AOAM532oV5EzMaRif9Nh9jW6djRI07eOf0ckqK6X2eTxt3aU1uZNVX9Y
        SPg5HALTy9exqghHrzjnOYQJ94DkW/Q=
X-Google-Smtp-Source: ABdhPJwUSECQaolwK1EIVAV1HrjurpS8GaO/e4RF4r7Go2Rd8OG/1ia6aOGa4OHWI5EqGodziUwSxg==
X-Received: by 2002:a17:90a:e801:: with SMTP id i1mr10394237pjy.79.1592205319918;
        Mon, 15 Jun 2020 00:15:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w22sm13111139pfq.193.2020.06.15.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 00:15:19 -0700 (PDT)
Message-ID: <5ee72007.1c69fb81.6413a.d390@mx.google.com>
Date:   Mon, 15 Jun 2020 00:15:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200615
Subject: next/master baseline: 154 runs, 9 regressions (next-20200615)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 154 runs, 9 regressions (next-20200615)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_i386                    | i386  | lab-baylibre  | gcc-8    | i386_defc=
onfig               | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200615/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200615
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bc7d17d55762421b98089f5f7496e48cab89de50 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6e77f9590ed05dd97bf13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6e77f9590ed05dd97b=
f14
      failing since 0 day (last pass: next-20200611, first fail: next-20200=
614) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6e8c5ab610c749b97bf11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6e8c5ab610c749b97b=
f12
      failing since 47 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee6ed6c56f664184097bf0b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee6ed6c56f66418=
4097bf0e
      failing since 5 days (last pass: next-20200608, first fail: next-2020=
0609)
      1 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6e9db2724a724d397bf12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6e9db2724a724d397b=
f13
      failing since 2 days (last pass: next-20200609, first fail: next-2020=
0612) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee6e86cb87f46cc5f97bf3b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee6e86cb87f46c=
c5f97bf40
      new failure (last pass: next-20200614)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6eea1c1d724ae5b97bf0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6eea1c1d724ae5b97b=
f0f
      new failure (last pass: next-20200614) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
qemu_i386                    | i386  | lab-baylibre  | gcc-8    | i386_defc=
onfig               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee6e75182c8f3534697bf13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee6e75182c8f3534697b=
f14
      new failure (last pass: next-20200614) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre  | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee6e7b4bd77633bca97bf2d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee6e7b4bd77633b=
ca97bf30
      failing since 9 days (last pass: next-20200604, first fail: next-2020=
0605)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee6e82a1b267620c597bf3c

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200615/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200615/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee6e82a1b267620=
c597bf3f
      failing since 9 days (last pass: next-20200604, first fail: next-2020=
0605)
      2 lines =20
