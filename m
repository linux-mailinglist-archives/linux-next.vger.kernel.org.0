Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD902666994
	for <lists+linux-next@lfdr.de>; Thu, 12 Jan 2023 04:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjALDZi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Jan 2023 22:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjALDZh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Jan 2023 22:25:37 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7A95FA5
        for <linux-next@vger.kernel.org>; Wed, 11 Jan 2023 19:25:35 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cx21-20020a17090afd9500b00228f2ecc6dbso1533566pjb.0
        for <linux-next@vger.kernel.org>; Wed, 11 Jan 2023 19:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fdl4f03mXSSuEh38pLIlayw3sMDrGR53iHOIbFw0GMs=;
        b=2Plbx2ucmukvK/86r8edpRmYCI75uJk/vkeBtQzmlG86wDDjqa7rhX7m4D2e45A0yw
         s1gtvYzTko2Pu6PUVQs0YSmnk9ePUKzaT3W3VTnH9/NI/rzVh7rD350X/16F8JFnQ5ZB
         x/4mpl/psmLOAH51hVw8cXsRnuoCof/joy7OXzW7h/oy6aV/wz5mmG4JpOfoJxndeoFh
         bZVPkAaDubfYfi+mnQxJRa4SuBr8jc3x+1v3TkLtPbK/kwWTzSyymyUDUrlumnxSfW/p
         hnyd42Vahn8OBD74mAzmj0TN09v/8hCC+ZOTBahDF2LT7ZYU/6AkjPjMiKwmblAbZxW6
         hk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdl4f03mXSSuEh38pLIlayw3sMDrGR53iHOIbFw0GMs=;
        b=2FcOGulnMA4WDL571jGw8DLOIGZiEQrLzCm2RhiCieCbFs65eqF0m2E0dw5Pl7gfxL
         k6nXj5KoIwT+HzbjIe/GiYKr5ywCsR+MtA2eTgqXwYALobv1YhimXpAF2X7rsm2PfD7W
         d8nG2vW+cqiKgjpRiz6Ev/k/6L4pOKCcwwt0ZW8TE3BhHd0ay1ds+Sk2e2MQya1v+YDl
         KJPJNJnxZzCBffZg968ouMbzdvhSdxV32vOAdNN45Zc6iDhlEoemk19v5BuZwQnQ8iNY
         +e383RzGmc5nCqr7mZrZ8lkDZvA0YPdj8mViDTfwuGEYOCizxMWRmrkuDl40Ysr226xG
         EWdQ==
X-Gm-Message-State: AFqh2krMOp7R2NVte0V6o/e//usFcfmSkbdNmOnuJlmBnsJKWxUmKr3v
        q5+zlFEGCkklaAivXyKuMBS6B1qLm0iTxXU+fuGZUA==
X-Google-Smtp-Source: AMrXdXvz7qgfmOrjWwxrCrWDmtNvgYWBgbVBJQLXEegazwCsCGiZ5Ml8X/n1J7cCm+rFCmkKck0Nog==
X-Received: by 2002:a17:902:e1c4:b0:194:5de5:e0ad with SMTP id t4-20020a170902e1c400b001945de5e0admr676018pla.47.1673493934863;
        Wed, 11 Jan 2023 19:25:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902714200b00178143a728esm10890037plm.275.2023.01.11.19.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 19:25:34 -0800 (PST)
Message-ID: <63bf7dae.170a0220.7e653.206e@mx.google.com>
Date:   Wed, 11 Jan 2023 19:25:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc3-399-g92d2cb7167c6
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 323 runs,
 12 regressions (v6.2-rc3-399-g92d2cb7167c6)
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

next/pending-fixes baseline: 323 runs, 12 regressions (v6.2-rc3-399-g92d2cb=
7167c6)

Regressions Summary
-------------------

platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
bcm2835-rpi-b-rev2     | arm  | lab-broonie   | gcc-10   | bcm2835_defconfi=
g            | 1          =

imx6dl-udoo            | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6q-udoo             | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =

imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

imx7d-sdb              | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

qemu_mips-malta        | mips | lab-collabora | gcc-10   | malta_defconfig =
             | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig           | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =

sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | sunxi_defconfig =
             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc3-399-g92d2cb7167c6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc3-399-g92d2cb7167c6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      92d2cb7167c6691c65a3c379d7e564f03b56d080 =



Test Regressions
---------------- =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
bcm2835-rpi-b-rev2     | arm  | lab-broonie   | gcc-10   | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf4585fb14579eb91d39fb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf4585fb14579eb91d3a00
        new failure (last pass: v6.2-rc3-296-g79fa898551af)

    2023-01-11T23:25:51.673038  + set +x
    2023-01-11T23:25:51.676787  <8>[   16.253529] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 94652_1.5.2.4.1>
    2023-01-11T23:25:51.787775  / # #
    2023-01-11T23:25:51.890017  export SHELL=3D/bin/sh
    2023-01-11T23:25:51.890598  #
    2023-01-11T23:25:51.992544  / # export SHELL=3D/bin/sh. /lava-94652/env=
ironment
    2023-01-11T23:25:51.993424  =

    2023-01-11T23:25:52.095675  / # . /lava-94652/environment/lava-94652/bi=
n/lava-test-runner /lava-94652/1
    2023-01-11T23:25:52.097173  =

    2023-01-11T23:25:52.103023  / # /lava-94652/bin/lava-test-runner /lava-=
94652/1 =

    ... (14 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6dl-udoo            | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf48083c15f941231d3a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf48083c15f941231d3=
a43
        failing since 126 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6q-udoo             | arm  | lab-broonie   | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf477685ea50e5101d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf477685ea50e5101d3=
9c3
        failing since 127 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf47a008a09e57bc1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf47a008a09e57bc1d3=
9d2
        failing since 127 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx6sx-sdb             | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf446ce4d091b1be1d39d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf446ce4d091b1be1d39d4
        failing since 7 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:20:47.609131  <8>[   29.221967] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1135971_1.5.2.4.1>
    2023-01-11T23:20:47.714589  / # #
    2023-01-11T23:20:48.874864  export SHELL=3D/bin/sh
    2023-01-11T23:20:48.880314  #
    2023-01-11T23:20:50.427861  / # export SHELL=3D/bin/sh. /lava-1135971/e=
nvironment
    2023-01-11T23:20:50.433554  =

    2023-01-11T23:20:50.433851  / # . /lava-1135971/environment
    2023-01-11T23:20:53.255498  / # /lava-1135971/bin/lava-test-runner /lav=
a-1135971/1
    2023-01-11T23:20:53.261532  /lava-1135971/bin/la<4>[   33.234782] pwm-b=
acklight backlight-display: supply power not found, using dummy regulator
    2023-01-11T23:20:53.261796  v<4>[   33.254391] etnaviv-gpu 1800000.gpu:=
 deferred probe timeout, ignoring dependency =

    ... (33 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
imx7d-sdb              | arm  | lab-nxp       | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf42d21728d4e9711d39de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf42d21728d4e9711d39e1
        failing since 7 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:14:11.682649  + set<8>[   19.028919] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1135972_1.5.2.4.1>
    2023-01-11T23:14:11.682919   +x
    2023-01-11T23:14:11.788450  / # #
    2023-01-11T23:14:12.948725  export SHELL=3D/bin/sh
    2023-01-11T23:14:12.954398  #
    2023-01-11T23:14:14.502415  / # export SHELL=3D/bin/sh. /lava-1135972/e=
nvironment
    2023-01-11T23:14:14.508103  =

    2023-01-11T23:14:17.331002  / # . /lava-1135972/environment/lava-113597=
2/bin/lava-test-runner /lava-1135972/1
    2023-01-11T23:14:17.337078  =

    2023-01-11T23:14:17.337372  / # /lava-1135972/bin/l<4>[   22.976403] us=
b_phy_generic usbphynop3: deferred probe timeout, ignoring dependency =

    ... (34 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
qemu_mips-malta        | mips | lab-collabora | gcc-10   | malta_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf420561365cf7c51d3a42

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63bf420561365cf=
7c51d3a4a
        new failure (last pass: v6.2-rc3-296-g79fa898551af)
        1 lines

    2023-01-11T23:10:41.439797  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 3be841bc, epc =3D=3D 80203804, ra =3D=
=3D 80206154
    2023-01-11T23:10:41.439975  =

    2023-01-11T23:10:41.466690  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-01-11T23:10:41.466970     =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf42b0f07d8cc4dc1d39de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf42b0f07d8cc4dc1d39e1
        failing since 7 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:13:29.372546  [   18.389840] usbcore: registered new inte=
rface driver uas#
    2023-01-11T23:13:29.475097  export SHELL=3D/bin/sh
    2023-01-11T23:13:29.475839  =

    2023-01-11T23:13:29.476551  #
    2023-01-11T23:13:29.578103  / # export SHELL=3D/bin/sh. /lava-377555/en=
vironment
    2023-01-11T23:13:29.578830  =

    2023-01-11T23:13:29.680442  / # . /lava-377555/environment/lava-377555/=
bin/lava-test-runner /lava-377555/1
    2023-01-11T23:13:29.681477  =

    2023-01-11T23:13:29.695437  / # /lava-377555/bin/lava-test-runner /lava=
-377555/1
    2023-01-11T23:13:29.775441  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defc...=
MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf46d4fe8ef867841d3a00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf46d4fe8ef867841d3a03
        failing since 7 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:31:27.413061  / # #
    2023-01-11T23:31:27.515865  export SHELL=3D/bin/sh
    2023-01-11T23:31:27.516653  #
    2023-01-11T23:31:27.618107  / # export SHELL=3D/bin/sh. /lava-377580/en=
vironment
    2023-01-11T23:31:27.618733  =

    2023-01-11T23:31:27.720113  / # . /lava-377580/environment/lava-377580/=
bin/lava-test-runner /lava-377580/1
    2023-01-11T23:31:27.721971  =

    2023-01-11T23:31:27.730499  / # /lava-377580/bin/lava-test-runner /lava=
-377580/1
    2023-01-11T23:31:27.844519  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-11T23:31:27.844984  + cd /lava-377580/1/tests/1_bootrr =

    ... (18 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf48dc116cead5af1d3a13

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf48dc116cead5af1d3a16
        failing since 7 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:39:50.021750  [   19.227613] <LAVA_SIGNAL_ENDRUN 0_dmesg =
377583_1.5.2.4.1>
    2023-01-11T23:39:50.022363  / # [   19.244082] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-11T23:39:50.022647  [   19.252798] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-11T23:39:50.022929  [   19.267442] usbcore: registered new inte=
rface driver uas
    2023-01-11T23:39:50.129190  #
    2023-01-11T23:39:50.231429  export SHELL=3D/bin/sh
    2023-01-11T23:39:50.232008  #
    2023-01-11T23:39:50.333608  / # export SHELL=3D/bin/sh. /lava-377583/en=
vironment
    2023-01-11T23:39:50.334191  =

    2023-01-11T23:39:50.435830  / # . /lava-377583/environment/lava-377583/=
bin/lava-test-runner /lava-377583/1 =

    ... (26 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | multi_v7_defconf=
ig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf4968430f5f96f61d3a19

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf4969430f5f96f61d3a1c
        failing since 7 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:42:12.941804  / # #
    2023-01-11T23:42:13.044082  export SHELL=3D/bin/sh
    2023-01-11T23:42:13.044674  #
    2023-01-11T23:42:13.146305  / # export SHELL=3D/bin/sh. /lava-377587/en=
vironment
    2023-01-11T23:42:13.146923  =

    2023-01-11T23:42:13.248517  / # . /lava-377587/environment/lava-377587/=
bin/lava-test-runner /lava-377587/1
    2023-01-11T23:42:13.249522  =

    2023-01-11T23:42:13.265007  / # /lava-377587/bin/lava-test-runner /lava=
-377587/1
    2023-01-11T23:42:13.381065  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-11T23:42:13.381482  + cd /lava-377587/1/tests/1_bootrr =

    ... (18 line(s) more)  =

 =



platform               | arch | lab           | compiler | defconfig       =
             | regressions
-----------------------+------+---------------+----------+-----------------=
-------------+------------
sun8i-a83t-bananapi-m3 | arm  | lab-clabbe    | gcc-10   | sunxi_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf438c2af2128d931d39de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-39=
9-g92d2cb7167c6/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf438c2af2128d931d39e1
        failing since 7 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-11T23:17:14.966745  [   16.501991] <LAVA_SIGNAL_ENDRUN 0_dmesg =
377558_1.5.2.4.1>
    2023-01-11T23:17:15.073455  / # #
    2023-01-11T23:17:15.175998  export SHELL=3D/bin/sh
    2023-01-11T23:17:15.176617  #
    2023-01-11T23:17:15.278236  / # export SHELL=3D/bin/sh. /lava-377558/en=
vironment
    2023-01-11T23:17:15.278830  =

    2023-01-11T23:17:15.380480  / # . /lava-377558/environment/lava-377558/=
bin/lava-test-runner /lava-377558/1
    2023-01-11T23:17:15.381496  =

    2023-01-11T23:17:15.397649  / # /lava-377558/bin/lava-test-runner /lava=
-377558/1
    2023-01-11T23:17:15.461593  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
