Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BB36EFB31
	for <lists+linux-next@lfdr.de>; Wed, 26 Apr 2023 21:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjDZTga (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Apr 2023 15:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjDZTg3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Apr 2023 15:36:29 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E062684
        for <linux-next@vger.kernel.org>; Wed, 26 Apr 2023 12:36:24 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a516fb6523so78654975ad.3
        for <linux-next@vger.kernel.org>; Wed, 26 Apr 2023 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682537783; x=1685129783;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/FKK+ybS8sNAOaZwaQGuLoJyyoleNdOLNbfWzN1T3J8=;
        b=0B+8T1Ezz30K3mqQnuwh9yXfmRMd33CM1MrbZ1k5mO4WQvqMLAnyhQcRXALCfLMDe+
         hv5sxstqbnre57i779FQIYyZGdWjLV9FrNwmNlmseOKWApS7+iU0xWQhdjDXjPuo9jhG
         vzHldLYt2u+LEvsaIaOmjhgsqHSFURDZY5XPUiXbY0bSOdstHvYNHEtKDfXGzxVIhIpd
         bDdIf8hC3rmqzC5n0P18zNRw/aaeN0nd1s8WmxSU504ywA3UiqBc7GD45FlChucbu2HP
         YkWNj/n9rhjUU4tjykpzBYni1RxV5acg3vhNVMp+IJHYVgitTmRstI+LcNCPsANPwN5l
         abEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682537783; x=1685129783;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FKK+ybS8sNAOaZwaQGuLoJyyoleNdOLNbfWzN1T3J8=;
        b=K/EPL8riw3q5PnfMbOxWR49k8zW8KNHyYN36DpM3y4mViKRg3RrnNRLZHgv5PS+l4n
         y+mcTdtNvXvASsYc0HnXpml3mYnWn3NgAsZkDvxXTAYHzS0R8XI3sQLSOBABcRI9mtCT
         HrHMXvcoz3Uoka4U7wOraohQ/AcOrWqFn9YqkHjVBl/FIteY7Q6dZWEu2tdi53YyC3RG
         bXUx9oyL9TXekNr/R1E+qVS5ZE3b6PLpx00lKVpZ84Mt4Vtdhs1fFZuw0BRny+YfhVhG
         Er0EbGvrh6sY104WBBgZ7Va266ei7WJXfti8MjQobBqjrEvrgbXcyoh2q12vQEOiVseq
         2aaQ==
X-Gm-Message-State: AAQBX9cfTEZuezqaV1JNvsKWWRK+/hEFzpXl7vKEkIGRzwo4693zQwx7
        egl4qH0b0P5IG5u2YIS/gIdsBh2+0bCha3toZyZ95Q==
X-Google-Smtp-Source: AKy350axcuMJx/XfSI5cwSwNrzIpWdEOufOlGcNltI6H2tA6W9X9Eb9FNFLOEQyziC4+lTMmE4nc7w==
X-Received: by 2002:a17:902:ec8c:b0:1a6:9f9b:1327 with SMTP id x12-20020a170902ec8c00b001a69f9b1327mr27953819plg.45.1682537781780;
        Wed, 26 Apr 2023 12:36:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ea8400b0019e5fc21663sm10318901plb.218.2023.04.26.12.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 12:36:21 -0700 (PDT)
Message-ID: <64497d35.170a0220.c018a.46ee@mx.google.com>
Date:   Wed, 26 Apr 2023 12:36:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-5614-gbe56a31d3d65
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 386 runs,
 93 regressions (v6.3-5614-gbe56a31d3d65)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 386 runs, 93 regressions (v6.3-5614-gbe56a31d3=
d65)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 3          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
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

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-5614-gbe56a31d3d65/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-5614-gbe56a31d3d65
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      be56a31d3d651e8eb263715e370a80fe59214889 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64494421accb4fe0a62e8607

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4494421accb4fe0a62e8616
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:31.906135  /usr/bin/tpm2_getcap

    2023-04-26T15:32:31.926308  <3>[   11.088108] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:32.954610  <3>[   12.116112] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:33.982411  <3>[   13.144109] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:34.253474  <3>[   13.415127] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:35.009894  <3>[   14.172110] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:36.038073  <3>[   15.200113] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:36.471377  <6>[   15.633178] udevd (126) used greatest=
 stack depth: 13336 bytes left

    2023-04-26T15:32:37.066527  <3>[   16.228113] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:38.093997  <3>[   17.256112] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6449519a0bde77c1622e85eb

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449519a0bde77c1622e85fa
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T16:29:47.042573  /usr/bin/tpm2_getcap

    2023-04-26T16:29:50.205017  <3>[   90.961661] tpm tpm0: Data still avai=
lable

    2023-04-26T16:29:50.211158  <3>[   90.966718] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T16:29:57.127849  <3>[   97.884946] tpm tpm0: Data still avai=
lable

    2023-04-26T16:29:57.134735  <3>[   97.890543] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T16:29:57.467602  /lava-10133793/1/../bin/lava-test-case

    2023-04-26T16:29:57.482890  <8>[   98.237240] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644941fff3fbe4bfcd2e861f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644941fff3fbe4bfcd2e8=
620
        failing since 198 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644947dc71d01030142e8667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-a=
m57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-a=
m57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644947dc71d01030142e8=
668
        failing since 196 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644942692699926eed2e85f9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644942692699926eed2e85fe
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:25:05.174167  + set +x

    2023-04-26T15:25:05.180995  <8>[   10.572275] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133392_1.4.2.3.1>

    2023-04-26T15:25:05.290222  / # #

    2023-04-26T15:25:05.392871  export SHELL=3D/bin/sh

    2023-04-26T15:25:05.393702  #

    2023-04-26T15:25:05.495229  / # export SHELL=3D/bin/sh. /lava-10133392/=
environment

    2023-04-26T15:25:05.496027  =


    2023-04-26T15:25:05.597535  / # . /lava-10133392/environment/lava-10133=
392/bin/lava-test-runner /lava-10133392/1

    2023-04-26T15:25:05.598858  =


    2023-04-26T15:25:05.603846  / # /lava-10133392/bin/lava-test-runner /la=
va-10133392/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644944a742a5b551322e85f8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644944a742a5b551322e85fd
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:34:43.771345  <8>[   10.371904] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133516_1.4.2.3.1>

    2023-04-26T15:34:43.774626  + set +x

    2023-04-26T15:34:43.878668  / # #

    2023-04-26T15:34:43.979239  export SHELL=3D/bin/sh

    2023-04-26T15:34:43.979428  #

    2023-04-26T15:34:44.079950  / # export SHELL=3D/bin/sh. /lava-10133516/=
environment

    2023-04-26T15:34:44.080149  =


    2023-04-26T15:34:44.180656  / # . /lava-10133516/environment/lava-10133=
516/bin/lava-test-runner /lava-10133516/1

    2023-04-26T15:34:44.180950  =


    2023-04-26T15:34:44.185837  / # /lava-10133516/bin/lava-test-runner /la=
va-10133516/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644948aa98e9901f012e860a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644948aa98e9901f012e860f
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T15:51:45.817673  + set +x

    2023-04-26T15:51:45.824285  <8>[   12.547511] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133806_1.4.2.3.1>

    2023-04-26T15:51:45.931626  / # #

    2023-04-26T15:51:46.032375  export SHELL=3D/bin/sh

    2023-04-26T15:51:46.033079  #

    2023-04-26T15:51:46.134383  / # export SHELL=3D/bin/sh. /lava-10133806/=
environment

    2023-04-26T15:51:46.135104  =


    2023-04-26T15:51:46.236424  / # . /lava-10133806/environment/lava-10133=
806/bin/lava-test-runner /lava-10133806/1

    2023-04-26T15:51:46.237772  =


    2023-04-26T15:51:46.243351  / # /lava-10133806/bin/lava-test-runner /la=
va-10133806/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6449425177ed65b23f2e85ec

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449425177ed65b23f2e85f1
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:24:50.970080  /usr/bin/tpm2_getcap

    2023-04-26T15:24:53.944035  <6>[   15.813893] udevd (117) used greatest=
 stack depth: 13152 bytes left

    2023-04-26T15:24:58.740790  <6>[   20.609609] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-26T15:24:58.747432  <6>[   20.609847] platform MX98357A:00: def=
erred probe pending

    2023-04-26T15:25:01.366876  /lava-10133410/1/../bin/lava-test-case

    2023-04-26T15:25:01.378723  <8>[   23.246680] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644944426d68ae8b492e8608

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44944426d68ae8b492e860b
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:50.537062  /usr/bin/tpm2_getcap

    2023-04-26T15:32:50.584582  <3>[   13.030037] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:51.623757  <3>[   14.069039] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:52.677433  <3>[   15.123037] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:53.492196  <6>[   15.934257] udevd (121) used greatest=
 stack depth: 13104 bytes left

    2023-04-26T15:32:53.716455  <3>[   16.162047] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:54.754644  <3>[   17.200038] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:55.793474  <3>[   18.239040] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:56.832584  <3>[   19.278036] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:57.872803  <3>[   20.318035] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644947db71d01030142e865a

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44947db71d01030142e865d
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:48:22.450646  /usr/bin/tpm2_getcap

    2023-04-26T15:48:28.667153  <6>[   24.555767] platform MX98357A:00: def=
erred probe pending

    2023-04-26T15:48:28.675688  <6>[   24.556045] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-26T15:48:32.263029  <3>[   28.153247] tpm tpm0: Data still avai=
lable

    2023-04-26T15:48:32.270974  <3>[   28.160080] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T15:48:33.577704  /lava-10133814/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/64494c669bdab1352f2e85ff

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4494c669bdab1352f2e8602
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T16:07:49.090692  /usr/bin/tpm2_getcap

    2023-04-26T16:07:49.114310  <3>[   12.433346] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:07:50.139474  <3>[   13.458692] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:07:50.631234  <3>[   13.950671] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:07:51.164023  <3>[   14.483328] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:07:52.189292  <3>[   15.508690] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:07:52.339638  <6>[   15.659053] udevd (147) used greatest=
 stack depth: 13240 bytes left

    2023-04-26T16:07:52.346195  <6>[   15.665597] udevd (149) used greatest=
 stack depth: 13216 bytes left

    2023-04-26T16:07:53.214285  <3>[   16.533330] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:07:54.238292  <3>[   17.557316] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494c669bdab1352f2e8604
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T16:07:47.627375  + <8>[   10.945694] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10133387_1.4.2.3.1>

    2023-04-26T16:07:47.627515  set +x

    2023-04-26T16:07:47.731942  / # #

    2023-04-26T16:07:47.832760  export SHELL=3D/bin/sh

    2023-04-26T16:07:47.833029  #

    2023-04-26T16:07:47.933543  / # export SHELL=3D/bin/sh. /lava-10133387/=
environment

    2023-04-26T16:07:47.933785  =


    2023-04-26T16:07:48.034318  / # . /lava-10133387/environment/lava-10133=
387/bin/lava-test-runner /lava-10133387/1

    2023-04-26T16:07:48.034668  =


    2023-04-26T16:07:48.038948  / # /lava-10133387/bin/lava-test-runner /la=
va-10133387/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/644950de0eaee4de072e85e6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44950de0eaee4de072e85e9
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T16:26:36.637496  /usr/bin/tpm2_getcap

    2023-04-26T16:26:36.660529  <3>[   13.449047] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:37.684947  <3>[   14.473079] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:38.700601  <3>[   15.489048] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:38.721040  <3>[   15.509408] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:39.747443  <3>[   16.536084] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:39.767176  <6>[   16.555674] udevd (137) used greatest=
 stack depth: 13224 bytes left

    2023-04-26T16:26:40.773260  <3>[   17.562090] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:41.797576  <3>[   18.586104] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:26:42.822870  <3>[   19.611104] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644950de0eaee4de072e85eb
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T16:26:35.165207  + set +x<8>[   11.952248] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10133573_1.4.2.3.1>

    2023-04-26T16:26:35.165736  =


    2023-04-26T16:26:35.272607  / # #

    2023-04-26T16:26:35.374993  export SHELL=3D/bin/sh

    2023-04-26T16:26:35.375697  #

    2023-04-26T16:26:35.477128  / # export SHELL=3D/bin/sh. /lava-10133573/=
environment

    2023-04-26T16:26:35.477791  =


    2023-04-26T16:26:35.579171  / # . /lava-10133573/environment/lava-10133=
573/bin/lava-test-runner /lava-10133573/1

    2023-04-26T16:26:35.580329  =


    2023-04-26T16:26:35.586016  / # /lava-10133573/bin/lava-test-runner /la=
va-10133573/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 3          =


  Details:     https://kernelci.org/test/plan/id/644950ee0eaee4de072e85f5

  Results:     4 PASS, 3 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44950ee0eaee4de072e85f8
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T16:27:07.256725  /usr/bin/tpm2_getcap

    2023-04-26T16:27:07.292015  <3>[   17.076006] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:07.670979  <3>[   17.455390] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:08.331692  <3>[   18.115844] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:09.372025  <3>[   19.155992] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:10.412753  <3>[   20.197024] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:11.451664  <3>[   21.236004] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:12.494752  <3>[   22.278382] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:13.535128  <3>[   23.319459] tpm tpm0: Operation Timed=
 out

    2023-04-26T16:27:14.575073  <3>[   24.358998] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644950ee0eaee4de072e85fa
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T16:27:05.674130  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-26T16:27:05.680867  <8>[   15.460459] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133816_1.4.2.3.1>

    2023-04-26T16:27:05.680971  + set +x

    2023-04-26T16:27:05.785552  / # #

    2023-04-26T16:27:05.886205  export SHELL=3D/bin/sh

    2023-04-26T16:27:05.886414  #

    2023-04-26T16:27:05.986985  / # export SHELL=3D/bin/sh. /lava-10133816/=
environment

    2023-04-26T16:27:05.987206  =


    2023-04-26T16:27:06.087768  / # . /lava-10133816/environment/lava-10133=
816/bin/lava-test-runner /lava-10133816/1

    2023-04-26T16:27:06.088043  =

 =

    ... (13 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644950ee0eaee4d=
e072e85fc
        failing since 4 days (last pass: v6.3-rc7-210-g884374c58391a, first=
 fail: v6.3-rc7-226-gf05a2341f2478)
        3 lines

    2023-04-26T16:27:05.654634  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-26T16:27:05.671250  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector<8>[   15.449007] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-04-26T16:27:05.671391  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644942458b78a3c9a62e860c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644942458b78a3c9a62e8611
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:24:41.998789  <8>[   10.246549] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133406_1.4.2.3.1>

    2023-04-26T15:24:42.002317  + set +x

    2023-04-26T15:24:42.103735  #

    2023-04-26T15:24:42.104084  =


    2023-04-26T15:24:42.204698  / # #export SHELL=3D/bin/sh

    2023-04-26T15:24:42.204908  =


    2023-04-26T15:24:42.305409  / # export SHELL=3D/bin/sh. /lava-10133406/=
environment

    2023-04-26T15:24:42.305640  =


    2023-04-26T15:24:42.406173  / # . /lava-10133406/environment/lava-10133=
406/bin/lava-test-runner /lava-10133406/1

    2023-04-26T15:24:42.406538  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64494430de074c6b522e8624

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494430de074c6b522e8629
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:32:43.666102  <8>[   10.596238] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133577_1.4.2.3.1>

    2023-04-26T15:32:43.669305  + set +x

    2023-04-26T15:32:43.770959  =


    2023-04-26T15:32:43.871518  / # #export SHELL=3D/bin/sh

    2023-04-26T15:32:43.871717  =


    2023-04-26T15:32:43.972277  / # export SHELL=3D/bin/sh. /lava-10133577/=
environment

    2023-04-26T15:32:43.972470  =


    2023-04-26T15:32:44.073000  / # . /lava-10133577/environment/lava-10133=
577/bin/lava-test-runner /lava-10133577/1

    2023-04-26T15:32:44.073384  =


    2023-04-26T15:32:44.078905  / # /lava-10133577/bin/lava-test-runner /la=
va-10133577/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64494770b8ba304b092e861e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494770b8ba304b092e8623
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T15:46:51.677263  <8>[   12.405020] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133812_1.4.2.3.1>

    2023-04-26T15:46:51.680930  + set +x

    2023-04-26T15:46:51.782044  #

    2023-04-26T15:46:51.882892  / # #export SHELL=3D/bin/sh

    2023-04-26T15:46:51.883130  =


    2023-04-26T15:46:51.983683  / # export SHELL=3D/bin/sh. /lava-10133812/=
environment

    2023-04-26T15:46:51.983934  =


    2023-04-26T15:46:52.084501  / # . /lava-10133812/environment/lava-10133=
812/bin/lava-test-runner /lava-10133812/1

    2023-04-26T15:46:52.084860  =


    2023-04-26T15:46:52.090374  / # /lava-10133812/bin/lava-test-runner /la=
va-10133812/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6449447f301189c9772e861a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-=
b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449447f301189c9772e864d
        failing since 1 day (last pass: v6.3-rc7-226-gf05a2341f2478, first =
fail: v6.3-225-g0a6daccdbdd65)

    2023-04-26T15:34:01.465039  + set +x
    2023-04-26T15:34:01.468826  <8>[   18.570684] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 390610_1.5.2.4.1>
    2023-04-26T15:34:01.603247  / # #
    2023-04-26T15:34:01.706498  export SHELL=3D/bin/sh
    2023-04-26T15:34:01.707064  #
    2023-04-26T15:34:01.808815  / # export SHELL=3D/bin/sh. /lava-390610/en=
vironment
    2023-04-26T15:34:01.809415  =

    2023-04-26T15:34:01.911284  / # . /lava-390610/environment/lava-390610/=
bin/lava-test-runner /lava-390610/1
    2023-04-26T15:34:01.912604  =

    2023-04-26T15:34:01.918936  / # /lava-390610/bin/lava-test-runner /lava=
-390610/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6449445ba71f9297f42e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rp=
i-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449445ba71f9297f42e85f9
        failing since 105 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-04-26T15:33:28.398214  / # #

    2023-04-26T15:33:28.500216  export SHELL=3D/bin/sh

    2023-04-26T15:33:28.500468  #

    2023-04-26T15:33:28.601039  / # export SHELL=3D/bin/sh. /lava-10133601/=
environment

    2023-04-26T15:33:28.601285  =


    2023-04-26T15:33:28.701917  / # . /lava-10133601/environment/lava-10133=
601/bin/lava-test-runner /lava-10133601/1

    2023-04-26T15:33:28.702290  =


    2023-04-26T15:33:28.705818  / # /lava-10133601/bin/lava-test-runner /la=
va-10133601/1

    2023-04-26T15:33:28.829695  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-26T15:33:28.829886  + cd /lava-10133601/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644941da3e47bfee2e2e8707

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644941da3e47bfee2e2e8=
708
        failing since 58 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64496be55ef84a71432e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64496be55ef84a71432e8=
611
        failing since 94 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644942b35f26bc42a62e8633

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44942b35f26bc42a62e8636
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:26:06.215796  + cd /opt/bootrr/libexec/bootrr

    2023-04-26T15:26:06.218540  + sh helpers/bootrr-auto

    2023-04-26T15:26:06.222718  /lava-10133413/1/../bin/lava-test-case

    2023-04-26T15:26:06.226174  /lava-10133413/1/../bin/lava-test-case

    2023-04-26T15:26:06.228299  /usr/bin/tpm2_getcap

    2023-04-26T15:26:06.249795  <3>[   16.351350] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:06.997969  <3>[   17.099343] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:07.279400  <3>[   17.380339] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:08.308253  <3>[   18.409337] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:09.336255  <3>[   19.437338] tpm tpm0: Operation Timed=
 out
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6449444a6d68ae8b492e8621

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449444a6d68ae8b492e8624
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:56.856501  /usr/bin/tpm2_getcap

    2023-04-26T15:32:56.892062  <3>[    9.647152] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:57.939408  <3>[   10.695152] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:58.969618  <3>[   11.725143] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:59.999363  <3>[   12.755152] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:33:01.029961  <3>[   13.785143] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:33:02.059160  <3>[   14.815152] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:33:03.089546  <3>[   15.845146] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:33:04.118346  <3>[   16.874143] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:33:04.342173  <3>[   17.098149] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6449477db8ba304b092e8639

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449477db8ba304b092e863c
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:46:46.771826  /usr/bin/tpm2_getcap

    2023-04-26T15:46:46.815063  <3>[   16.129200] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:46.877390  <3>[   16.191201] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:47.859803  <3>[   17.174183] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:48.902576  <3>[   18.216182] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:49.946074  <3>[   19.260180] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:51.002508  <3>[   20.317211] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:52.063859  <3>[   21.378191] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:53.124820  <3>[   22.439194] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:54.187549  <3>[   23.501210] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/6449428d540dfd269d2e8672

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449428d540dfd269d2e8675
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:25:27.055466  /usr/bin/tpm2_getcap

    2023-04-26T15:25:27.090370  <3>[    9.434500] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:28.119050  <3>[   10.463547] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:28.639836  <3>[   10.984495] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:29.143424  <3>[   11.487511] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:30.171717  <3>[   12.515542] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:31.200118  <3>[   13.544502] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:31.885485  <6>[   14.226885] udevd (144) used greatest=
 stack depth: 13240 bytes left

    2023-04-26T15:25:32.227918  <3>[   14.572547] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:33.254688  <3>[   15.598507] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644944436d68ae8b492e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44944436d68ae8b492e8616
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:46.066087  <8>[    9.301752] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-26T15:32:46.071776  /usr/bin/tpm2_getcap

    2023-04-26T15:32:46.105548  <3>[    9.348656] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:47.134996  <3>[   10.377660] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:47.742159  <3>[   10.984658] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:48.161489  <3>[   11.403700] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:49.188545  <3>[   12.431698] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:50.217311  <3>[   13.459701] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:51.244805  <3>[   14.487689] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:52.291626  <3>[   15.534650] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6449480a593350d8002e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449480a593350d8002e85ec
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:48:56.838062  <8>[   11.962430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-26T15:48:56.850302  /usr/bin/tpm2_getcap

    2023-04-26T15:48:56.893183  <3>[   12.021884] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:48:57.422639  <3>[   12.550891] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:48:57.928317  <3>[   13.056917] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:48:58.983339  <3>[   14.111864] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:49:00.026418  <3>[   15.154900] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:49:01.070302  <3>[   16.198880] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:49:02.117142  <3>[   17.244900] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:49:03.162750  <3>[   18.290915] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644942cd61fd7e57412e85f0

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44942cd61fd7e57412e85ff
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:26:49.761103  /usr/bin/tpm2_getcap

    2023-04-26T15:26:49.786048  <3>[   11.551781] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:50.813011  <3>[   12.578781] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:51.839757  <3>[   13.605781] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:52.671712  <3>[   14.437781] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:52.862718  <3>[   14.628783] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:53.891025  <3>[   15.656782] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:54.918046  <3>[   16.683781] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:55.944568  <3>[   17.710780] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:56.972880  <3>[   18.738779] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6449447e301189c9772e8600

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449447e301189c9772e8611
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:33:58.441228  /usr/bin/tpm2_getcap

    2023-04-26T15:33:58.460896  <3>[    8.795862] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:33:59.489178  <3>[    9.823862] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:00.516614  <3>[   10.851863] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:01.544667  <3>[   11.879861] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:02.571812  <3>[   12.906864] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:03.598012  <3>[   13.932858] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:04.616040  <3>[   14.950860] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:04.632967  <3>[   14.967860] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:34:05.659750  <3>[   15.994859] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64494778ba0c4e0bea2e860f

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4494778ba0c4e0bea2e861e
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:46:46.207512  /usr/bin/tpm2_getcap

    2023-04-26T15:46:47.474055  <3>[   15.942389] tpm tpm0: Data still avai=
lable

    2023-04-26T15:46:47.479726  <3>[   15.947584] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-26T15:46:56.612229  /lava-10133822/1/../bin/lava-test-case

    2023-04-26T15:46:56.628180  <8>[   25.094313] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6449425a77ed65b23f2e8606

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449425a77ed65b23f2e8615
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:24:39.783135  /usr/bin/tpm2_getcap

    2023-04-26T15:24:39.803464  <3>[   11.966031] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:40.830297  <3>[   12.993038] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:41.857711  <3>[   14.020037] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:42.276294  <3>[   14.439043] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:42.879338  <3>[   15.042039] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:43.905792  <3>[   16.068044] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:44.931686  <3>[   17.094044] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:45.957856  <3>[   18.120044] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:24:46.984293  <3>[   19.147038] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6449442ede074c6b522e860a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449442ede074c6b522e861b
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:42.184702  /usr/bin/tpm2_getcap

    2023-04-26T15:32:42.208416  <3>[   11.066787] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:43.235406  <3>[   12.093798] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:44.262216  <3>[   13.120796] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:45.290399  <3>[   14.148793] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:45.580264  <3>[   14.438802] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:46.312885  <3>[   15.171796] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:47.340016  <3>[   16.198793] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:48.365961  <3>[   17.224799] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:49.392954  <3>[   18.251797] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64494a16d8cbc0c6272e85f7

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4494a16d8cbc0c6272e8606
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:57:43.426407  /usr/bin/tpm2_getcap

    2023-04-26T15:57:43.468569  <3>[   14.629784] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:44.516930  <3>[   15.676832] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:44.790683  <3>[   15.950816] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:45.562652  <3>[   16.722813] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:46.609874  <3>[   17.769798] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:47.655469  <3>[   18.815808] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:48.701219  <3>[   19.861812] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:49.748505  <3>[   20.908810] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:57:50.794467  <3>[   21.954812] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/644942658fbb8d64462e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644942658fbb8d64462e85f1
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:25:07.515644  + set +x

    2023-04-26T15:25:07.522543  <8>[   11.818123] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133421_1.4.2.3.1>

    2023-04-26T15:25:07.627010  / # #

    2023-04-26T15:25:07.727734  export SHELL=3D/bin/sh

    2023-04-26T15:25:07.727982  #

    2023-04-26T15:25:07.828556  / # export SHELL=3D/bin/sh. /lava-10133421/=
environment

    2023-04-26T15:25:07.828865  =


    2023-04-26T15:25:07.929434  / # . /lava-10133421/environment/lava-10133=
421/bin/lava-test-runner /lava-10133421/1

    2023-04-26T15:25:07.929842  =


    2023-04-26T15:25:07.934861  / # /lava-10133421/bin/lava-test-runner /la=
va-10133421/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644944396d68ae8b492e85f2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644944396d68ae8b492e85f7
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:32:52.973108  + set +x

    2023-04-26T15:32:52.979642  <8>[    8.140640] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133574_1.4.2.3.1>

    2023-04-26T15:32:53.088486  / # #

    2023-04-26T15:32:53.190799  export SHELL=3D/bin/sh

    2023-04-26T15:32:53.191566  #

    2023-04-26T15:32:53.293193  / # export SHELL=3D/bin/sh. /lava-10133574/=
environment

    2023-04-26T15:32:53.294073  =


    2023-04-26T15:32:53.395680  / # . /lava-10133574/environment/lava-10133=
574/bin/lava-test-runner /lava-10133574/1

    2023-04-26T15:32:53.396935  =


    2023-04-26T15:32:53.401223  / # /lava-10133574/bin/lava-test-runner /la=
va-10133574/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6449478f690810f3e82e8610

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449478f690810f3e82e8615
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T15:47:04.093614  + set +x<8>[   15.766799] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10133804_1.4.2.3.1>

    2023-04-26T15:47:04.093845  =


    2023-04-26T15:47:04.199957  / # #

    2023-04-26T15:47:04.300702  export SHELL=3D/bin/sh

    2023-04-26T15:47:04.300894  #

    2023-04-26T15:47:04.401611  / # export SHELL=3D/bin/sh. /lava-10133804/=
environment

    2023-04-26T15:47:04.402288  =


    2023-04-26T15:47:04.503732  / # . /lava-10133804/environment/lava-10133=
804/bin/lava-test-runner /lava-10133804/1

    2023-04-26T15:47:04.504930  =


    2023-04-26T15:47:04.510041  / # /lava-10133804/bin/lava-test-runner /la=
va-10133804/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6449424f8b78a3c9a62e862d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449424f8b78a3c9a62e8632
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:24:55.252718  + set +x

    2023-04-26T15:24:55.259190  <8>[   10.725599] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133398_1.4.2.3.1>

    2023-04-26T15:24:55.361790  =


    2023-04-26T15:24:55.462394  / # #export SHELL=3D/bin/sh

    2023-04-26T15:24:55.462588  =


    2023-04-26T15:24:55.563194  / # export SHELL=3D/bin/sh. /lava-10133398/=
environment

    2023-04-26T15:24:55.563390  =


    2023-04-26T15:24:55.663914  / # . /lava-10133398/environment/lava-10133=
398/bin/lava-test-runner /lava-10133398/1

    2023-04-26T15:24:55.664211  =


    2023-04-26T15:24:55.669301  / # /lava-10133398/bin/lava-test-runner /la=
va-10133398/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644944090764b66fc72e8629

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644944090764b66fc72e862e
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:32:10.970002  + set +x

    2023-04-26T15:32:10.976602  <8>[   10.380618] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133599_1.4.2.3.1>

    2023-04-26T15:32:11.084066  / # #

    2023-04-26T15:32:11.186350  export SHELL=3D/bin/sh

    2023-04-26T15:32:11.187082  #

    2023-04-26T15:32:11.288464  / # export SHELL=3D/bin/sh. /lava-10133599/=
environment

    2023-04-26T15:32:11.289165  =


    2023-04-26T15:32:11.390730  / # . /lava-10133599/environment/lava-10133=
599/bin/lava-test-runner /lava-10133599/1

    2023-04-26T15:32:11.391935  =


    2023-04-26T15:32:11.397038  / # /lava-10133599/bin/lava-test-runner /la=
va-10133599/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64494767ba0c4e0bea2e85f3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494767ba0c4e0bea2e85f8
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T15:46:36.707383  + set<8>[   14.490786] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10133798_1.4.2.3.1>

    2023-04-26T15:46:36.707497   +x

    2023-04-26T15:46:36.811210  / # #

    2023-04-26T15:46:36.911835  export SHELL=3D/bin/sh

    2023-04-26T15:46:36.912053  #

    2023-04-26T15:46:37.012575  / # export SHELL=3D/bin/sh. /lava-10133798/=
environment

    2023-04-26T15:46:37.012765  =


    2023-04-26T15:46:37.113308  / # . /lava-10133798/environment/lava-10133=
798/bin/lava-test-runner /lava-10133798/1

    2023-04-26T15:46:37.113626  =


    2023-04-26T15:46:37.118588  / # /lava-10133798/bin/lava-test-runner /la=
va-10133798/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/6449426f2699926eed2e8605

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449426f2699926eed2e8608
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:25:11.734220  /usr/bin/tpm2_getcap

    2023-04-26T15:25:11.757214  <3>[   12.466483] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:12.781021  <3>[   13.489851] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:13.804733  <3>[   14.513846] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:14.241453  <3>[   14.950845] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:14.797212  <6>[   15.506501] udevd (139) used greatest=
 stack depth: 13224 bytes left

    2023-04-26T15:25:14.828749  <3>[   15.537528] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:15.853018  <3>[   16.562842] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:16.877515  <3>[   17.586852] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:25:17.901293  <3>[   18.610838] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449426f2699926eed2e860a
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:25:10.258504  + <8>[   10.966778] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10133384_1.4.2.3.1>

    2023-04-26T15:25:10.258961  set +x

    2023-04-26T15:25:10.368209  / # #

    2023-04-26T15:25:10.470755  export SHELL=3D/bin/sh

    2023-04-26T15:25:10.471559  #

    2023-04-26T15:25:10.573087  / # export SHELL=3D/bin/sh. /lava-10133384/=
environment

    2023-04-26T15:25:10.573922  =


    2023-04-26T15:25:10.675531  / # . /lava-10133384/environment/lava-10133=
384/bin/lava-test-runner /lava-10133384/1

    2023-04-26T15:25:10.677000  =


    2023-04-26T15:25:10.682111  / # /lava-10133384/bin/lava-test-runner /la=
va-10133384/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6449441a70476bf0232e85eb

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449441a70476bf0232e85ee
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:26.723544  /usr/bin/tpm2_getcap

    2023-04-26T15:32:26.744618  <3>[   12.700478] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:27.769209  <3>[   13.724939] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:27.967925  <3>[   13.923811] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:28.793090  <3>[   14.749514] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:29.817316  <3>[   15.773524] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:29.868379  <6>[   15.824628] udevd (142) used greatest=
 stack depth: 12656 bytes left

    2023-04-26T15:32:30.843122  <3>[   16.798509] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:31.866886  <3>[   17.822523] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:32.890313  <3>[   18.846522] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449441a70476bf0232e85f0
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:32:25.256300  + set<8>[   11.211281] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10133522_1.4.2.3.1>

    2023-04-26T15:32:25.256386   +x

    2023-04-26T15:32:25.360565  / # #

    2023-04-26T15:32:25.461737  export SHELL=3D/bin/sh

    2023-04-26T15:32:25.462436  #

    2023-04-26T15:32:25.563800  / # export SHELL=3D/bin/sh. /lava-10133522/=
environment

    2023-04-26T15:32:25.564488  =


    2023-04-26T15:32:25.665957  / # . /lava-10133522/environment/lava-10133=
522/bin/lava-test-runner /lava-10133522/1

    2023-04-26T15:32:25.667138  =


    2023-04-26T15:32:25.672016  / # /lava-10133522/bin/lava-test-runner /la=
va-10133522/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6449478e690810f3e82e8601

  Results:     4 PASS, 3 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449478e690810f3e82e8604
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:46:57.670073  /usr/bin/tpm2_getcap

    2023-04-26T15:46:57.708644  <3>[   16.356291] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:57.780421  <3>[   16.428293] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:58.748405  <3>[   17.395358] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:46:59.789743  <3>[   18.437313] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:00.831146  <3>[   19.478700] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:01.870611  <3>[   20.518312] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:02.912183  <3>[   21.559696] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:03.951358  <3>[   22.599312] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:04.991045  <3>[   23.639306] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449478e690810f3e82e8606
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T15:46:56.077658  + set +x

    2023-04-26T15:46:56.084351  <8>[   14.728728] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10133831_1.4.2.3.1>

    2023-04-26T15:46:56.192129  / # #

    2023-04-26T15:46:56.294693  export SHELL=3D/bin/sh

    2023-04-26T15:46:56.295507  #

    2023-04-26T15:46:56.397101  / # export SHELL=3D/bin/sh. /lava-10133831/=
environment

    2023-04-26T15:46:56.397879  =


    2023-04-26T15:46:56.499437  / # . /lava-10133831/environment/lava-10133=
831/bin/lava-test-runner /lava-10133831/1

    2023-04-26T15:46:56.500588  =


    2023-04-26T15:46:56.505097  / # /lava-10133831/bin/lava-test-runner /la=
va-10133831/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644941895bd7db10632e863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pen=
gutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644941895bd7db10632e8643
        failing since 86 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-26T15:21:19.801968  + set +x
    2023-04-26T15:21:19.802134  [   12.901841] <LAVA_SIGNAL_ENDRUN 0_dmesg =
938505_1.5.2.3.1>
    2023-04-26T15:21:19.909675  / # #
    2023-04-26T15:21:20.011172  export SHELL=3D/bin/sh
    2023-04-26T15:21:20.011643  #
    2023-04-26T15:21:20.113051  / # export SHELL=3D/bin/sh. /lava-938505/en=
vironment
    2023-04-26T15:21:20.113497  =

    2023-04-26T15:21:20.214758  / # . /lava-938505/environment/lava-938505/=
bin/lava-test-runner /lava-938505/1
    2023-04-26T15:21:20.215404  =

    2023-04-26T15:21:20.218750  / # /lava-938505/bin/lava-test-runner /lava=
-938505/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64494264540dfd269d2e85ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/b=
aseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494264540dfd269d2e85ef
        failing since 86 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-26T15:25:17.453409  + set +x
    2023-04-26T15:25:17.453590  [   12.193501] <LAVA_SIGNAL_ENDRUN 0_dmesg =
938527_1.5.2.3.1>
    2023-04-26T15:25:17.560565  / # #
    2023-04-26T15:25:17.662158  export SHELL=3D/bin/sh
    2023-04-26T15:25:17.662606  #
    2023-04-26T15:25:17.763833  / # export SHELL=3D/bin/sh. /lava-938527/en=
vironment
    2023-04-26T15:25:17.764311  =

    2023-04-26T15:25:17.865647  / # . /lava-938527/environment/lava-938527/=
bin/lava-test-runner /lava-938527/1
    2023-04-26T15:25:17.866224  =

    2023-04-26T15:25:17.869888  / # /lava-938527/bin/lava-test-runner /lava=
-938527/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64494570540a03f22e2e8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-q=
srb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494570540a03f22e2e8657
        failing since 86 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-26T15:38:02.823706  + set +x
    2023-04-26T15:38:02.823870  [   13.087918] <LAVA_SIGNAL_ENDRUN 0_dmesg =
938538_1.5.2.3.1>
    2023-04-26T15:38:02.931957  / # #
    2023-04-26T15:38:03.033538  export SHELL=3D/bin/sh
    2023-04-26T15:38:03.033994  #
    2023-04-26T15:38:03.135186  / # export SHELL=3D/bin/sh. /lava-938538/en=
vironment
    2023-04-26T15:38:03.135685  =

    2023-04-26T15:38:03.237161  / # . /lava-938538/environment/lava-938538/=
bin/lava-test-runner /lava-938538/1
    2023-04-26T15:38:03.237820  =

    2023-04-26T15:38:03.241501  / # /lava-938538/bin/lava-test-runner /lava=
-938538/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6449486814b004a3ad2e85ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449486814b004a3ad2e85f3
        failing since 86 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-26T15:50:43.095266  + set +x
    2023-04-26T15:50:43.095420  [   14.320118] <LAVA_SIGNAL_ENDRUN 0_dmesg =
938558_1.5.2.3.1>
    2023-04-26T15:50:43.202932  / # #
    2023-04-26T15:50:43.304634  export SHELL=3D/bin/sh
    2023-04-26T15:50:43.305084  #
    2023-04-26T15:50:43.406299  / # export SHELL=3D/bin/sh. /lava-938558/en=
vironment
    2023-04-26T15:50:43.406752  =

    2023-04-26T15:50:43.507997  / # . /lava-938558/environment/lava-938558/=
bin/lava-test-runner /lava-938558/1
    2023-04-26T15:50:43.508594  =

    2023-04-26T15:50:43.511992  / # /lava-938558/bin/lava-test-runner /lava=
-938558/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644947ddb4422bd9082e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644947ddb4422bd9082e8=
5ea
        failing since 170 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/644947dc842da493762e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-i=
mx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644947dc842da493762e8=
5ec
        failing since 223 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64494a01d4eaddfd272e85ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6sx-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6sx-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494a01d4eaddfd272e85f0
        failing since 111 days (last pass: v6.1-rc4-405-g5cc6cef624e2, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-26T15:57:36.093354  <8>[   38.978123] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1209143_1.5.2.4.1>
    2023-04-26T15:57:36.198936  / # #
    2023-04-26T15:57:37.359037  export SHELL=3D/bin/sh
    2023-04-26T15:57:37.364810  #
    2023-04-26T15:57:38.912256  / # export SHELL=3D/bin/sh. /lava-1209143/e=
nvironment
    2023-04-26T15:57:38.917955  =

    2023-04-26T15:57:38.918287  / # . /lava-1209143/environment
    2023-04-26T15:57:41.740276  / /lava-1209143/bin/lava-test-runner /lava-=
1209143/1
    2023-04-26T15:57:41.755541  # /lava-1209143/bin/lava-test-runner /lava-=
1209143/1
    2023-04-26T15:57:41.849153  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64494a13d4eaddfd272e8691

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6ul-1=
4x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494a13d4eaddfd272e8694
        failing since 111 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-26T15:57:52.261233  + set +x
    2023-04-26T15:57:52.262245  <8>[   49.147646] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1209142_1.5.2.4.1>
    2023-04-26T15:57:52.370137  / # #
    2023-04-26T15:57:53.527966  export SHELL=3D/bin/sh
    2023-04-26T15:57:53.533350  #
    2023-04-26T15:57:55.079423  / # export SHELL=3D/bin/sh. /lava-1209142/e=
nvironment
    2023-04-26T15:57:55.085056  =

    2023-04-26T15:57:57.906018  / # . /lava-1209142/environment/lava-120914=
2/bin/lava-test-runner /lava-1209142/1
    2023-04-26T15:57:57.912093  =

    2023-04-26T15:57:57.912387  / # /lava-1209142/bin/lava-test-runner /lav=
a-1209142/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/644948e96e32484e822e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-sd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644948e96e32484e822e85e9
        failing since 111 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-26T15:52:41.862296  / # #
    2023-04-26T15:52:43.022492  export SHELL=3D/bin/sh
    2023-04-26T15:52:43.028211  #
    2023-04-26T15:52:44.575281  / # export SHELL=3D/bin/sh. /lava-1209141/e=
nvironment
    2023-04-26T15:52:44.580944  =

    2023-04-26T15:52:47.402484  / # . /lava-1209141/environment/lava-120914=
1/bin/lava-test-runner /lava-1209141/1
    2023-04-26T15:52:47.408379  =

    2023-04-26T15:52:47.412634  / # /lava-1209141/bin/lava-test-runner /lav=
a-1209141/1
    2023-04-26T15:52:47.503672  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-26T15:52:47.503927  + cd /lava-1209141/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64494a3e64f2688d7a2e8618

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64494a3e64f2688d7a2e861b
        failing since 111 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-26T15:58:26.270683  + set +x<8>[   56.219929] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1209139_1.5.2.4.1>
    2023-04-26T15:58:26.270832  =

    2023-04-26T15:58:26.378362  / # #
    2023-04-26T15:58:27.535999  export SHELL=3D/bin/sh
    2023-04-26T15:58:27.541421  #
    2023-04-26T15:58:27.541590  / # export SHELL=3D/bin/sh
    2023-04-26T15:58:29.087347  / # . /lava-1209139/environment
    2023-04-26T15:58:31.912203  /lava-1209139/bin/lava-test-runner /lava-12=
09139/1
    2023-04-26T15:58:31.918244  . /lava-1209139/environment
    2023-04-26T15:58:31.918554  / # /lava-1209139/bin/lava-test-runner /lav=
a-1209139/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64494f102d47747e3d2e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-k3-j721e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-k3-j721e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494f102d47747e3d2e8=
62d
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 2          =


  Details:     https://kernelci.org/test/plan/id/644942a5012314e8072e85e8

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-colla=
bora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44942a5012314e8072e85eb
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:26:13.660422  /usr/bin/tpm2_getcap

    2023-04-26T15:26:13.683753  <3>[   12.895018] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:14.684780  <3>[   13.896021] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:14.707035  <3>[   13.918368] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:15.731595  <3>[   14.943048] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:16.758407  <3>[   15.969379] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:16.842329  <6>[   16.053209] udevd (146) used greatest=
 stack depth: 13080 bytes left

    2023-04-26T15:26:17.782096  <3>[   16.993036] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:18.805699  <3>[   18.017385] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:26:19.830892  <3>[   19.042375] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644942a5012314e8072e85ed
        failing since 29 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:26:12.192242  + set +x<8>[   11.402067] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10133397_1.4.2.3.1>

    2023-04-26T15:26:12.192677  =


    2023-04-26T15:26:12.299869  / # #

    2023-04-26T15:26:12.402223  export SHELL=3D/bin/sh

    2023-04-26T15:26:12.402898  #

    2023-04-26T15:26:12.504096  / # export SHELL=3D/bin/sh. /lava-10133397/=
environment

    2023-04-26T15:26:12.504311  =


    2023-04-26T15:26:12.604899  / # . /lava-10133397/environment/lava-10133=
397/bin/lava-test-runner /lava-10133397/1

    2023-04-26T15:26:12.605171  =


    2023-04-26T15:26:12.609987  / # /lava-10133397/bin/lava-test-runner /la=
va-10133397/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6449440f0764b66fc72e864d

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/ba=
seline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449440f0764b66fc72e8650
        failing since 1 day (last pass: v6.3-225-g0a6daccdbdd65, first fail=
: v6.3-1432-g527c4dda86b8)

    2023-04-26T15:32:12.454040  /usr/bin/tpm2_getcap

    2023-04-26T15:32:12.476268  <3>[   13.285324] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:13.088873  <3>[   13.897674] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:13.501310  <3>[   14.309341] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:14.527733  <3>[   15.336314] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:15.552415  <3>[   16.361312] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:15.562175  <6>[   16.370764] udevd (145) used greatest=
 stack depth: 13432 bytes left

    2023-04-26T15:32:15.568843  <6>[   16.377315] udevd (150) used greatest=
 stack depth: 13416 bytes left

    2023-04-26T15:32:16.576772  <3>[   17.385312] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:32:17.601182  <3>[   18.409678] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449440f0764b66fc72e8652
        failing since 29 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-26T15:32:10.992174  + <8>[   11.799566] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10133586_1.4.2.3.1>

    2023-04-26T15:32:10.992267  set +x

    2023-04-26T15:32:11.095985  / # #

    2023-04-26T15:32:11.196726  export SHELL=3D/bin/sh

    2023-04-26T15:32:11.196972  #

    2023-04-26T15:32:11.297503  / # export SHELL=3D/bin/sh. /lava-10133586/=
environment

    2023-04-26T15:32:11.297716  =


    2023-04-26T15:32:11.398314  / # . /lava-10133586/environment/lava-10133=
586/bin/lava-test-runner /lava-10133586/1

    2023-04-26T15:32:11.398596  =


    2023-04-26T15:32:11.403369  / # /lava-10133586/bin/lava-test-runner /la=
va-10133586/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6449479f690810f3e82e862e

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
449479f690810f3e82e8631
        new failure (last pass: v6.3-rc7-226-gf05a2341f2478)

    2023-04-26T15:47:13.643555  /usr/bin/tpm2_getcap

    2023-04-26T15:47:13.675499  <3>[   15.344855] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:13.964829  <3>[   15.635318] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:14.712973  <3>[   16.383333] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:15.749073  <3>[   17.419286] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:16.787433  <3>[   18.456887] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:17.822207  <3>[   19.491874] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:18.861197  <3>[   20.530911] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:19.897591  <3>[   21.567228] tpm tpm0: Operation Timed=
 out

    2023-04-26T15:47:20.934257  <3>[   22.604216] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6449479f690810f3e82e8633
        failing since 26 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-26T15:47:12.089218  + set<8>[   13.759247] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10133818_1.4.2.3.1>

    2023-04-26T15:47:12.089301   +x

    2023-04-26T15:47:12.193742  / # #

    2023-04-26T15:47:12.294357  export SHELL=3D/bin/sh

    2023-04-26T15:47:12.294611  #

    2023-04-26T15:47:12.395219  / # export SHELL=3D/bin/sh. /lava-10133818/=
environment

    2023-04-26T15:47:12.395379  =


    2023-04-26T15:47:12.495931  / # . /lava-10133818/environment/lava-10133=
818/bin/lava-test-runner /lava-10133818/1

    2023-04-26T15:47:12.496206  =


    2023-04-26T15:47:12.501067  / # /lava-10133818/bin/lava-test-runner /la=
va-10133818/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64494302c9db05a7822e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494302c9db05a7822e8=
5fa
        failing since 78 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644943179fce84cb842e8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644943179fce84cb842e8=
646
        failing since 78 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/644941ea76a94cba912e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644941ea76a94cba912e8=
5e7
        new failure (last pass: v6.3-1432-g527c4dda86b8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6449420bb848a5deb92e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6449420bb848a5deb92e8=
5e9
        new failure (last pass: v6.3-1432-g527c4dda86b8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6449420bba4ceeed1b2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6449420bba4ceeed1b2e8=
5f2
        new failure (last pass: v6.3-1432-g527c4dda86b8) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644944135f001830462e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644944135f001830462e8=
61b
        failing since 78 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494ce83dbc5dad802e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494ce83dbc5dad802e8=
5eb
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494815593350d8002e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494815593350d8002e8=
5f8
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494cfc3dbc5dad802e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494cfc3dbc5dad802e8=
5ef
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494816593350d8002e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494816593350d8002e8=
609
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494e78fbf301d0842e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494e78fbf301d0842e8=
5ea
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6449485114b004a3ad2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6449485114b004a3ad2e8=
5e8
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494e64f88eac8b5c2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494e64f88eac8b5c2e8=
5e7
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64494828bdb8dcdc612e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494828bdb8dcdc612e8=
61f
        failing since 196 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/644948ce93a7c6e1fb2e865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644948ce93a7c6e1fb2e8=
65d
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64494920b76a48d64e2e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494920b76a48d64e2e8=
5ee
        failing since 7 days (last pass: v6.3-rc7-140-g88d3973741d7, first =
fail: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/644948f805ed93ad062e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644948f805ed93ad062e8=
5f1
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6449491fb76a48d64e2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6449491fb76a48d64e2e8=
5e8
        failing since 7 days (last pass: v6.3-rc7-140-g88d3973741d7, first =
fail: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/6449418625f38d83a62e862f

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora=
/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6449418625f38d8=
3a62e8686
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        2 lines

    2023-04-26T15:21:18.863766   EC =3D 0x25: DABT (current EL), IL =3D 32 =
bits

    2023-04-26T15:21:18.866717  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-26T15:21:18.870706  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-26T15:21:18.875140  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-26T15:21:18.878982  kern  :alert : Data abort info:

    2023-04-26T15:21:18.882817  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T15:21:18.886953  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-26T15:21:18.893624  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000020fa7000

    2023-04-26T15:21:18.905397  kern  :alert : [00000000000<8>[   19.235348=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6449418625f38d8=
3a62e8687
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        12 lines

    2023-04-26T15:21:18.840128  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-26T15:21:18.843341  kern  :alert : Mem abort info:

    2023-04-26T15:21:18.847470  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-26T15:21:18.859012  kern  :alert :  <8>[   19.185707] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64494300c9db05a7822e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494300c9db05a7822e8=
5f7
        failing since 78 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/644949b2292e2196162e85ed

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644949b2292e219=
6162e85f4
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        2 lines

    2023-04-26T15:56:24.677871  kern  :emerg : Code: 97fbe910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-26T15:56:24.678178  <8>[   23.291710] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-26T15:56:24.678353  + set +x

    2023-04-26T15:56:24.678514  <8>[   23.293556] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10134052_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644949b2292e219=
6162e85f5
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        12 lines

    2023-04-26T15:56:24.636988  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T15:56:24.637194  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-26T15:56:24.637301  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007939a000

    2023-04-26T15:56:24.637415  kern  :alert : [0000000000000008] pgd=3D080=
00000794da003, p4d=3D08000000794da003, pud=3D080000007937f003, pmd=3D000000=
0000000000

    2023-04-26T15:56:24.637507  <8>[   23.270645] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-04-26T15:56:24.637597  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64494a668715c17bff2e85e7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora=
/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora=
/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64494a668715c17=
bff2e85ee
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        2 lines

    2023-04-26T15:59:14.519362  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-26T15:59:14.519466  kern  :emerg : Code: 97f7ad10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-26T15:59:14.519556  <8>[   20.640517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-26T15:59:14.519631  + set +x

    2023-04-26T15:59:14.519703  <8>[   20.642339] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10134060_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64494a668715c17=
bff2e85ef
        new failure (last pass: v6.3-1432-g527c4dda86b8)
        12 lines

    2023-04-26T15:59:14.495407  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-26T15:59:14.495506  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-26T15:59:14.495579  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078e1e000

    2023-04-26T15:59:14.495669  kern  :alert : [0000000000000008] pgd=3D080=
0000078f56003

    2023-04-26T15:59:14.495741  <8>[   20.617688] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644942df55255c69522e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644942df55255c69522e8=
611
        failing since 78 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644942dd61fd7e57412e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644942dd61fd7e57412e8=
60e
        failing since 77 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64494ad515cc8d3e132e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-5614-g=
be56a31d3d65/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64494ad515cc8d3e132e8=
5f9
        new failure (last pass: v6.3-1432-g527c4dda86b8) =

 =20
