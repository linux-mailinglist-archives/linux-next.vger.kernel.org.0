Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87EBA60739B
	for <lists+linux-next@lfdr.de>; Fri, 21 Oct 2022 11:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbiJUJNK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Oct 2022 05:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbiJUJMw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Oct 2022 05:12:52 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFA113642C
        for <linux-next@vger.kernel.org>; Fri, 21 Oct 2022 02:12:26 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s196so2036482pgs.3
        for <linux-next@vger.kernel.org>; Fri, 21 Oct 2022 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eLbkNwKlV9xfaz8rui5Efjy7tOWNmmlaUTyN1SKS8Ak=;
        b=3o2H8d6eNT+o2xcP0xMvdKLbpNPw0oXgJFAjgjszxSWjQnjbPO7guwLWGqhlcZf9MT
         GnyWgX545mVYfQI/A1g8tDhXYwahUjJKTmd4rd/ERkgGUI35pVyvKAxZ8Bw4c4ENXVjM
         GnObbCBTcgOnnOEOgqbU/tr5GpAnM8Fp9nc/czxWX7azZjFuyab0godlh76gOy+hJvu9
         6q6jwvnDQUT6Ga/HeI13v7xt4lEPXzFOMATyRD9XMGeuMY4+eq1PypAoeQnKyNNHjyWF
         LtmdopQiLLmbCpfro90iSiKbQLBmEm5raKGBPHOut4uzw2rRjR3UvaMFHMYQEtjJffBa
         A6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLbkNwKlV9xfaz8rui5Efjy7tOWNmmlaUTyN1SKS8Ak=;
        b=GM9J+6Y9j4UqqNLtp7DrzSLacWx5ln9MpCrU9dFjZmPG68SB+Fb6JNgYLlKQa7VclC
         hpvoOAyzuRF4gKoOKtXwcqoIMmLW4vcuLW6YjJ/MwezDkbLAQZ8bF1z/fW8sS2LDSiQY
         KHUQr6pORKSU8SbJ2BjeUoGF3Y2behVV4zxX9rU28AkvGcgz8SFgoKHNQD2XmEE6d+TE
         KsQR9YBLWlGc8iwSzBsxPUNE2IGbowYMt7QJkYHaDiDxq8Un8on/Ex+ZZTQ3xckFIVmq
         cxk0Umv00La/XQFK9zkqhhvUutJcR663uvryJOUdI8nfFTRpdKBDbiDbiGbhEfrBpBv3
         ctDg==
X-Gm-Message-State: ACrzQf24ghsDd07K+FFDAszq9aGoW4Y/8RZ9qyAaWuCcs2doIC7S8+gs
        VWb4UyXpUZEMyHsD0R6ltvjVyBVZqy9lvYMS
X-Google-Smtp-Source: AMsMyM7Fgp57egPR860Ybt4miv9McbFv8jcj3KeUxjUmIX37iyJtJGZojVYp9fJqWGmGv2yPHOVGSw==
X-Received: by 2002:a63:4c2:0:b0:460:869a:f5ba with SMTP id 185-20020a6304c2000000b00460869af5bamr15262440pge.362.1666343514125;
        Fri, 21 Oct 2022 02:11:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r60-20020a17090a43c200b0020d9c2f6c39sm1217395pjg.34.2022.10.21.02.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:11:53 -0700 (PDT)
Message-ID: <63526259.170a0220.5e065.298f@mx.google.com>
Date:   Fri, 21 Oct 2022 02:11:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.1-rc1-268-g850279f2b0067
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 485 runs,
 11 regressions (v6.1-rc1-268-g850279f2b0067)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 485 runs, 11 regressions (v6.1-rc1-268-g850279=
f2b0067)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc1-268-g850279f2b0067/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc1-268-g850279f2b0067
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      850279f2b0067b6de4a949ba79f2b7704c834eb7 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/635245fb24f9e3f0075e5bb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635245fb24f9e3f0075e5=
bb5
        failing since 11 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6352280ed0f0f419565e5b40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6352280ed0f0f41=
9565e5b44
        failing since 270 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-10-21T05:02:43.866883  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-10-21T05:02:43.867173  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-10-21T05:02:43.869844  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-10-21T05:02:43.915445  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63522fae193b90f2db5e5b3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522fae193b90f2db5e5=
b3e
        failing since 174 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63523878a255c13d735e5b3b

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/635=
23878a255c13d735e5b52
        failing since 1 day (last pass: v6.1-rc1-192-gdfe701541ba9, first f=
ail: v6.1-rc1-242-g2cf0df170b5f)

    2022-10-21T06:12:51.056028  /lava-188280/1/../bin/lava-test-case
    2022-10-21T06:12:51.056436  <8>[   16.921472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/635228c35d4414ad305e5b62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-na=
nopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-na=
nopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635228c35d4414ad305e5=
b63
        new failure (last pass: v6.1-rc1-242-g2cf0df170b5f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/635230ec7a4ecd8a4e5e5b4d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/635230ec7a4ecd8=
a4e5e5b50
        new failure (last pass: v6.1-rc1-242-g2cf0df170b5f)
        2 lines

    2022-10-21T05:40:30.271176  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-10-21T05:40:30.271418  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-10-21T05:40:30.310135  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2022-10-21T05:40:30.310631  kern  :alert : Data abort info:
    2022-10-21T05:40:30.310882  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
045
    2022-10-21T05:40:30.311116  <8>[   18.782763] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-10-21T05:40:30.311356  kern  :alert :  <8>[   18.790950] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 2715765_1.5.2.4.1>
    2022-10-21T05:40:30.311587   CM =3D 0, WnR =3D 1
    2022-10-21T05:40:30.311809  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D00000000099da000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/635230ec7a4ecd8=
a4e5e5b51
        new failure (last pass: v6.1-rc1-242-g2cf0df170b5f)
        12 lines =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/635229761f0a624aa45e5b5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635229761f0a624aa45e5=
b60
        failing since 9 days (last pass: v6.0-9666-g02c05e0b8d5c, first fai=
l: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6352294b3f1206438e5e5b4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6352294b3f1206438e5e5=
b4d
        new failure (last pass: v6.1-rc1-242-g2cf0df170b5f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/635228bf5d4414ad305e5b5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-=
pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635228bf5d4414ad305e5=
b5d
        new failure (last pass: v6.1-rc1-242-g2cf0df170b5f) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/63522d8e4ce228ec625e5b3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc1-26=
8-g850279f2b0067/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522d8e4ce228ec625e5=
b40
        new failure (last pass: v6.1-rc1-242-g2cf0df170b5f) =

 =20
