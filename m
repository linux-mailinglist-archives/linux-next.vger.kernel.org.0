Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFA75110C0
	for <lists+linux-next@lfdr.de>; Wed, 27 Apr 2022 07:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357363AbiD0GBp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Apr 2022 02:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241940AbiD0GBm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Apr 2022 02:01:42 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99602ED6D
        for <linux-next@vger.kernel.org>; Tue, 26 Apr 2022 22:58:30 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id t13so641694pgn.8
        for <linux-next@vger.kernel.org>; Tue, 26 Apr 2022 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IUIlpCyvC0FAK7n6YPdICYJgpo8pEYo5HXdmSg5ZciE=;
        b=FB5D4qBZ7pFe/XCwAEnNBDEabAvrfQ+9niiD82dLOowtzaithzMkvxmmP4bstgS9/x
         BsKDKjPLwTOx/+E7OlD/u48QCfsfRBV8dcJIJeuvUghqeC86Cfpi7/CFihemA9PKTZJ9
         4Drd+naX2ZEEb9c9VSuh96Dt41c6K6cmy8AXXJiw5uOWXtLQtio0t9SWUe20nC08nYnk
         2yx704Rv64uv0LpoqDxHzJywi+BFmeBLRj3N8ZB0+QHiFiFdZJ2PtchJX/IHqe1spO5g
         fwOgn4J7Ta0ZouFGC5+K10xC7Dz4c55OQJC5kpoFh8oxrdfQl7ZWEa06Q1PeA9I/C9zo
         zucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IUIlpCyvC0FAK7n6YPdICYJgpo8pEYo5HXdmSg5ZciE=;
        b=dPXcpgvx/AeyKf+MEloJOF4rwyNrOF6/em4l2yMyJ2rltqK985dd4vsxxN/E/Z0q/D
         wMbx1E3LLd5Iwc8Md51JNNx+TUuNv+Dw4uF4Q97fRRtuAA+0W3zElKl2K1l579ndqdWc
         oy/9vHuIJDvv8xOlMt4d8HS3oM/Pw2aUUB+HiQ0Hw7uUpiTcEhCDasYGnbrjE3q57RVK
         uNLK3ShI5A7Xm8uEgme6HFzS57Bclfr/o80S+S3wcD93mECQLy90RuwfJ97NIqkrugBH
         ZMV1rrpCMcJyXtygTVkpAszFe8TpWnqwLF9U+wd+2zVRCanAp0aGcTI3lfLPPfmD9Wj4
         X2Lw==
X-Gm-Message-State: AOAM530T10vHYi2gnkF7nml6eWf3LC6+O7+8s/8cLiD5qXtMgrDNJknw
        tTe5oBKdMGcjHng2qr4sFqqj/9u0FyrlwWGEBJo=
X-Google-Smtp-Source: ABdhPJzy/CfCbtwTJB+QWdOp9/1yEWl7co/DGDxVJpp69vBh5GYxVB1A+N+RSMk5FoU5P5BYUX5rrA==
X-Received: by 2002:a62:62c2:0:b0:50d:4274:4e9d with SMTP id w185-20020a6262c2000000b0050d42744e9dmr13494548pfb.54.1651039109612;
        Tue, 26 Apr 2022 22:58:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a8b8e00b001d95cdb62d4sm5319387pjn.33.2022.04.26.22.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 22:58:29 -0700 (PDT)
Message-ID: <6268db85.1c69fb81.25d2a.d033@mx.google.com>
Date:   Tue, 26 Apr 2022 22:58:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220426
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 383 runs, 52 regressions (next-20220426)
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

next/master baseline: 383 runs, 52 regressions (next-20220426)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-14 | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-14 | defconfig=
                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 13         =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+crypto             | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-14 | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220426/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220426
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      088fb7eff3496e0f61fdf68bda89b81a4d0a4434 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a66370015903f6ff9472

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a66370015903f6ff9=
473
        failing since 26 days (last pass: next-20220328, first fail: next-2=
0220329) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a3cbff029f8de0ff945a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a3cbff029f8de0ff9=
45b
        failing since 181 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a559315e902736ff94d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a559315e902736ff9=
4d2
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a6ea585e0bd24dff9501

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a6ea585e0bd24dff9=
502
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a7236f291ff218ff94b3

  Results:     93 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
68a7236f291ff218ff94bf
        failing since 12 days (last pass: next-20220411, first fail: next-2=
0220414)

    2022-04-27T02:14:35.920836  /lava-112707/1/../bin/lava-test-case
    2022-04-27T02:14:35.965176  <8>[   17.013105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-27T02:14:35.965580  /lava-112707/1/../bin/lava-test-case
    2022-04-27T02:14:35.965818  <8>[   17.025740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-27T02:14:35.966050  /lava-112707/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a29b3e2e4ec8acff950a

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
68a29b3e2e4ec8acff9517
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413)

    2022-04-27T01:54:24.582468  /lava-112674/1/../bin/lava-test-case
    2022-04-27T01:54:24.627118  <8>[   15.922530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-27T01:54:24.627424  /lava-112674/1/../bin/lava-test-case
    2022-04-27T01:54:24.627582  <8>[   15.933891] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-27T01:54:24.627735  /lava-112674/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a3897ea0b40278ff94b7

  Results:     93 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
68a3897ea0b40278ff94c3
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413)

    2022-04-27T01:59:24.542558  /lava-112679/1/../bin/lava-test-case
    2022-04-27T01:59:24.586467  <8>[   16.534148] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-27T01:59:24.586867  /lava-112679/1/../bin/lava-test-case
    2022-04-27T01:59:24.587099  <8>[   16.546658] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-27T01:59:24.587326  /lava-112679/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a4a310809c513dff9461

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
68a4a310809c513dff946e
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413)

    2022-04-27T02:04:03.260679  /lava-112690/1/../bin/lava-test-case
    2022-04-27T02:04:03.305059  <8>[   15.809328] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-27T02:04:03.305619  /lava-112690/1/../bin/lava-test-case
    2022-04-27T02:04:03.307288  <8>[   15.821780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-27T02:04:03.307532  /lava-112690/1/../bin/lava-test-case
    2022-04-27T02:04:03.307682  <8>[   15.834514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-27T02:04:03.307877  /lava-112690/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a556315e902736ff946d

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
68a556315e902736ff947a
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413)

    2022-04-27T02:07:03.916876  /lava-112695/1/../bin/lava-test-case
    2022-04-27T02:07:03.961854  <8>[   15.777256] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-27T02:07:03.962208  /lava-112695/1/../bin/lava-test-case
    2022-04-27T02:07:03.963575  <8>[   15.790045] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-27T02:07:03.963763  /lava-112695/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a7725a6440b623ff94f5

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
68a7735a6440b623ff9502
        failing since 12 days (last pass: next-20220411, first fail: next-2=
0220414)

    2022-04-27T02:16:07.124603  /lava-112712/1/../bin/lava-test-case
    2022-04-27T02:16:07.168104  <8>[   16.862071] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-27T02:16:07.168448  /lava-112712/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a646da6f09f1c8ff9461

  Results:     50 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/626=
8a646da6f09f1c8ff9477
        new failure (last pass: next-20220422)

    2022-04-27T02:11:02.521917  /lava-112703/1/../bin/lava-test-case
    2022-04-27T02:11:02.522296  <8>[   14.754966] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-27T02:11:02.522535  /lava-112703/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a39e7ea0b40278ff953b

  Results:     50 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/626=
8a39e7ea0b40278ff9551
        new failure (last pass: next-20220422)

    2022-04-27T01:59:42.527825  /lava-112682/1/../bin/lava-test-case
    2022-04-27T01:59:42.528254  <8>[   14.834975] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268b84eec176a1202ff9468

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268b84eec176a1202ff9=
469
        failing since 48 days (last pass: next-20220308, first fail: next-2=
0220309) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 13         =


  Details:     https://kernelci.org/test/plan/id/6268a446db47db85ddff946a

  Results:     74 PASS, 17 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-typec-phy1-probed: https://kernelci.org/test/c=
ase/id/6268a446db47db85ddff9476
        new failure (last pass: next-20220421)

    2022-04-27T02:02:27.734165  <8>[   49.877803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy0-probed RESULT=3Dfail>
    2022-04-27T02:02:28.736117  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:28.748685  <8>[   50.895935] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-typec-phy0-probed: https://kernelci.org/test/c=
ase/id/6268a446db47db85ddff9477
        new failure (last pass: next-20220421)

    2022-04-27T02:02:27.717924  /lava-6185638/1/../bin/lava-test-case   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/6268a446db47db85ddff94a9
        new failure (last pass: next-20220421)

    2022-04-27T02:02:24.885436  /lava-6185638/1/../bin/lava-test-case   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/6268a446db47db85ddff94aa
        new failure (last pass: next-20220421)

    2022-04-27T02:02:22.861975  <8>[   45.008490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-version RESULT=3Dpass>
    2022-04-27T02:02:23.867065  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:23.881119  <8>[   46.026692] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-audio-codec-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-kb_wake_angle: https://kernelci.org/=
test/case/id/6268a446db47db85ddff94ac
        new failure (last pass: next-20220421)

    2022-04-27T02:02:22.832629  /lava-6185638/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensorhub-probed: https://kernelci.org/test/cas=
e/id/6268a446db47db85ddff94b0
        new failure (last pass: next-20220421)

    2022-04-27T02:02:20.754487  <8>[   42.899537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-driver-present RESULT=3Dpass>
    2022-04-27T02:02:21.758765  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:21.772784  <8>[   43.917840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6268a446db47db85ddff94b2
        new failure (last pass: next-20220421)

    2022-04-27T02:02:20.724174  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:20.737076  <8>[   42.883243] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6268a446db47db85ddff94b3
        new failure (last pass: next-20220421)

    2022-04-27T02:02:19.705448  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:19.721197  <8>[   41.864811] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6268a446db47db85ddff94b4
        new failure (last pass: next-20220421)

    2022-04-27T02:02:17.673302  <8>[   39.817296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>
    2022-04-27T02:02:18.687730  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:18.701193  <8>[   40.846936] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/6268a446db47db85ddff94b5
        new failure (last pass: next-20220421)

    2022-04-27T02:02:17.657612  /lava-6185638/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
268a446db47db85ddff94b6
        new failure (last pass: next-20220421)

    2022-04-27T02:02:15.636651  <8>[   37.782988] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-driver-present RESULT=3Dpass>
    2022-04-27T02:02:16.640517  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:16.651880  <8>[   38.800252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
6268a446db47db85ddff94bb
        new failure (last pass: next-20220421)

    2022-04-27T02:02:15.559451  /lava-6185638/1/../bin/lava-test-case
    2022-04-27T02:02:15.572018  <8>[   37.719018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-debugfs-attr-console_log: https://kernelci.org/=
test/case/id/6268a446db47db85ddff94c2
        new failure (last pass: next-20220421)

    2022-04-27T02:02:13.440376  <8>[   35.584590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-probed RESULT=3Dpass>
    2022-04-27T02:02:14.440622  /lava-6185638/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a5d619c0a10d1aff9487

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a5d619c0a10d1aff9=
488
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a81b4400326eb8ff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a81b4400326eb8ff9=
45a
        new failure (last pass: next-20220421) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a93ce8973c9b39ff94a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a93ce8973c9b39ff9=
4a5
        failing since 6 days (last pass: next-20220414, first fail: next-20=
220420) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268aaa594a8ef2d59ff9464

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268aaa594a8ef2d59ff9=
465
        failing since 6 days (last pass: next-20220414, first fail: next-20=
220420) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a83848fc1e6368ff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a83848fc1e6368ff9=
45a
        failing since 6 days (last pass: next-20220414, first fail: next-20=
220420) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a84b48fc1e6368ff947d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/clang-14/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a84b48fc1e6368ff9=
47e
        failing since 6 days (last pass: next-20220414, first fail: next-20=
220420) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a374ab5886ed63ff9483

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a374ab5886ed63ff9=
484
        failing since 7 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a4f1f998cc6d4cff9484

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a4f1f998cc6d4cff9=
485
        failing since 7 days (last pass: next-20220413, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a66d55aeaca113ff9465

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a66d55aeaca113ff9=
466
        failing since 6 days (last pass: next-20220414, first fail: next-20=
220420) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a7d44706b96869ff9464

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a7d44706b96869ff9=
465
        failing since 7 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6268ac0d41d2a306d6ff9463

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268ac0d41d2a306d6ff9=
464
        failing since 7 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a3817ea0b40278ff946e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a3817ea0b40278ff9=
46f
        failing since 7 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a4c710809c513dff94d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a4c710809c513dff9=
4d4
        failing since 7 days (last pass: next-20220413, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a515892f10be03ff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a515892f10be03ff9=
45a
        failing since 6 days (last pass: next-20220414, first fail: next-20=
220420) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a6accd9cf5bb86ff94a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a6accd9cf5bb86ff9=
4aa
        failing since 7 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6268aa08948ffe400aff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268aa08948ffe400aff9=
45a
        failing since 7 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6268abae805ce575faff9475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268abae805ce575faff9=
476
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a65de95c643033ff946a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a65de95c643033ff9=
46b
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a7c64caf490f72ff945f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a7c64caf490f72ff9=
460
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a0f9c6f1f689a5ff9464

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a0f9c6f1f689a5ff9=
465
        failing since 13 days (last pass: next-20220411, first fail: next-2=
0220413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a5f0073ddf70f8ff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a5f0073ddf70f8ff9=
45a
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a10370ecc32082ff947d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a10370ecc32082ff9=
47e
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a6aee95c643033ff94a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a6aee95c643033ff9=
4a7
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a0f33def2be096ff9477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a0f33def2be096ff9=
478
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a519892f10be03ff9465

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a519892f10be03ff9=
466
        new failure (last pass: next-20220422) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6268a0f53def2be096ff9485

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220426/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6268a0f53def2be096ff9=
486
        new failure (last pass: next-20220422) =

 =20
