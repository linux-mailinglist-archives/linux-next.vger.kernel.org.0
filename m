Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA1A22A343
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 01:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733162AbgGVXp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 19:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733074AbgGVXp5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 19:45:57 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002E3C0619DC
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 16:45:56 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id t11so2069359pfq.11
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bC2oFKslk+sLLYoFz0IV5UP+h+Yo9p5XMXMBSPJB2nk=;
        b=dM2Y2r2rFET8x83I9rxvnXrAMPWxOjsB5R6KvDmlemwNj/BmszdpfD2QACeM9gRCtw
         +WPi/Af8SktjfuP3cWnpITlywSjlYDYQozC0KTyMsoggR4rQ1pmRRyn5UxZbsTtns9Fm
         bXshI9h7/hu/fusYT2eQq4GAa8Zz/jWza+/6XkclFzNPPEXcQWZacX0sYsIH0Fawakdr
         78h2joDPjVs0JpTemT3zcUnMZVKcmcwmuIB3MY+daOVaTu3avkZAuLNaw0DbOUTBuEQ6
         JIDaVSmfKRtL+wjNAnHcgmF+dcNSAZoBCc208drMSrUHdbmK/ShdDldLTETLvd0WdnoZ
         A9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bC2oFKslk+sLLYoFz0IV5UP+h+Yo9p5XMXMBSPJB2nk=;
        b=G+TcchR1AJywNZgn0PD5fKe6kPGLOL0vuZLTxukana3NBxK9RvEySMDTnLL6fmXARB
         JJGBqDziC8t01jL8x1hrkEtggFktdL0ASpZtLdPsnG2GQURbP8MmhvP6UjflMcBKAcSC
         CzTk0rbCeo8VIkn/FQ+JtCrBULwMFxD7lFOUtIZNo6Kuj+0T2I/KXrNU6CIvKdq/AA3n
         A45a9Qynm/u8wqRgJEAhdM1rJkXWljE5dqk7XFs8M/cpUvnWqUxamHY6hP8t4lh5/UE0
         3RS7L6/5nZejfpwfFGVIlj+gj+W07czstp7kuF6V/xi6h7IbfpXRskj+LTY/tfo0lWyC
         50wA==
X-Gm-Message-State: AOAM531foVRZUer9SNXCfflaj9ZMq/VQT3t7FSprCGMuTPsdjQzxY88B
        tuRqbERo7BPedtXCKf0M+jkzIji4TIQ=
X-Google-Smtp-Source: ABdhPJw5FMSi7jwKXQxS1BGKHVYvzUQnNP4dbOQnksny3WGdyRUmkWAr5xrJ3z9HjHcogjsB3IFRog==
X-Received: by 2002:a62:7991:: with SMTP id u139mr1694050pfc.87.1595461555610;
        Wed, 22 Jul 2020 16:45:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id az16sm758819pjb.7.2020.07.22.16.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 16:45:54 -0700 (PDT)
Message-ID: <5f18cfb2.1c69fb81.6e792.27eb@mx.google.com>
Date:   Wed, 22 Jul 2020 16:45:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200722
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 473 runs, 33 regressions (next-20200722)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 33 regressions (next-20200722)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =

exynos5422-odroidxu3         | arm   | lab-collabora | clang-10 | multi_v7_=
defconfig           | 0/1    =

exynos5422-odroidxu3         | arm   | lab-collabora | gcc-8    | exynos_de=
fconfig             | 0/1    =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =

meson8b-odroidc1             | arm   | lab-baylibre  | clang-10 | multi_v7_=
defconfig           | 3/5    =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 3/5    =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 3/5    =

omap3-beagle-xm              | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

omap4-panda                  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 4/5    =

omap4-panda                  | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                  | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 4/5    =

omap4-panda                  | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 0/1    =

omap4-panda                  | arm   | lab-collabora | gcc-8    | omap2plus=
_defconfig          | 0/1    =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200722/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200722
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      73aece61f643fc0a1d224b6ad53e70832ac757c3 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1874423496037c8385bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1874423496037c=
8385bb1b
      failing since 7 days (last pass: next-20200714, first fail: next-2020=
0715)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f18755dea0adb551085bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f18755dea0adb55=
1085bb1b
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717)
      2 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3         | arm   | lab-collabora | clang-10 | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f188dbdd6fd3a109185bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f188dbdd6fd3a109185b=
b19
      new failure (last pass: next-20200721) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3         | arm   | lab-collabora | gcc-8    | exynos_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f18839bb567d411dd85bb2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f18839bb567d411dd85b=
b2e
      failing since 0 day (last pass: next-20200630, first fail: next-20200=
721) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1882eee682cae30c85bb1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1882eee682cae30c85b=
b1b
      failing since 16 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1875d72b6d6d299585bb4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1875d72b6d6d299585b=
b4b
      new failure (last pass: next-20200721) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson8b-odroidc1             | arm   | lab-baylibre  | clang-10 | multi_v7_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f18866f99e58285d485bb44

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f18866f99e5828=
5d485bb48
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f18=
866f99e58285d485bb49
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0720)
      53 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1881e1ab6602d3bb85bb31

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1881e1ab6602d=
3bb85bb35
      failing since 2 days (last pass: next-20200717, first fail: next-2020=
0720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f18=
81e1ab6602d3bb85bb36
      failing since 2 days (last pass: next-20200717, first fail: next-2020=
0720)
      49 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1885da1e50df86c985bb1c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1885da1e50df8=
6c985bb20
      failing since 2 days (last pass: next-20200717, first fail: next-2020=
0720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f18=
85da1e50df86c985bb21
      failing since 2 days (last pass: next-20200717, first fail: next-2020=
0720)
      49 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap3-beagle-xm              | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1882c5e928dfcf4685bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1882c5e928dfcf4685b=
b27
      new failure (last pass: next-20200720) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap4-panda                  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f18822ae1404f492285bb32

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f18822ae1404f4=
92285bb36
      failing since 7 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap4-panda                  | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f188623d7bcbe119685bb67

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f188623d7bcbe1=
19685bb6b
      failing since 7 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap4-panda                  | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f188220b6fe81a3e285bb2d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f188220b6fe81a=
3e285bb31
      failing since 7 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap4-panda                  | arm   | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f18860ff87d5a941d85bb50

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f18860ff87d5a9=
41d85bb54
      failing since 7 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap4-panda                  | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187f87776b050e4385bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187f87776b050e4385b=
b19
      failing since 0 day (last pass: next-20200706, first fail: next-20200=
721) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
omap4-panda                  | arm   | lab-collabora | gcc-8    | omap2plus=
_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187f7c1a0bdf09da85bb41

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187f7c1a0bdf09da85b=
b42
      failing since 0 day (last pass: next-20200706, first fail: next-20200=
721) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1882e3de487466e085bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1882e3de487466e085b=
b23
      new failure (last pass: next-20200715) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f18756aea0adb551085bb37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f18756aea0adb551085b=
b38
      failing since 6 days (last pass: next-20200715, first fail: next-2020=
0716) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187b573aac56f20685bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187b573aac56f20685b=
b21
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1873647b8e0b0b7785bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1873647b8e0b0b7785b=
b19
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187889f6377f3e6485bb29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187889f6377f3e6485b=
b2a
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187cc727bfe968c885bb25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187cc727bfe968c885b=
b26
      failing since 5 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1886bc627bed49b385bb27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1886bc627bed49b385b=
b28
      failing since 5 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1881d68a210971bd85bb33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1881d68a210971bd85b=
b34
      failing since 5 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1886be5fc396640285bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1886be5fc396640285b=
b19
      failing since 5 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187ec0cc3c7a090e85bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187ec0cc3c7a090e85b=
b27
      failing since 2 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187eccb523950bef85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187eccb523950bef85b=
b19
      failing since 2 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f188304e682cae30c85bb3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f188304e682cae30c85b=
b3e
      failing since 5 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1885f8f87d5a941d85bb19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1885f8f87d5a941d85b=
b1a
      failing since 5 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                     | arch  | lab           | compiler | defconfig=
                    | results
-----------------------------+-------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f187ee7b523950bef85bb46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200722/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200722/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f187ee7b523950bef85b=
b47
      failing since 5 days (last pass: next-20200716, first fail: next-2020=
0717) =20
