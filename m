Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E516F0BF3
	for <lists+linux-next@lfdr.de>; Thu, 27 Apr 2023 20:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244554AbjD0SbA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Apr 2023 14:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244459AbjD0Sa6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Apr 2023 14:30:58 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4B34233
        for <linux-next@vger.kernel.org>; Thu, 27 Apr 2023 11:30:51 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5144043d9d1so6438677a12.3
        for <linux-next@vger.kernel.org>; Thu, 27 Apr 2023 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682620250; x=1685212250;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oCwcvrujYevh9n7tyBfz+w1A7CwwP81EEeSHUCtJPb4=;
        b=MxhmOq0z1xGe44TIjfv/N19C8+yLft8+t0fl9Hbqg7zKmpFAqJ2aLuEhL5clP2eH7B
         +eHoK2YShKKrfTRzuDLq3tfTXUY1oWEeH8jQTtZDrFRCFQjWH0/Z3joRzM7YRVjmhNc3
         fav9FnvbeKMYDHgYnvZaWt9CTeWvGzYCYmF/nBumq1Uho8uRYGEanRfOIYyIC2fTRfYe
         lXQ34eJHXgSjZaBiJSOvwNkJ8PoyOtQxYhquTgBuPSGcvc/qHa/U9oseRqgHzEumuCy+
         9qzngDNlAIPAxjxznBsjH+CXEKn/pa3FvxsTstlGVJm389qRLApDf+kUY8ct1sKSPh5W
         DVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682620250; x=1685212250;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCwcvrujYevh9n7tyBfz+w1A7CwwP81EEeSHUCtJPb4=;
        b=kRCJFgTfonYbuvs72lQ/DS6MzhJhyX2D2JOz7BfQvtBNpD/h3u9y+8b2WowTeCP3e2
         TRuoKr3382wkI5NZYUe1Va8nWujoJmHUTO6WATijbWUcB0tCWHBvv17/L0w1rt6dPuac
         ou8l30d/m76n6A9WMdbJyBfmPJ03rOvWVJwK6d5Dn5gWY33QHSvNjaMv7d9Ee/KSn50v
         L9Yv8Axiya9ed116XkWIhAyJHhtLzDcnTv/tvhjFKIXospACYOtp96mVawuQ3dhb2/oX
         usccYOz86jc6gHtD1L0SXITJ9P4+NTMDjUEQ8DfInVnwNLVuYOEMx4Y24ZdUhDxu7lDu
         KsQA==
X-Gm-Message-State: AC+VfDw1QZrgleXpMPpp8N17dGmLdkLyXoOgScS+5puq3Zw0B8iCRs4N
        XwFbgs+72LhyrA/hEw3URrhyHVz3WhnFlk/vTWs=
X-Google-Smtp-Source: ACHHUZ7zrWcdyzNsdhEgHUiYQ3L1uF4As1+/U10VKvDVOmLwV5vDtB0rbZAi6FRa2Zx7gwOX7L5veg==
X-Received: by 2002:a17:90b:3446:b0:247:802a:53a5 with SMTP id lj6-20020a17090b344600b00247802a53a5mr2571606pjb.40.1682620248449;
        Thu, 27 Apr 2023 11:30:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090ac21000b002340d317f3esm74644pjt.52.2023.04.27.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 11:30:47 -0700 (PDT)
Message-ID: <644abf57.170a0220.cda26.0553@mx.google.com>
Date:   Thu, 27 Apr 2023 11:30:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-8745-gc94d3163e00b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 398 runs,
 69 regressions (v6.3-8745-gc94d3163e00b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 398 runs, 69 regressions (v6.3-8745-gc94d3163e=
00b)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-8745-gc94d3163e00b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-8745-gc94d3163e00b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c94d3163e00b9e4412e984ba19a578ec2022f3c6 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644a855485495ef7642e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a855485495ef7642e8=
5eb
        failing since 199 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d265fb1054d222e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-a=
m57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-a=
m57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d265fb1054d222e8=
5f9
        failing since 197 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86dc479bb211112e8629

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86dc479bb211112e862e
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:29:37.856774  + set +x

    2023-04-27T14:29:37.863515  <8>[   10.893501] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10142921_1.4.2.3.1>

    2023-04-27T14:29:37.967746  / # #

    2023-04-27T14:29:38.070378  export SHELL=3D/bin/sh

    2023-04-27T14:29:38.071256  #

    2023-04-27T14:29:38.173089  / # export SHELL=3D/bin/sh. /lava-10142921/=
environment

    2023-04-27T14:29:38.174073  =


    2023-04-27T14:29:38.275475  / # . /lava-10142921/environment/lava-10142=
921/bin/lava-test-runner /lava-10142921/1

    2023-04-27T14:29:38.276589  =


    2023-04-27T14:29:38.282963  / # /lava-10142921/bin/lava-test-runner /la=
va-10142921/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86d8479bb211112e8613

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a86d8479bb211112e8616
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:29:10.043746  /usr/bin/tpm2_getcap

    2023-04-27T14:29:10.085798  <3>[   12.660927] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:11.123930  <3>[   13.698926] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:12.160700  <3>[   14.735928] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:12.978454  <6>[   15.550064] udevd (116) used greatest=
 stack depth: 13448 bytes left

    2023-04-27T14:29:13.198026  <3>[   15.772927] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:14.234630  <3>[   16.809926] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:15.271851  <3>[   17.846928] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:16.311905  <3>[   18.886925] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:17.366143  <3>[   19.940927] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644a87396e7ad7f9082e8619

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a87396e7ad7f9082e861c
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:31:00.338432  /usr/bin/tpm2_getcap

    2023-04-27T14:31:00.361802  <3>[   13.870899] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:31:01.385742  <3>[   14.895245] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:31:01.466713  <3>[   14.975926] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:31:02.409768  <3>[   15.919295] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:31:03.433372  <3>[   16.942931] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:31:03.495179  <6>[   17.004000] udevd (149) used greatest=
 stack depth: 13144 bytes left

    2023-04-27T14:31:03.501276  <6>[   17.010545] udevd (141) used greatest=
 stack depth: 12656 bytes left

    2023-04-27T14:31:04.457431  <3>[   17.966892] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:31:05.481406  <3>[   18.990259] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a87396e7ad7f9082e861e
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:30:58.870761  + set +x<8>[   12.378640] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10142958_1.4.2.3.1>

    2023-04-27T14:30:58.870881  =


    2023-04-27T14:30:58.975004  / # #

    2023-04-27T14:30:59.075785  export SHELL=3D/bin/sh

    2023-04-27T14:30:59.076540  #

    2023-04-27T14:30:59.178209  / # export SHELL=3D/bin/sh. /lava-10142958/=
environment

    2023-04-27T14:30:59.179081  =


    2023-04-27T14:30:59.280982  / # . /lava-10142958/environment/lava-10142=
958/bin/lava-test-runner /lava-10142958/1

    2023-04-27T14:30:59.282244  =


    2023-04-27T14:30:59.286855  / # /lava-10142958/bin/lava-test-runner /la=
va-10142958/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86eb60cf9ffb992e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86eb60cf9ffb992e85fa
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:29:47.783489  <8>[   10.569233] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10142959_1.4.2.3.1>

    2023-04-27T14:29:47.786329  + set +x

    2023-04-27T14:29:47.888145  =


    2023-04-27T14:29:47.988834  / # #export SHELL=3D/bin/sh

    2023-04-27T14:29:47.989089  =


    2023-04-27T14:29:48.089658  / # export SHELL=3D/bin/sh. /lava-10142959/=
environment

    2023-04-27T14:29:48.089907  =


    2023-04-27T14:29:48.190506  / # . /lava-10142959/environment/lava-10142=
959/bin/lava-test-runner /lava-10142959/1

    2023-04-27T14:29:48.190895  =


    2023-04-27T14:29:48.195609  / # /lava-10142959/bin/lava-test-runner /la=
va-10142959/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644a85aafc73f15ed22e8667

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a85aafc73f15ed22e8697
        failing since 2 days (last pass: v6.3-rc7-226-gf05a2341f2478, first=
 fail: v6.3-225-g0a6daccdbdd65)

    2023-04-27T14:24:17.936909  + set +x
    2023-04-27T14:24:17.940703  <8>[   18.322339] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 394278_1.5.2.4.1>
    2023-04-27T14:24:18.074940  / # #
    2023-04-27T14:24:18.178209  export SHELL=3D/bin/sh
    2023-04-27T14:24:18.179096  #
    2023-04-27T14:24:18.281204  / # export SHELL=3D/bin/sh. /lava-394278/en=
vironment
    2023-04-27T14:24:18.282066  =

    2023-04-27T14:24:18.384395  / # . /lava-394278/environment/lava-394278/=
bin/lava-test-runner /lava-394278/1
    2023-04-27T14:24:18.385784  =

    2023-04-27T14:24:18.392021  / # /lava-394278/bin/lava-test-runner /lava=
-394278/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8812f8139d78d22e8608

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a8812f8139d78d22e860d
        failing since 105 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-04-27T14:34:39.937474  / # #

    2023-04-27T14:34:40.039672  export SHELL=3D/bin/sh

    2023-04-27T14:34:40.040385  #

    2023-04-27T14:34:40.141766  / # export SHELL=3D/bin/sh. /lava-10142874/=
environment

    2023-04-27T14:34:40.142476  =


    2023-04-27T14:34:40.243923  / # . /lava-10142874/environment/lava-10142=
874/bin/lava-test-runner /lava-10142874/1

    2023-04-27T14:34:40.245004  =


    2023-04-27T14:34:40.261773  / # /lava-10142874/bin/lava-test-runner /la=
va-10142874/1

    2023-04-27T14:34:40.373683  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-27T14:34:40.374192  + cd /lava-10142874/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8952e0b5b617bc2e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8952e0b5b617bc2e8=
5fb
        failing since 59 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86169d2efa481e2e8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a86169d2efa481e2e8=
65a
        failing since 95 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a840ca53ea3254b2e862b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a840da53ea3254b2e8630
        failing since 100 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-27T14:17:31.386240  <8>[   20.729708] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537376_1.5.2.4.1>
    2023-04-27T14:17:31.497350  / # #
    2023-04-27T14:17:31.602898  export SHELL=3D/bin/sh
    2023-04-27T14:17:31.604382  #
    2023-04-27T14:17:31.707437  / # export SHELL=3D/bin/sh. /lava-3537376/e=
nvironment
    2023-04-27T14:17:31.708567  =

    2023-04-27T14:17:31.810990  / # . /lava-3537376/environment/lava-353737=
6/bin/lava-test-runner /lava-3537376/1
    2023-04-27T14:17:31.812803  =

    2023-04-27T14:17:31.817843  / # /lava-3537376/bin/lava-test-runner /lav=
a-3537376/1
    2023-04-27T14:17:31.914702  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644a853940f073aee62e8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a853940f073aee62e863c
        failing since 100 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-27T14:22:42.749644  <8>[   14.900291] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537405_1.5.2.4.1>
    2023-04-27T14:22:42.861949  / # #
    2023-04-27T14:22:42.965508  export SHELL=3D/bin/sh
    2023-04-27T14:22:42.966588  #
    2023-04-27T14:22:43.068702  / # export SHELL=3D/bin/sh. /lava-3537405/e=
nvironment
    2023-04-27T14:22:43.069944  =

    2023-04-27T14:22:43.172549  / # . /lava-3537405/environment/lava-353740=
5/bin/lava-test-runner /lava-3537405/1
    2023-04-27T14:22:43.174543  =

    2023-04-27T14:22:43.178940  / # /lava-3537405/bin/lava-test-runner /lav=
a-3537405/1
    2023-04-27T14:22:43.266290  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644a85b1ac053ddabf2e85fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a85b1ac053ddabf2e8603
        failing since 100 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-27T14:24:41.929182  <8>[   16.765052] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537415_1.5.2.4.1>
    2023-04-27T14:24:42.038109  / # #
    2023-04-27T14:24:42.141491  export SHELL=3D/bin/sh
    2023-04-27T14:24:42.142525  #
    2023-04-27T14:24:42.244529  / # export SHELL=3D/bin/sh. /lava-3537415/e=
nvironment
    2023-04-27T14:24:42.245499  =

    2023-04-27T14:24:42.347859  / # . /lava-3537415/environment/lava-353741=
5/bin/lava-test-runner /lava-3537415/1
    2023-04-27T14:24:42.349519  =

    2023-04-27T14:24:42.354208  / # /lava-3537415/bin/lava-test-runner /lav=
a-3537415/1
    2023-04-27T14:24:42.438063  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644a863d9ec9aa5d872e863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a863d9ec9aa5d872e8643
        failing since 100 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-27T14:26:47.580533  <8>[   14.786345] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537449_1.5.2.4.1>
    2023-04-27T14:26:47.692362  / # #
    2023-04-27T14:26:47.796673  export SHELL=3D/bin/sh
    2023-04-27T14:26:47.797855  #
    2023-04-27T14:26:47.900163  / # export SHELL=3D/bin/sh. /lava-3537449/e=
nvironment
    2023-04-27T14:26:47.901323  =

    2023-04-27T14:26:48.003773  / # . /lava-3537449/environment/lava-353744=
9/bin/lava-test-runner /lava-3537449/1
    2023-04-27T14:26:48.005515  =

    2023-04-27T14:26:48.010247  / # /lava-3537449/bin/lava-test-runner /lav=
a-3537449/1
    2023-04-27T14:26:48.107256  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86b575962e3d992e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86b575962e3d992e85eb
        failing since 100 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-27T14:28:58.120709  + set +x<8>[   14.381373] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3537455_1.5.2.4.1>
    2023-04-27T14:28:58.121457  =

    2023-04-27T14:28:58.232271  / # #
    2023-04-27T14:28:58.336084  export SHELL=3D/bin/sh
    2023-04-27T14:28:58.337255  #
    2023-04-27T14:28:58.439851  / # export SHELL=3D/bin/sh. /lava-3537455/e=
nvironment
    2023-04-27T14:28:58.441032  =

    2023-04-27T14:28:58.543396  / # . /lava-3537455/environment/lava-353745=
5/bin/lava-test-runner /lava-3537455/1
    2023-04-27T14:28:58.545177  =

    2023-04-27T14:28:58.550274  / # /lava-3537455/bin/lava-test-runner /lav=
a-3537455/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/644a880aa5dab4be1d2e8621

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644a880aa5dab4b=
e1d2e8628
        failing since 55 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-27T14:34:30.947571  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-27T14:34:30.948717  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b52400 pointer offset 4 size 512
    2023-04-27T14:34:30.949188  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-27T14:34:30.949655  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-27T14:34:30.950138  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf474000 allocated at load_module+0x898/0=
x1b10
    2023-04-27T14:34:30.951311  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-27T14:34:31.042329  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-27T14:34:31.043014  kern  :emerg : Process udevd (pid: 69, stac=
k limit =3D 0x1a7b745a)
    2023-04-27T14:34:31.043783  kern  :emerg : Stack: (0xc8911cf8 to 0xc891=
2000)
    2023-04-27T14:34:31.044197  kern  :emerg : 1ce0:                       =
                                c4b52400 c0773880 =

    ... (7 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644a880aa5dab4b=
e1d2e8629
        failing since 458 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-27T14:34:30.856804  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:2  pfn:c3400
    2023-04-27T14:34:30.857745  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:2  pfn:c3800
    2023-04-27T14:34:30.858214  kern  :alert : 8<--- cut here ---
    2023-04-27T14:34:30.858670  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-27T14:34:30.859063  kern  :alert : [00000060] *pgd=3Dc4a48831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-27T14:34:30.859421  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-27T14:34:30.899941  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8910000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-27T14:34:30.900865  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-27T14:34:30.901593  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-27T14:34:30.902605  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86ea11a711478c2e8608

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a86ea11a711478c2e860b
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:29:33.750341  est-case

    2023-04-27T14:29:33.753449  /usr/bin/tpm2_getcap

    2023-04-27T14:29:33.789401  <3>[    9.686201] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:34.837626  <3>[   10.734215] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:35.868482  <3>[   11.764205] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:36.897713  <3>[   12.794204] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:37.927580  <3>[   13.824205] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:38.957454  <3>[   14.854204] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:39.986946  <3>[   15.883204] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:41.015273  <3>[   16.911203] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a87a9fc2906cc352e862f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a87a9fc2906cc352e8632
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:32:48.621331  /usr/bin/tpm2_getcap

    2023-04-27T14:32:48.656887  <3>[    9.290413] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:49.686193  <3>[   10.320452] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:50.352795  <3>[   10.987410] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:50.710874  <3>[   11.344416] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:51.741223  <3>[   12.375451] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:52.770443  <3>[   13.403461] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:53.797822  <3>[   14.432442] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:54.826638  <3>[   15.460426] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:32:55.855250  <3>[   16.489417] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86e180f0825a192e8616

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a86e180f0825a192e8625
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:29:21.290705  /usr/bin/tpm2_getcap

    2023-04-27T14:29:21.312231  <3>[   11.609846] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:22.340792  <3>[   12.637845] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:23.368099  <3>[   13.665845] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:24.395793  <3>[   14.693841] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:24.653341  <3>[   14.950844] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:25.419571  <3>[   15.716845] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:26.447092  <3>[   16.744844] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:27.472999  <3>[   17.770845] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:28.500132  <3>[   18.797845] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86c243b8ed64b62e861d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a86c243b8ed64b62e862c
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:29:07.251934  /usr/bin/tpm2_getcap

    2023-04-27T14:29:07.275156  <3>[   11.715897] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:08.301062  <3>[   12.741896] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:09.329345  <3>[   13.769900] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:10.355301  <3>[   14.795898] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:10.510736  <3>[   14.950907] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:11.377706  <3>[   15.817905] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:12.404196  <3>[   16.844899] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:13.432086  <3>[   17.872898] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:14.460484  <3>[   18.900905] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86cd3f3105dc042e862d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86cd3f3105dc042e8632
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:29:26.721847  + set +x

    2023-04-27T14:29:26.728285  <8>[   11.272630] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10142917_1.4.2.3.1>

    2023-04-27T14:29:26.833041  / # #

    2023-04-27T14:29:26.933670  export SHELL=3D/bin/sh

    2023-04-27T14:29:26.933885  #

    2023-04-27T14:29:27.034445  / # export SHELL=3D/bin/sh. /lava-10142917/=
environment

    2023-04-27T14:29:27.034661  =


    2023-04-27T14:29:27.135213  / # . /lava-10142917/environment/lava-10142=
917/bin/lava-test-runner /lava-10142917/1

    2023-04-27T14:29:27.135578  =


    2023-04-27T14:29:27.139983  / # /lava-10142917/bin/lava-test-runner /la=
va-10142917/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86c8479bb211112e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86c8479bb211112e85eb
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:29:14.950956  + set +x

    2023-04-27T14:29:14.957994  <8>[   10.819645] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10142925_1.4.2.3.1>

    2023-04-27T14:29:15.062369  / # #

    2023-04-27T14:29:15.164718  export SHELL=3D/bin/sh

    2023-04-27T14:29:15.165420  #

    2023-04-27T14:29:15.266920  / # export SHELL=3D/bin/sh. /lava-10142925/=
environment

    2023-04-27T14:29:15.267619  =


    2023-04-27T14:29:15.368910  / # . /lava-10142925/environment/lava-10142=
925/bin/lava-test-runner /lava-10142925/1

    2023-04-27T14:29:15.369295  =


    2023-04-27T14:29:15.373825  / # /lava-10142925/bin/lava-test-runner /la=
va-10142925/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644a86dc80f0825a192e85fd

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86dc80f0825a192e8601
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:29:29.884032  + set +x<8>[   10.779668] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10142931_1.4.2.3.1>

    2023-04-27T14:29:29.884479  =


    2023-04-27T14:29:29.991644  / # #

    2023-04-27T14:29:30.093786  export SHELL=3D/bin/sh

    2023-04-27T14:29:30.094519  #

    2023-04-27T14:29:30.196108  / # export SHELL=3D/bin/sh. /lava-10142931/=
environment

    2023-04-27T14:29:30.196800  =


    2023-04-27T14:29:30.298152  / # . /lava-10142931/environment/lava-10142=
931/bin/lava-test-runner /lava-10142931/1

    2023-04-27T14:29:30.299243  =


    2023-04-27T14:29:30.304336  / # /lava-10142931/bin/lava-test-runner /la=
va-10142931/1
 =

    ... (12 line(s) more)  =


  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a86dc80f0825a192e8602
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:29:31.356044  /usr/bin/tpm2_getcap

    2023-04-27T14:29:31.377576  <3>[   12.274281] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:32.401649  <3>[   13.298804] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:33.426451  <3>[   14.323646] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:34.052777  <3>[   14.949324] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:34.451535  <3>[   15.348320] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:34.480874  <6>[   15.377545] udevd (133) used greatest=
 stack depth: 12656 bytes left

    2023-04-27T14:29:35.477869  <3>[   16.374299] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:36.502208  <3>[   17.399726] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:37.526614  <3>[   18.423302] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d6ce0885b55bd2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d6ce0885b55bd2e8=
5e9
        failing since 171 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a83f9d9021fa9a52e85e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-imx=
6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-imx=
6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a83f9d9021fa9a52e85ed
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c)

    2023-04-27T14:16:59.574213  / # #
    2023-04-27T14:16:59.675928  export SHELL=3D/bin/sh
    2023-04-27T14:16:59.676282  #
    2023-04-27T14:16:59.777649  / # export SHELL=3D/bin/sh. /lava-3537375/e=
nvironment
    2023-04-27T14:16:59.778018  =

    2023-04-27T14:16:59.879385  / # . /lava-3537375/environment/lava-353737=
5/bin/lava-test-runner /lava-3537375/1
    2023-04-27T14:16:59.880035  =

    2023-04-27T14:16:59.886420  / # /lava-3537375/bin/lava-test-runner /lav=
a-3537375/1
    2023-04-27T14:16:59.982335  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-27T14:16:59.982597  + cd /lava-3537375/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644a84eec511df49a22e863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-=
dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-=
dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a84eec511df49a22e8642
        new failure (last pass: v6.0-rc6-212-g9e152597d89ac)

    2023-04-27T14:21:10.635405  + set<8>[   14.822647] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3537398_1.5.2.4.1>
    2023-04-27T14:21:10.635636   +x
    2023-04-27T14:21:10.740913  / # #
    2023-04-27T14:21:10.842587  export SHELL=3D/bin/sh
    2023-04-27T14:21:10.842939  #
    2023-04-27T14:21:10.944229  / # export SHELL=3D/bin/sh. /lava-3537398/e=
nvironment
    2023-04-27T14:21:10.944597  =

    2023-04-27T14:21:11.045935  / # . /lava-3537398/environment/lava-353739=
8/bin/lava-test-runner /lava-3537398/1
    2023-04-27T14:21:11.046540  =

    2023-04-27T14:21:11.052978  / # /lava-3537398/bin/lava-test-runner /lav=
a-3537398/1 =

    ... (24 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644a856d083fece0042e866e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a856d083fece0042e8671
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c)

    2023-04-27T14:23:13.783913  / # #
    2023-04-27T14:23:13.887069  export SHELL=3D/bin/sh
    2023-04-27T14:23:13.888045  #
    2023-04-27T14:23:13.989928  / # export SHELL=3D/bin/sh. /lava-3537411/e=
nvironment
    2023-04-27T14:23:13.990876  =

    2023-04-27T14:23:14.092817  / # . /lava-3537411/environment/lava-353741=
1/bin/lava-test-runner /lava-3537411/1
    2023-04-27T14:23:14.094249  =

    2023-04-27T14:23:14.111523  / # /lava-3537411/bin/lava-test-runner /lav=
a-3537411/1
    2023-04-27T14:23:14.191680  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-27T14:23:14.192375  + cd /lava-3537411/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644a861eec1ec6a9b82e860b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-imx6q-=
var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-imx6q-=
var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a861eec1ec6a9b82e8610
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c)

    2023-04-27T14:26:02.850347  / # #
    2023-04-27T14:26:02.952406  export SHELL=3D/bin/sh
    2023-04-27T14:26:02.953037  #
    2023-04-27T14:26:03.054466  / # export SHELL=3D/bin/sh. /lava-3537444/e=
nvironment
    2023-04-27T14:26:03.055052  =

    2023-04-27T14:26:03.156473  / # . /lava-3537444/environment/lava-353744=
4/bin/lava-test-runner /lava-3537444/1
    2023-04-27T14:26:03.157276  =

    2023-04-27T14:26:03.161727  / # /lava-3537444/bin/lava-test-runner /lav=
a-3537444/1
    2023-04-27T14:26:03.225614  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-27T14:26:03.259543  + cd /lava-3537444/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86710b2736b6752e8628

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86710b2736b6752e862d
        new failure (last pass: v6.0-rc6-212-g9e152597d89ac)

    2023-04-27T14:27:51.179532  / # #
    2023-04-27T14:27:51.281417  export SHELL=3D/bin/sh
    2023-04-27T14:27:51.281796  #
    2023-04-27T14:27:51.383154  / # export SHELL=3D/bin/sh. /lava-3537453/e=
nvironment
    2023-04-27T14:27:51.383509  =

    2023-04-27T14:27:51.484901  / # . /lava-3537453/environment/lava-353745=
3/bin/lava-test-runner /lava-3537453/1
    2023-04-27T14:27:51.485693  =

    2023-04-27T14:27:51.491884  / # /lava-3537453/bin/lava-test-runner /lav=
a-3537453/1
    2023-04-27T14:27:51.586776  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-27T14:27:51.587032  + cd /lava-3537453/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d2d5fb1054d222e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6=
q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6=
q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d2d5fb1054d222e8=
60e
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d309ffddd3a232e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d309ffddd3a232e8=
611
        failing since 224 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a842eb1a67c4e6b2e860d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6sx-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6sx-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a842eb1a67c4e6b2e8610
        failing since 112 days (last pass: v6.1-rc4-405-g5cc6cef624e2, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-27T14:17:58.487410  <8>[   38.334968] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1209979_1.5.2.4.1>
    2023-04-27T14:17:58.592995  / # #
    2023-04-27T14:17:59.753263  export SHELL=3D/bin/sh
    2023-04-27T14:17:59.758927  #
    2023-04-27T14:18:01.306860  / # export SHELL=3D/bin/sh. /lava-1209979/e=
nvironment
    2023-04-27T14:18:01.312623  =

    2023-04-27T14:18:01.312962  / # . /lava-1209979/environment
    2023-04-27T14:18:04.135042  /lava-1209979/bin/lava-test-runner /lava-12=
09979/1
    2023-04-27T14:18:04.141123  / # /lava-1209979/bin<4>[   42.177792] etna=
viv-gpu 1800000.gpu: deferred probe timeout, ignoring dependency
    2023-04-27T14:18:04.141382  <4>[   42.185516] etnaviv-gpu: probe of 180=
0000.gpu failed with error -110 =

    ... (34 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a845060eef5d4f92e85f9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a845060eef5d4f92e85fc
        failing since 112 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-27T14:18:28.378794  + set +x
    2023-04-27T14:18:28.379932  <8>[   59.270436] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1209978_1.5.2.4.1>
    2023-04-27T14:18:28.489233  / # #
    2023-04-27T14:18:29.648779  export SHELL=3D/bin/sh
    2023-04-27T14:18:29.654405  #
    2023-04-27T14:18:31.201010  / # export SHELL=3D/bin/sh. /lava-1209978/e=
nvironment
    2023-04-27T14:18:31.206438  =

    2023-04-27T14:18:34.026946  / # . /lava-1209978/environment/lava-120997=
8/bin/lava-test-runner /lava-1209978/1
    2023-04-27T14:18:34.032970  =

    2023-04-27T14:18:34.033541  / # /lava-1209978/bin/lava-test-runner /lav=
a-1209978/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a841fb1a67c4e6b2e85ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a841fb1a67c4e6b2e85f1
        failing since 112 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-27T14:17:27.635540  <8>[   29.909632] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1209977_1.5.2.4.1>
    2023-04-27T14:17:27.740995  / # #
    2023-04-27T14:17:28.901312  export SHELL=3D/bin/sh
    2023-04-27T14:17:28.906998  #
    2023-04-27T14:17:30.454001  / # export SHELL=3D/bin/sh. /lava-1209977/e=
nvironment
    2023-04-27T14:17:30.459586  =

    2023-04-27T14:17:33.280645  / # . /lava-1209977/environment/lava-120997=
7/bin/lava-test-runner /lava-1209977/1
    2023-04-27T14:17:33.286729  =

    2023-04-27T14:17:33.295839  / # /lava-1209977/bin/lava-test-runner /lav=
a-1209977/1
    2023-04-27T14:17:33.343871  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a843c9c449511732e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a843c9c449511732e85e9
        failing since 112 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-27T14:18:20.245543  + set +x<8>[   56.275283] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1209976_1.5.2.4.1>
    2023-04-27T14:18:20.245860  =

    2023-04-27T14:18:20.355418  / # #
    2023-04-27T14:18:21.515460  export SHELL=3D/bin/sh
    2023-04-27T14:18:21.521101  #
    2023-04-27T14:18:21.521429  / # export SHELL=3D/bin/sh
    2023-04-27T14:18:23.069218  / # . /lava-1209976/environment
    2023-04-27T14:18:25.896099  /lava-1209976/bin/lava-test-runner /lava-12=
09976/1
    2023-04-27T14:18:25.902200  . /lava-1209976/environment
    2023-04-27T14:18:25.902501  / # /lava-1209976/bin/lava-test-runner /lav=
a-1209976/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a83f9d9021fa9a52e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a83f9d9021fa9a52e8=
5f4
        new failure (last pass: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a83fbd9021fa9a52e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a83fbd9021fa9a52e8=
5f7
        new failure (last pass: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644a86d6479bb211112e85fd

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a86d6479bb211112e8601
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-27T14:29:20.776643  <8>[   11.702190] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10142914_1.4.2.3.1>

    2023-04-27T14:29:20.881131  / # #

    2023-04-27T14:29:20.981741  export SHELL=3D/bin/sh

    2023-04-27T14:29:20.981945  #

    2023-04-27T14:29:21.082448  / # export SHELL=3D/bin/sh. /lava-10142914/=
environment

    2023-04-27T14:29:21.082660  =


    2023-04-27T14:29:21.183167  / # . /lava-10142914/environment/lava-10142=
914/bin/lava-test-runner /lava-10142914/1

    2023-04-27T14:29:21.183500  =


    2023-04-27T14:29:21.188596  / # /lava-10142914/bin/lava-test-runner /la=
va-10142914/1

    2023-04-27T14:29:21.194622  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =


  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a86d6479bb211112e8602
        failing since 2 days (last pass: v6.3-225-g0a6daccdbdd65, first fai=
l: v6.3-1432-g527c4dda86b8)

    2023-04-27T14:29:22.237414  /usr/bin/tpm2_getcap

    2023-04-27T14:29:22.260546  <3>[   13.187118] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:23.284552  <3>[   14.211158] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:24.310933  <3>[   15.237590] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:25.334827  <3>[   16.261466] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:25.381591  <6>[   16.308027] udevd (132) used greatest=
 stack depth: 13144 bytes left

    2023-04-27T14:29:25.387977  <6>[   16.314573] udevd (146) used greatest=
 stack depth: 13120 bytes left

    2023-04-27T14:29:26.040601  <3>[   16.967153] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:26.359121  <3>[   17.285134] tpm tpm0: Operation Timed=
 out

    2023-04-27T14:29:27.382962  <3>[   18.309560] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644a86fad82ebbf3e22e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-odroi=
d-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-odroi=
d-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a86fad82ebbf3e22e8=
5e9
        new failure (last pass: v6.3-1432-g527c4dda86b8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8dc177ea4ab55d2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8dc177ea4ab55d2e8=
5f9
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8f25fb1fbced7e2e860e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8f25fb1fbced7e2e8=
60f
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d1573c771f4462e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d1573c771f4462e8=
61b
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d58f46e028c1b2e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d58f46e028c1b2e8=
603
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d95bb519c2bcc2e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d95bb519c2bcc2e8=
5eb
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d111c68673b3b2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d111c68673b3b2e8=
5fd
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d7c013da264152e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d7c013da264152e8=
60a
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8efd2ba682b1b82e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8efd2ba682b1b82e8=
5ea
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d141c68673b3b2e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d141c68673b3b2e8=
603
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d91fbe8dae3702e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d91fbe8dae3702e8=
5ed
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8dbdb26adff18b2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8dbdb26adff18b2e8=
5f3
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8d1273c771f4462e8614

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8d1273c771f4462e8=
615
        failing since 197 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644a87710e1e77e4902e85e7

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644a87710e1e77e=
4902e85ef
        new failure (last pass: v6.3-5614-gbe56a31d3d65)
        1 lines

    2023-04-27T14:32:09.930649  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 00000000, epc =3D=3D 00000000, ra =3D=
=3D 8023f1b0
    2023-04-27T14:32:09.930784  =


    2023-04-27T14:32:09.950698  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-04-27T14:32:09.950773  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a84ddf9743907e42e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a84ddf9743907e42e8=
5f8
        failing since 133 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a83d97adf558a1c2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a83d97adf558a1c2e8=
5f0
        failing since 133 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644a84d1d8913294512e8620

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157=
c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157=
c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a84d1d8913294512e8625
        failing since 85 days (last pass: v6.0-11312-g1778d6da389c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-04-27T14:20:58.431678  <8>[   13.830400] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537399_1.5.2.4.1>
    2023-04-27T14:20:58.537536  / # #
    2023-04-27T14:20:58.639242  export SHELL=3D/bin/sh
    2023-04-27T14:20:58.639712  #
    2023-04-27T14:20:58.741532  / # export SHELL=3D/bin/sh. /lava-3537399/e=
nvironment
    2023-04-27T14:20:58.741901  =

    2023-04-27T14:20:58.843420  / # . /lava-3537399/environment/lava-353739=
9/bin/lava-test-runner /lava-3537399/1
    2023-04-27T14:20:58.844745  =

    2023-04-27T14:20:58.848718  / # /lava-3537399/bin/lava-test-runner /lav=
a-3537399/1
    2023-04-27T14:20:58.923684  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644a854945cf7c656e2e8611

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a854945cf7c656e2e8616
        failing since 85 days (last pass: v6.0-11312-g1778d6da389c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-04-27T14:22:46.429910  <8>[   16.336693] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537424_1.5.2.4.1>
    2023-04-27T14:22:46.537198  / # #
    2023-04-27T14:22:46.639023  export SHELL=3D/bin/sh
    2023-04-27T14:22:46.639429  #
    2023-04-27T14:22:46.740813  / # export SHELL=3D/bin/sh. /lava-3537424/e=
nvironment
    2023-04-27T14:22:46.741206  =

    2023-04-27T14:22:46.842888  / # . /lava-3537424/environment/lava-353742=
4/bin/lava-test-runner /lava-3537424/1
    2023-04-27T14:22:46.844713  =

    2023-04-27T14:22:46.850022  / # /lava-3537424/bin/lava-test-runner /lav=
a-3537424/1
    2023-04-27T14:22:46.920052  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8599e572272cca2e8651

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm32m=
p157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm32m=
p157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a8599e572272cca2e8656
        failing since 85 days (last pass: v5.19-3879-ge7dffa5317766, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-04-27T14:24:18.373478  <8>[   13.760412] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537440_1.5.2.4.1>
    2023-04-27T14:24:18.479307  / # #
    2023-04-27T14:24:18.581592  export SHELL=3D/bin/sh
    2023-04-27T14:24:18.581966  #
    2023-04-27T14:24:18.683069  / # export SHELL=3D/bin/sh. /lava-3537440/e=
nvironment
    2023-04-27T14:24:18.683631  =

    2023-04-27T14:24:18.785410  / # . /lava-3537440/environment/lava-353744=
0/bin/lava-test-runner /lava-3537440/1
    2023-04-27T14:24:18.786702  =

    2023-04-27T14:24:18.790610  / # /lava-3537440/bin/lava-test-runner /lav=
a-3537440/1
    2023-04-27T14:24:18.866505  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a85fdc850fe37942e85eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a85fdc850fe37942e85f0
        failing since 85 days (last pass: v5.19-rc5-345-gd3298a6516a4, firs=
t fail: v6.2-rc6-289-g1b7183933813)

    2023-04-27T14:25:41.054000  <8>[   16.715294] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537454_1.5.2.4.1>
    2023-04-27T14:25:41.159558  / # #
    2023-04-27T14:25:41.261013  export SHELL=3D/bin/sh
    2023-04-27T14:25:41.261364  #
    2023-04-27T14:25:41.362549  / # export SHELL=3D/bin/sh. /lava-3537454/e=
nvironment
    2023-04-27T14:25:41.362909  =

    2023-04-27T14:25:41.464166  / # . /lava-3537454/environment/lava-353745=
4/bin/lava-test-runner /lava-3537454/1
    2023-04-27T14:25:41.464717  =

    2023-04-27T14:25:41.469086  / # /lava-3537454/bin/lava-test-runner /lav=
a-3537454/1
    2023-04-27T14:25:41.537041  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644a84eac511df49a22e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-sun=
8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-sun=
8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a84eac511df49a22e8=
62d
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644a866c0b2736b6752e8625

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-b=
ananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-b=
ananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a866c0b2736b6752e8=
626
        new failure (last pass: v6.0-rc6-212-g9e152597d89ac) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644a87cf901e6e6b142e868d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a87cf901e6e6b142e8=
68e
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/644a89454662dbcd982e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-sun8i-=
h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-sun8i-=
h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a89454662dbcd982e8=
619
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644a8aba2cee56c49c2e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a8aba2cee56c49c2e8=
617
        new failure (last pass: v6.0-rc6-212-g9e152597d89ac) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644a83258fe264d04a2e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bana=
napi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bana=
napi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a83258fe264d04a2e8=
5eb
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644aaafb3481cac24b2e8672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-8745-g=
c94d3163e00b/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aaafb3481cac24b2e8=
673
        new failure (last pass: v6.3-5614-gbe56a31d3d65) =

 =20
