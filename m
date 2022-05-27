Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B52C5363FA
	for <lists+linux-next@lfdr.de>; Fri, 27 May 2022 16:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353149AbiE0OXE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 May 2022 10:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353159AbiE0OW6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2022 10:22:58 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC9D1207E4
        for <linux-next@vger.kernel.org>; Fri, 27 May 2022 07:22:56 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id h13so4459707pfq.5
        for <linux-next@vger.kernel.org>; Fri, 27 May 2022 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZkUGXdPKyjdFhJ8c+0xI6h39clyoQ755i4+HXvgujOs=;
        b=eLlnInDpnHXFZIF0R8AYlGEOmrCrQeTw6/0JjeftieAUrMkBtrYwhcKDGOwmiDUHL8
         5D87AcJzjYdMHzIui3UhvZ6AqEwCL7WMJf4S5bAGJ/lwY4Eay0JzCCspXLJcR7P8/oyD
         2Tpn0p/JDvonSuVvWm+d9PKktoYnoiDSyHR9AdVphvuI3V2b7zEZaeEdBeCzVe/oBze7
         qxQp9AOq42y+1T80+K2/GRbPYuR+GqFMehw/wvgV6C8sEa43pIAopus6P6sawL3t9I/I
         65JNyo7M6vkrumWvpb6LPbqaumJA9V2ZPdHm7ro/qpsY6Ina1efAdEYOJuP57f4Z3Sva
         VSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZkUGXdPKyjdFhJ8c+0xI6h39clyoQ755i4+HXvgujOs=;
        b=J+pBnPHbohpJGV9gfvbLmsSs89ORHVIs6IDmJv2s5tdFelaUU4YApf2HNGtXZiuaIW
         XoeCnq6iE0ux+lyxp5hcgwYUZ4kcbPGYPBuMUaQLbPhfXMSBM9+6crjV3bpvEcYuCPzw
         We7iWzHpLW0rq91e86CBv0P9Mdi4bsWAPKvgytrg1Wb1ue8oqNJVuPQz38f8KWOspF/Q
         nkKMYNuEISRbM3soiOkmq2Vp/ANiWUINnQNdb8Ubqb0zIfZqR1NyXYvP2B+LDDGWu7Da
         6eZdL4XvyV3rvogad9IDrr4mSIxtfV9QL2HUBeY/Vf78SgnE+iTRu6tFGAh4szpKzbiY
         EGrg==
X-Gm-Message-State: AOAM53034n60NcTv6W/hafS3NI1w28b0hmjiSrxNoX378/8XQCY6H3fz
        2aKxl+IYC6XxvrWNRaFkLFcjs64cJasyqne/Zyg=
X-Google-Smtp-Source: ABdhPJwiiiDEXwYFRp4kGoIa7od/LIa8aKhnGeiQ+B9QXwkgL/KUBHQA73iiPVIjyrFRoMYLe3JdEw==
X-Received: by 2002:a05:6a00:1aca:b0:518:deac:6f55 with SMTP id f10-20020a056a001aca00b00518deac6f55mr15871949pfv.76.1653661375533;
        Fri, 27 May 2022 07:22:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cp22-20020a056a00349600b005087c23ad8dsm3530693pfb.0.2022.05.27.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:22:55 -0700 (PDT)
Message-ID: <6290debf.1c69fb81.98e60.8056@mx.google.com>
Date:   Fri, 27 May 2022 07:22:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-9954-g9e21d180a100
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 149 runs,
 17 regressions (v5.18-9954-g9e21d180a100)
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

next/pending-fixes baseline: 149 runs, 17 regressions (v5.18-9954-g9e21d180=
a100)

Regressions Summary
-------------------

platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

bcm2836-rpi-2-b              | arm  | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm  | lab-baylibre  | gcc-10   | davinci_al=
l_defconfig        | 1          =

sun8i-a33-olinuxino          | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

sun8i-a33-olinuxino          | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre  | gcc-10   | sunxi_defc=
onfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre  | gcc-10   | sunxi_defc=
onfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

sun8i-r40-bananapi-m2-ultra  | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-9954-g9e21d180a100/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-9954-g9e21d180a100
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e21d180a10050c7cb41863b054fc0d62ca59677 =



Test Regressions
---------------- =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6290a93a862b4967cda39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-at=
91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-at=
91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290a93a862b4967cda39=
be4
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290aa8e0332005870a39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290aa8e0332005870a39=
bda
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6290abe1dbfa909a7aa39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290abe1dbfa909a7aa39=
bde
        failing since 1 day (last pass: v5.18-1222-g391cf5a1244f, first fai=
l: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6290b02dd6ad6bc79ba39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290b02dd6ad6bc79ba39=
bd0
        failing since 1 day (last pass: v5.18-1222-g391cf5a1244f, first fai=
l: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b              | arm  | lab-collabora | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290ae5ae10288e153a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290ae5ae10288e153a39=
bf5
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
da850-lcdk                   | arm  | lab-baylibre  | gcc-10   | davinci_al=
l_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6290a778d2ac782acaa39c06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6290a779d2ac782=
acaa39c0a
        failing since 123 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-27T10:26:38.672685  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-27T10:26:38.673385  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-27T10:26:38.675976  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-27T10:26:38.723498  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-a33-olinuxino          | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6290aa527964bb6d0da39c52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-sun8=
i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-sun8=
i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290aa527964bb6d0da39=
c53
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-a33-olinuxino          | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290aba6ec88eac2a3a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cl=
abbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cl=
abbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290aba6ec88eac2a3a39=
bcf
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-a83t-bananapi-m3       | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6290a8730b37196ca9a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290a8730b37196ca9a39=
bdd
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290ace539c6f46f21a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290ace539c6f46f21a39=
be5
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6290af79a47dde85c2a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290af79a47dde85c2a39=
bd7
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm  | lab-baylibre  | gcc-10   | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6290a85c324b17b91ca39c0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290a85c324b17b91ca39=
c10
        failing since 1 day (last pass: v5.18-1222-g391cf5a1244f, first fai=
l: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290ac59a7a51d5992a39bf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290ac59a7a51d5992a39=
bf8
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-h3-libretech-all-h3-cc | arm  | lab-baylibre  | gcc-10   | sunxi_defc=
onfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6290a85dcb50204c24a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290a85dcb50204c24a39=
be4
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6290bc4bc3e35b27a5a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290bc4bc3e35b27a5a39=
bcf
        new failure (last pass: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290bd9f48939c4713a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cl=
abbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cl=
abbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290bd9f48939c4713a39=
bdc
        failing since 1 day (last pass: v5.18-1222-g391cf5a1244f, first fai=
l: v5.18-5613-ge079cf8f6817) =

 =



platform                     | arch | lab           | compiler | defconfig =
                   | regressions
-----------------------------+------+---------------+----------+-----------=
-------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm  | lab-clabbe    | gcc-10   | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6290c00c1e60dbbe5aa39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-c=
labbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-9954-=
g9e21d180a100/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-c=
labbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armeb/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6290c00c1e60dbbe5aa39=
bd9
        failing since 1 day (last pass: v5.18-1222-g391cf5a1244f, first fai=
l: v5.18-5613-ge079cf8f6817) =

 =20
