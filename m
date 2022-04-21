Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1938250A104
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 15:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356349AbiDUNpD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 09:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbiDUNpC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 09:45:02 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADF636E20
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 06:42:12 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id c12so4895950plr.6
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tgNHdozycf0B7IcvVLy+HziyDT0ulPH5Hstd2yAsXZw=;
        b=HW7K08N5VIxbO7VJHqtho89Whcu+z+xeO6CwamQlb5/V4mi4ZSmoPG2wM/7q0tl7J2
         1zzZWhMJ0HTmqzI8uFsrDVFehrPHK9eVRe0wXjHz+Zol1781L+aI51OAMHfbji2PLXCa
         Qj3kQbzmPZ22688cWJKNFk12fRShNyNZToa2vNb39DSW05yYPc+4jdNd6wGPb16gSSTE
         jfyiT9V+D8JHUhnt8y1Y+yiqoVZ9Gm5lMmw/BI4aO9W0V+2wow4Ru0nGdy+1phux5pNJ
         O2BY0VhkZDB5euFdR2XijrfD8Fg79RIpv24V3UhGLdFFthB+H1eBSgfo5ouXcsLASv7e
         W0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tgNHdozycf0B7IcvVLy+HziyDT0ulPH5Hstd2yAsXZw=;
        b=Kov3X2TBiYkX5txrnKOYj03+hYvndy4bPKvk5QFX9lMcJb6GEE+NpGxdDJN8A4Xi9/
         MHJsH9LQol6fw2Up6T91ZNdnO+Lqs+m3F1ZmU6XHA1c+eyyeJPo+qlq5lXsXT6aXwLII
         qakfR/zKIrRA/xFllezGC97pyhgp+159LexLimmT5NkQ8hYHYY5+2o1xuNng3t3kG6zl
         tB+wQ0orRbzbKpHSWY4BNiHE5DZPaTw6enazJKEiMz77EJ+Ighz3W6PtltW0a8MEELsx
         M4PQ1LJEe5BVz9SX/5JP++UtBGsEZcMULxiXiTwZKl0RsyTuf2EKmGx7P+QUF1/O/wpM
         mreQ==
X-Gm-Message-State: AOAM533po4p+Qnq5hn4ttlGmazbACzMEM8oU7d/Vp2QP7tHWg7Wutcu9
        LoL60NRKX/DYuPvsJT7dCKJHYP7K9fni6ALT2tM=
X-Google-Smtp-Source: ABdhPJzmRAmCEnD1i1ZiyXawGYcxiyE3qaYPrVDlb+vzzjq6wJcIGAz9hW96UpJBZAqv7aEuVyQ2kg==
X-Received: by 2002:a17:903:1249:b0:154:c472:de6b with SMTP id u9-20020a170903124900b00154c472de6bmr25938977plh.38.1650548532051;
        Thu, 21 Apr 2022 06:42:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k14-20020aa7820e000000b004f7134a70cdsm23126141pfi.61.2022.04.21.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 06:42:11 -0700 (PDT)
Message-ID: <62615f33.1c69fb81.ac83c.7328@mx.google.com>
Date:   Thu, 21 Apr 2022 06:42:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc3-306-gd66bdb48aeb68
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 332 runs,
 4 regressions (v5.18-rc3-306-gd66bdb48aeb68)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 332 runs, 4 regressions (v5.18-rc3-306-gd66bdb=
48aeb68)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
da850-lcdk           | arm   | lab-baylibre  | gcc-10   | davinci_all_defco=
nfig        | 1          =

meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

rk3399-gru-kevin     | arm64 | lab-collabora | gcc-10   | defconfig+arm64-c=
hromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc3-306-gd66bdb48aeb68/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc3-306-gd66bdb48aeb68
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d66bdb48aeb6860477666aa00d5346ae9bc795c3 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
da850-lcdk           | arm   | lab-baylibre  | gcc-10   | davinci_all_defco=
nfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6260d616ee5ddb907cae06aa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6260d616ee5ddb9=
07cae06b2
        failing since 87 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-21T03:56:46.938898  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-21T03:56:46.939127  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-21T03:56:46.939292  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-21T03:56:46.982937  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxl-s905d-p230 | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...B=
IG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6260d76992701565c0ae0702

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6260d76992701565c0ae0=
703
        new failure (last pass: v5.18-rc3-274-g668a596978074) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6260d74202084899acae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayl=
ibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6260d74202084899acae0=
67f
        new failure (last pass: v5.18-rc3-274-g668a596978074) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
rk3399-gru-kevin     | arm64 | lab-collabora | gcc-10   | defconfig+arm64-c=
hromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6260d653fefdb1b518ae0728

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-3=
06-gd66bdb48aeb68/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6260d653fefdb1b518ae0766
        failing since 52 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-21T03:57:42.646889  <8>[   32.676389] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-21T03:57:43.670573  /lava-6137453/1/../bin/lava-test-case
    2022-04-21T03:57:43.681430  <8>[   33.710945] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
