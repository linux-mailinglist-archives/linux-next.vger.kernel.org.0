Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74894D2D96
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 12:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiCILBH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 06:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiCILBG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 06:01:06 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2FC106CB4
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 03:00:05 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso1956611pjo.5
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 03:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XDnQoz0KKpRJgcJPr2FFsxCiD3ennUmxxPYWz5LGs+8=;
        b=zwSQ9JzNlcK4BT4bjW7AiSmYnXTAOpS5kluub+LzOwEko+rmK2NxgxVAZuJJwB+fXx
         LIUnbt5zaVp499K286SV3Ev9Y04JOCRcSkkUQdnlmtzk93d7qjJwuOFcdgL6FYKl9kBE
         5U4l3f2ZKkIEQ9ImLSISXjsZo6YtUVQZRSAKd4sZOXl3AEq0XVgM4qMPcgOsdF6LgvVo
         1h+bMm17x8Aha+mhUMdk+7Eqi960+TeCE9Cy8WFhZgojEKAA54bM0esDS4vfAZ7PL0vV
         a9zHf646VSGc2jL3ldfCvHYK1tqoKptZfr/Eh0oPwF8bLGxnAvLEAObQ9ejgmVw20Toy
         U6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XDnQoz0KKpRJgcJPr2FFsxCiD3ennUmxxPYWz5LGs+8=;
        b=cE8EEpJ/C6ETP7pzfVaOlp+X/LdZLo400ZOfVonTjaXkIfTvsTbjbUzfBPXKbzWrtQ
         v8nkFKSxwT0POWhzvq19nYjbBuE9EE9Vv84M1ykN+RQ7m3z1zmCiJuyR3Jpb1tTE3RFL
         dFG/fnhwcWKtm/Mmkz3N4EZT1ZQpFoAnvc3D17HsjJY0FJIWtMjiailJzvIXyVjyNu0A
         Qe815Vu4jQGsQAju3fwGeEsUNNWIPtG0qFpfH7LxsVoIXvnsZLqrG3S/f7QG76v4yXbX
         Mru8qwE86zXettx0VGjIozcu2zxqsT8gcaErJSzIG35eKFmPGbGwz2MG4gMEAOCqL3V6
         g5Dg==
X-Gm-Message-State: AOAM532K5xfwJWk/8Vcp2m8nSFH/mDR5UVHk9WyuiWYx9h0TnFoay/O4
        vZIf6g3MOuCjHcHqsSvOfAuvhQb2/dsJ7q0MJuM=
X-Google-Smtp-Source: ABdhPJxDMZz3q6J4tyEYwsctV9iKGeMBorJQgD4A8qTr2VO5cHE3IVhltCPZ7Nt2V7Gwm8EJheokxQ==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id y3-20020a170902d64300b001516f2ccfb4mr22294200plh.120.1646823601887;
        Wed, 09 Mar 2022 03:00:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k23-20020aa790d7000000b004f6c8b7c13bsm2358705pfk.132.2022.03.09.03.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 03:00:01 -0800 (PST)
Message-ID: <622888b1.1c69fb81.2a6e3.5a0e@mx.google.com>
Date:   Wed, 09 Mar 2022 03:00:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc7-200-gfb8a41b34095
Subject: next/pending-fixes baseline: 279 runs,
 26 regressions (v5.17-rc7-200-gfb8a41b34095)
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

next/pending-fixes baseline: 279 runs, 26 regressions (v5.17-rc7-200-gfb8a4=
1b34095)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc7-200-gfb8a41b34095/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc7-200-gfb8a41b34095
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fb8a41b34095f3699c85326f6c326f86a7af4185 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622860c1f0b55165e7c629b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622860c1f0b55165e7c62=
9b9
        failing since 20 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622853e50b047c6435c62996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622853e50b047c6435c62=
997
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62285457ee63077ba8c62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62285457ee63077ba8c62=
975
        new failure (last pass: v5.17-rc4-202-g519817c8f9d2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62284e02950fdd9ec6c629a3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62284e02950fdd9=
ec6c629a7
        failing since 44 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-09T06:49:16.956640  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-09T06:49:16.956861  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-09T06:49:16.956998  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-09T06:49:16.998748  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622852835f03d6a4a1c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622852835f03d6a4a1c62=
972
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6228528bb97b37d04bc6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6228528bb97b37d04bc62=
97e
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6228527d8fd72cf881c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6228527d8fd72cf881c62=
978
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6228529221df8196abc6298d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6228529221df8196abc62=
98e
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622861df77e2f1259ac629bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622861df77e2f1259ac62=
9c0
        new failure (last pass: v5.17-rc7-140-g856f0c2997ce) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622852774e0fd26915c6299b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622852774e0fd26915c62=
99c
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622853e10b047c6435c62993

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622853e10b047c6435c62=
994
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622853c80b047c6435c6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622853c80b047c6435c62=
96e
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622853cb55c6f67d2fc62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622853cb55c6f67d2fc62=
979
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622853f10b047c6435c629b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622853f10b047c6435c62=
9b1
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622853c9af2c840c83c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622853c9af2c840c83c62=
969
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6228563613bf54b5d8c62968

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6228563613bf54b5d8c6298e
        failing since 9 days (last pass: v5.17-rc5-244-gd77a1b37f796, first=
 fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-09T07:24:15.922182  /lava-5844614/1/../bin/lava-test-case
    2022-03-09T07:24:15.933661  <8>[   33.704776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62285262547097cbbbc62995

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62285262547097cbbbc62=
996
        new failure (last pass: v5.17-rc4-202-g519817c8f9d2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622852925f03d6a4a1c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622852925f03d6a4a1c62=
97a
        new failure (last pass: v5.17-rc4-202-g519817c8f9d2) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622852a6cd8e611a58c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622852a6cd8e611a58c62=
969
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622852734e0fd26915c62996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622852734e0fd26915c62=
997
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62285c553dcc7d7621c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62285c553dcc7d7621c62=
972
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6228727a3ae979fffec62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6228727a3ae979fffec62=
969
        new failure (last pass: v5.17-rc4-173-gecf2acb68532) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6228527a21df8196abc6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6228527a21df8196abc62=
96e
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622852788fd72cf881c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622852788fd72cf881c62=
969
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62285706b8a4b3abf0c6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62285706b8a4b3abf0c62=
96f
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622857ba17ac7f3d2cc6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
00-gfb8a41b34095/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622857ba17ac7f3d2cc62=
96f
        new failure (last pass: v5.17-rc6-312-gf15bf60c638f) =

 =20
