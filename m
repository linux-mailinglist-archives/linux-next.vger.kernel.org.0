Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 598474FFD38
	for <lists+linux-next@lfdr.de>; Wed, 13 Apr 2022 19:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237521AbiDMR74 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Apr 2022 13:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbiDMR7x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Apr 2022 13:59:53 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7456E344
        for <linux-next@vger.kernel.org>; Wed, 13 Apr 2022 10:57:26 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso6979326pju.1
        for <linux-next@vger.kernel.org>; Wed, 13 Apr 2022 10:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MaQBfs5+GtMVvknNX8rhsCIFL8D8QMTv1lzBRBY5yU4=;
        b=wiOtsBBPLoHCrGTOsHDUtONdDZHI5X7c7yaD6wuii1y7tPzr1OIDtVPkipeZvf6pMI
         kHC+a3Sh+Ta0sJ586WVPLu1TV36hXomJRpYZvRl1jWWgt0kWaXyFZls8hb9AmW3M2NEK
         U28+/Q0zZhmZ1+w78sFGHKm1Xs1fFkHkypFWKPT3bD+rtFMkeESj9Bw6RPYMvdQXI+9N
         fXehtDUqVW6qgmOIIfJlHC66Mxih39NWuf7keJiLbzzyAJYfZKv2EJOlb7POrT1GLrgv
         MWQSZXZ1HLv7Gtzk4PvHGs8gtMial1bXIWUS+4aOSYQEcO8bxtCDFZqmxPDRXIC5Bcwt
         IZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MaQBfs5+GtMVvknNX8rhsCIFL8D8QMTv1lzBRBY5yU4=;
        b=G/5vZUYMkRh1y9TGYRFEhCj5IjPjq4zcAR7/PehAivQldHTbIFqPXga2PsJwGKMk09
         mal1I54YDIcoNda8g0oLVAYphCmypOpSB1JWova7/3AeqWPgxycF2ixBS8dG2du8IVCh
         dCFnShDLIgXO3X7JeIhqjeGBYMdM4TIy8XtiawNvmjxMdMYRcW7kqgqaV1AkSEl621+v
         WrkTp0Och0tfB54tvOX9sq7l6JOsEvo4ZTIDu2hCz7pPbUw2Ev2f/arA4K1rQrcUh3TG
         u/Ei/+eu8p/3AtBEa1G43lKl6Abuvar7jQkLKU0Su/MvtCGZQCmk8imLQfWvYm+sR6Ad
         vBpw==
X-Gm-Message-State: AOAM531f9rA1FyaMV8BMtSZ/FtSH3E6IZZrtfSFRRoieXMXQJw/3YarL
        0LjhZ88mfSs1sJZwuWpsbSeVjC5kzYGX/HwK
X-Google-Smtp-Source: ABdhPJyY8FN3KJi+344FLfrU18l6FRL5LFH3dWqYl5gsErer0Wcj0sQUn3aJ0Op7/DDea/pSa1ib/g==
X-Received: by 2002:a17:902:f70a:b0:153:88c7:774 with SMTP id h10-20020a170902f70a00b0015388c70774mr43308008plo.166.1649872645429;
        Wed, 13 Apr 2022 10:57:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o123-20020a634181000000b0039d300c417dsm6602052pga.64.2022.04.13.10.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:57:25 -0700 (PDT)
Message-ID: <62570f05.1c69fb81.63d04.1c98@mx.google.com>
Date:   Wed, 13 Apr 2022 10:57:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc2-321-g174c9b9949da
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 377 runs,
 6 regressions (v5.18-rc2-321-g174c9b9949da)
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

next/pending-fixes baseline: 377 runs, 6 regressions (v5.18-rc2-321-g174c9b=
9949da)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug   | 1          =

da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
                  | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc2-321-g174c9b9949da/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc2-321-g174c9b9949da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      174c9b9949dacdde49da58d2aaaf6f5c87f4b274 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/6256f2522febb8f626ae06a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6256f2522febb8f626ae0=
6a1
        new failure (last pass: v5.18-rc1-608-g6537d9b7dc91) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/6256d71a16080668e7ae06b7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6256d71a1608066=
8e7ae06bf
        failing since 79 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-13T13:58:29.646752  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-04-13T13:58:29.768129  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-13T13:58:29.768422  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-13T13:58:29.768595  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6256dac33eb2f031b5ae070a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6256dac33eb2f031b5ae0=
70b
        new failure (last pass: v5.18-rc1-608-g6537d9b7dc91) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-10   | defconfig=
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6256d93800d95de9fcae0685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6256d93800d95de9fcae0=
686
        new failure (last pass: v5.18-rc1-608-g6537d9b7dc91) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/6256f1c5db08642002ae0685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6256f1c5db08642002ae0=
686
        new failure (last pass: v5.18-rc1-608-g6537d9b7dc91) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6256df7cf2212b1e36ae0692

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc2-3=
21-g174c9b9949da/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6256df7df2212b1e36ae06b4
        failing since 44 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-13T14:34:11.447450  /lava-6078474/1/../bin/lava-test-case
    2022-04-13T14:34:11.458338  <8>[   35.268611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
