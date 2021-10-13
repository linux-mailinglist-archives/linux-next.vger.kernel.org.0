Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9816E42C7C6
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 19:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhJMRks (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 13:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhJMRks (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2021 13:40:48 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4C5C061570
        for <linux-next@vger.kernel.org>; Wed, 13 Oct 2021 10:38:44 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id kk10so2812378pjb.1
        for <linux-next@vger.kernel.org>; Wed, 13 Oct 2021 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=J2YUdx8y+m31gx7nn9Tth9eeZ24GKCYc4400703AXo0=;
        b=OM4kT3l1kZlLaDKEnJqlXrIxLfM0zHvK2ihL26lWKfMIlfmq9HDIr0jTzJDI/BtNG7
         yTyRWkMY0fwcvqhXqafhLGC4XU4goD/Hb9F+Dl2HBjKUkj6aGq/terEcy0KltSsRCMPZ
         62hIKyP2ZSFybYFglCF8Gjg0FPph4oD90xQYTKaMseCcpf/bNR6/v+3IZ589mtdfnTgL
         WcMaVTGZryRB2Cu6re4wwlS0g4fBUhz5deNb9F4mqqS6ENJgyRJC24rusyQhX4rVzbmm
         ilJnvi6mveP/1frk4cJ+9OW6ZwIyxIpaiVYx9Em51YKd73xeX7hLNWKO2S0ytYHrCQN7
         ZSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=J2YUdx8y+m31gx7nn9Tth9eeZ24GKCYc4400703AXo0=;
        b=HA0qV9z+0LlH3ujZK7S3SlYkaR/RNopT1g+EAJgSRFvEOBVREsk7xrt0ioi1Gq2p7S
         RYGxLVCngyUSEwT5bXw6AnQ+4d1kwT5H+7BfYuORMLcpeNyfBnjR/PPWuAUJzHWTt+Uu
         gjs1qLi3XlkklCnMaqwOA+JB1x1d8pvZMicjhE2p4QQRo3CLjQwvxapyhgjIjfs/IoP+
         2LJcJPsR19wzJ4KolrwoWp1wG4w1JxDqjGvNQyPx3tQQVO66gZZt0P7wPAL3Ef2wrvKX
         VwhzvvqnGY/EKbukm1vAVwkrFKqV/lo3S6PleYdR3tO9ZhoA5CAw8aN6yE3GmyfmlIBf
         zGXQ==
X-Gm-Message-State: AOAM530fy5vZ4zX1EzKLNUeR8wb3uXoqGmYXITTRIeN/UNgsHxS34XXe
        ptNbeKt/HKBP/WfBsZArb5N4i4jLRprGW/2N46w=
X-Google-Smtp-Source: ABdhPJzTSvHuxkdBPeqjv2Eua3ufqlgq37ObgSunZGgud4ubuLpFQOTppL32ToHN9Cbmt3pU2V6VZQ==
X-Received: by 2002:a17:90a:4306:: with SMTP id q6mr14838589pjg.202.1634146723903;
        Wed, 13 Oct 2021 10:38:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s25sm137588pfm.138.2021.10.13.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 10:38:43 -0700 (PDT)
Message-ID: <616719a3.1c69fb81.34a39.08c7@mx.google.com>
Date:   Wed, 13 Oct 2021 10:38:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20211013
Subject: next/master baseline: 200 runs, 7 regressions (next-20211013)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 200 runs, 7 regressions (next-20211013)

Regressions Summary
-------------------

platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
beagle-xm                    | arm  | lab-baylibre | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm  | lab-baylibre | gcc-8    | omap2plus_d=
efconfig          | 1          =

imx6q-sabresd                | arm  | lab-nxp      | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-8    | oxnas_v6_de=
fconfig           | 1          =

qemu_arm-versatilepb         | arm  | lab-baylibre | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb         | arm  | lab-broonie  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb         | arm  | lab-cip      | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211013/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211013
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8006b911c90a4ec09958447d24c8a4c3538f5723 =



Test Regressions
---------------- =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
beagle-xm                    | arm  | lab-baylibre | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6166c74f48f59c477708faf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166c74f48f59c477708f=
af4
        failing since 8 days (last pass: next-20210930, first fail: next-20=
211001) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
beagle-xm                    | arm  | lab-baylibre | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6166c5fb69de6ef0c608faab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166c5fb69de6ef0c608f=
aac
        failing since 1 day (last pass: next-20211008, first fail: next-202=
11011) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
imx6q-sabresd                | arm  | lab-nxp      | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6166ce5d56e0eda7aa08faab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166ce5d56e0eda7aa08f=
aac
        failing since 352 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre | gcc-8    | oxnas_v6_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6166d9786a9f6c7e5608faae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166d9786a9f6c7e5608f=
aaf
        failing since 5 days (last pass: next-20211006, first fail: next-20=
211007) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
qemu_arm-versatilepb         | arm  | lab-baylibre | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6166df94af70e70abd08fab8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166df94af70e70abd08f=
ab9
        failing since 329 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
qemu_arm-versatilepb         | arm  | lab-broonie  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6166df88515f87f6e808face

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166df88515f87f6e808f=
acf
        failing since 329 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch | lab          | compiler | defconfig  =
                  | regressions
-----------------------------+------+--------------+----------+------------=
------------------+------------
qemu_arm-versatilepb         | arm  | lab-cip      | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6166df79515f87f6e808fac5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211013/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211013/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6166df79515f87f6e808f=
ac6
        failing since 329 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
