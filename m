Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D641E757299
	for <lists+linux-next@lfdr.de>; Tue, 18 Jul 2023 05:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjGRD61 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Jul 2023 23:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjGRD60 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Jul 2023 23:58:26 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10F2198
        for <linux-next@vger.kernel.org>; Mon, 17 Jul 2023 20:58:12 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5634d8d1db0so3237290eaf.0
        for <linux-next@vger.kernel.org>; Mon, 17 Jul 2023 20:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689652692; x=1692244692;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/7swEskx9eKSHkIh94vRIN/N3TBd4TgYBMhy3vc1e20=;
        b=A7ZraalgDnvaUz7y6Y/5Kzsj4NlpIqCzAm3TzKN3e1zpxSs1zh9GwZ4DSeV7YhIqqR
         ZHWyFz+DHltmbNs8k3osTMI+p3ML7dG398CXRGZmtnCNsUmlJv972cmATgPmUX+2uBEA
         g4oaCBQITR2GOp5mPfSxSOhMyzeP9lGA69ej+gcShqCXgeSeFgEOV9fVYCnCAbqOmMif
         CHkaDDiWXI31wvrrTpPAubvQ0k0ob7JJ9Jr5MIc85Vk3odAn5nZit2SWGhJM7V67daAJ
         n9BVJJkyzmkKauyb+32ZxMWNZ00GKEdmpeN0S8tdG71jbR+1iMO6G+e6O6fecJ6kFypt
         L/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689652692; x=1692244692;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7swEskx9eKSHkIh94vRIN/N3TBd4TgYBMhy3vc1e20=;
        b=Lg/zFjNYZfjW33hAiNisESPEiQklHletHQFUNp+MU2ADz5QephVAfEvKsE9g0g5ca5
         KDwizppOeNmi6wgvxX9YthzeysjhW5f+1EsSvXWZMExNs7mY/3fPvLy1lz2meuhLHEIF
         ogT9nyeU2X9iK6mRezPAP6brhVZEXmbahvZaF4781PwxZxhF7HNqOtFPLEvu8gVNONNi
         lcYGbF2xwuEV0hnLfBpKlr/lwSN2nFgkPGJMrqjr+AqgmmGU3YwY6ayoZXPgvuSSGN7/
         h7+YEwzNan8jzD/bxk0w35WNW6dX2alEyLekQ58DjuYOzS+8GLzVryOnGljZ6gPTrZy8
         0JVg==
X-Gm-Message-State: ABy/qLalAy0TFEjeOut3KBfNbPkTk7G82dnrV9sPT4WtV/Dk6UUHREzl
        OaI2FfkOReSrOVyexvRSHtO7EMP9uUBO1J3HDXt//A==
X-Google-Smtp-Source: APBJJlGy9ibzoEmY7wm8B5c2Te9co58WqIiIt0M34/uO1E5TKVj25P2GFnah1uYzJP3E5GOc6qkI5w==
X-Received: by 2002:a05:6358:90a:b0:131:b4c:b876 with SMTP id r10-20020a056358090a00b001310b4cb876mr12536652rwi.1.1689652690643;
        Mon, 17 Jul 2023 20:58:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n3-20020a62e503000000b00682ad247e5fsm525289pff.179.2023.07.17.20.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:58:09 -0700 (PDT)
Message-ID: <64b60dd1.620a0220.b8eec.1aa2@mx.google.com>
Date:   Mon, 17 Jul 2023 20:58:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230717
X-Kernelci-Report-Type: test
Subject: next/master baseline: 518 runs, 78 regressions (next-20230717)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 518 runs, 78 regressions (next-20230717)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230717/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230717
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2205be537aeb1ca2ace998e2fefaa2be04e393e4 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d17510f54715a58ace43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d17510f54715a58ac=
e44
        failing since 61 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cee47eca0c74038ace5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5cee47eca0c74038ac=
e5e
        failing since 4 days (last pass: next-20230712, first fail: next-20=
230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cecb5667fa9e4e8ace40

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cecb5667fa9e4e8ace45
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-17T23:29:10.827647  <8>[    7.935728] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11104309_1.4.2.3.1>

    2023-07-17T23:29:10.832851  + set +x

    2023-07-17T23:29:10.936927  / # #

    2023-07-17T23:29:11.039138  export SHELL=3D/bin/sh

    2023-07-17T23:29:11.039907  #

    2023-07-17T23:29:11.141481  / # export SHELL=3D/bin/sh. /lava-11104309/=
environment

    2023-07-17T23:29:11.141727  =


    2023-07-17T23:29:11.242323  / # . /lava-11104309/environment/lava-11104=
309/bin/lava-test-runner /lava-11104309/1

    2023-07-17T23:29:11.242665  =


    2023-07-17T23:29:11.248764  / # /lava-11104309/bin/lava-test-runner /la=
va-11104309/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d173b567899ce98ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d173b567899ce98ac=
e29
        failing since 61 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5ced77eca0c74038ace1c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5ced77eca0c74038ace21
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-17T23:29:01.797361  <8>[   10.042691] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11104337_1.4.2.3.1>

    2023-07-17T23:29:01.800547  + set +x

    2023-07-17T23:29:01.901753  /#

    2023-07-17T23:29:02.002647   # #export SHELL=3D/bin/sh

    2023-07-17T23:29:02.002819  =


    2023-07-17T23:29:02.103341  / # export SHELL=3D/bin/sh. /lava-11104337/=
environment

    2023-07-17T23:29:02.103563  =


    2023-07-17T23:29:02.204096  / # . /lava-11104337/environment/lava-11104=
337/bin/lava-test-runner /lava-11104337/1

    2023-07-17T23:29:02.204358  =


    2023-07-17T23:29:02.209541  / # /lava-11104337/bin/lava-test-runner /la=
va-11104337/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5db6b7dce1deb968ace1e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5db6b7dce1deb968ace21
        failing since 157 days (last pass: next-20230209, first fail: next-=
20230210)

    2023-07-18T00:22:45.917620  + set +x[   16.627423] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1237024_1.5.2.4.1>
    2023-07-18T00:22:45.917914  =

    2023-07-18T00:22:46.027689  / # #
    2023-07-18T00:22:46.129086  export SHELL=3D/bin/sh
    2023-07-18T00:22:46.129487  #
    2023-07-18T00:22:46.230464  / # export SHELL=3D/bin/sh. /lava-1237024/e=
nvironment
    2023-07-18T00:22:46.230868  =

    2023-07-18T00:22:46.331897  / # . /lava-1237024/environment/lava-123702=
4/bin/lava-test-runner /lava-1237024/1
    2023-07-18T00:22:46.332742  =

    2023-07-18T00:22:46.337108  / # /lava-1237024/bin/lava-test-runner /lav=
a-1237024/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d13feb16e8f4548ace50

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d13feb16e8f4548ace53
        failing since 3 days (last pass: next-20220831, first fail: next-20=
230629)

    2023-07-17T23:39:21.584198  [   12.399666] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1237015_1.5.2.4.1>
    2023-07-17T23:39:21.691391  =

    2023-07-17T23:39:21.792586  / # #export SHELL=3D/bin/sh
    2023-07-17T23:39:21.793016  =

    2023-07-17T23:39:21.893933  / # export SHELL=3D/bin/sh. /lava-1237015/e=
nvironment
    2023-07-17T23:39:21.894327  =

    2023-07-17T23:39:21.995278  / # . /lava-1237015/environment/lava-123701=
5/bin/lava-test-runner /lava-1237015/1
    2023-07-17T23:39:21.996284  =

    2023-07-17T23:39:22.000100  / # /lava-1237015/bin/lava-test-runner /lav=
a-1237015/1
    2023-07-17T23:39:22.022455  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls2088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d43873b0b2130c8ace53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls2088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d43873b0b2130c8ace56
        failing since 3 days (last pass: next-20220831, first fail: next-20=
230629)

    2023-07-17T23:52:04.111300  + [   12.368051] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1237021_1.5.2.4.1>
    2023-07-17T23:52:04.111549  set +x
    2023-07-17T23:52:04.216909  =

    2023-07-17T23:52:04.318113  / # #export SHELL=3D/bin/sh
    2023-07-17T23:52:04.318606  =

    2023-07-17T23:52:04.419595  / # export SHELL=3D/bin/sh. /lava-1237021/e=
nvironment
    2023-07-17T23:52:04.420009  =

    2023-07-17T23:52:04.520977  / # . /lava-1237021/environment/lava-123702=
1/bin/lava-test-runner /lava-1237021/1
    2023-07-17T23:52:04.521664  =

    2023-07-17T23:52:04.525341  / # /lava-1237021/bin/lava-test-runner /lav=
a-1237021/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d1651009f94a598ace79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d1651009f94a598ac=
e7a
        failing since 61 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d14b20c59a50178ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d14b20c59a50178ac=
e1e
        failing since 61 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cebc1eb56ec0c88aceae

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cebc1eb56ec0c88aceb3
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-17T23:29:12.876139  + set +x

    2023-07-17T23:29:12.882495  <8>[   10.398907] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11104300_1.4.2.3.1>

    2023-07-17T23:29:12.987053  / # #

    2023-07-17T23:29:13.087598  export SHELL=3D/bin/sh

    2023-07-17T23:29:13.087781  #

    2023-07-17T23:29:13.188328  / # export SHELL=3D/bin/sh. /lava-11104300/=
environment

    2023-07-17T23:29:13.188508  =


    2023-07-17T23:29:13.289015  / # . /lava-11104300/environment/lava-11104=
300/bin/lava-test-runner /lava-11104300/1

    2023-07-17T23:29:13.289283  =


    2023-07-17T23:29:13.293825  / # /lava-11104300/bin/lava-test-runner /la=
va-11104300/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cea71eb56ec0c88ace62

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cea71eb56ec0c88ace67
        failing since 111 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-17T23:29:08.617537  <8>[   10.795106] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11104313_1.4.2.3.1>

    2023-07-17T23:29:08.620991  + set +x

    2023-07-17T23:29:08.722468  /#

    2023-07-17T23:29:08.823369   # #export SHELL=3D/bin/sh

    2023-07-17T23:29:08.823594  =


    2023-07-17T23:29:08.924127  / # export SHELL=3D/bin/sh. /lava-11104313/=
environment

    2023-07-17T23:29:08.924322  =


    2023-07-17T23:29:09.024869  / # . /lava-11104313/environment/lava-11104=
313/bin/lava-test-runner /lava-11104313/1

    2023-07-17T23:29:09.025162  =


    2023-07-17T23:29:09.030348  / # /lava-11104313/bin/lava-test-runner /la=
va-11104313/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d17a20c59a50178ace69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d17a20c59a50178ac=
e6a
        failing since 61 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cf11d5e00cd0a88ace34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-pengutronix/baseline-im=
x8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5cf11d5e00cd0a88ac=
e35
        new failure (last pass: next-20230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cf0b157e784f8b8ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5cf0b157e784f8b8ac=
e22
        new failure (last pass: next-20230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d0d7bee47171168ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d0d7bee47171168ac=
e2c
        new failure (last pass: next-20230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3d0a574ba51d38ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d3d0a574ba51d38ac=
e1d
        failing since 3 days (last pass: next-20230712, first fail: next-20=
230714) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5ceededf257baa08ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5ceededf257baa08ac=
e1d
        failing since 89 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cee0ff261931c38ace1d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cee0ff261931c38ace22
        failing since 24 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-17T23:29:11.756672  <8>[   11.586682] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11104329_1.4.2.3.1>

    2023-07-17T23:29:11.864690  / # #

    2023-07-17T23:29:11.966925  export SHELL=3D/bin/sh

    2023-07-17T23:29:11.967772  #

    2023-07-17T23:29:12.069107  / # export SHELL=3D/bin/sh. /lava-11104329/=
environment

    2023-07-17T23:29:12.069843  =


    2023-07-17T23:29:12.171214  / # . /lava-11104329/environment/lava-11104=
329/bin/lava-test-runner /lava-11104329/1

    2023-07-17T23:29:12.172695  =


    2023-07-17T23:29:12.177696  / # /lava-11104329/bin/lava-test-runner /la=
va-11104329/1

    2023-07-17T23:29:12.183712  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d14a7541d2fc498ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d14a7541d2fc498ac=
e1d
        failing since 61 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d133eb16e8f4548ace42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d133eb16e8f4548ac=
e43
        failing since 27 days (last pass: next-20230619, first fail: next-2=
0230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5db952cefd1bb178ace2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5db952cefd1bb178ac=
e2d
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc954d9035b2798ace23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc954d9035b2798ac=
e24
        failing since 173 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc51a6c511bb0b8acef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc51a6c511bb0b8ac=
ef4
        failing since 173 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d270062e32678d8ace1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64b5d270062e326=
78d8ace25
        new failure (last pass: next-20230712)
        4 lines

    2023-07-17T23:44:37.184476  kern  :alert : addr:0000ffffa1dfe000 vm_<8>=
[   16.553043] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D4>
    2023-07-17T23:44:37.184804  flags:00000075 anon_vma:0000000000000000 ma=
pping:ffff00000149e870 index:1   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbe8394148e8ae8ace21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbe8394148e8ae8ac=
e22
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc62a6c511bb0b8acefd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc62a6c511bb0b8ac=
efe
        failing since 161 days (last pass: next-20230203, first fail: next-=
20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d057b2dcb436f88ace2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d057b2dcb436f88ac=
e2f
        new failure (last pass: next-20230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc636e5a1cec108ace24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc636e5a1cec108ac=
e25
        failing since 160 days (last pass: next-20230203, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbe5124e0030ca8ace2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbe5124e0030ca8ac=
e2c
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc20c5cc4be26d8ace50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc20c5cc4be26d8ac=
e51
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dcd9b46e86720f8ace27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dcd9b46e86720f8ac=
e28
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbe6c5cc4be26d8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbe6c5cc4be26d8ac=
e1d
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b608ffa62cfd89668acec2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b608ffa62cfd89668ac=
ec3
        new failure (last pass: next-20230710) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d47fae8bde7fd28ace79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d47fae8bde7fd28ac=
e7a
        failing since 3 days (last pass: next-20230712, first fail: next-20=
230714) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d50323624e982e8ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d50323624e982e8ac=
e29
        new failure (last pass: next-20230714) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d4c410c6a74d3f8acf53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d4c410c6a74d3f8acf56
        new failure (last pass: next-20230714)

    2023-07-17T23:54:18.173122  + set +x
    2023-07-17T23:54:18.176494  <8>[   28.182893] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 987026_1.5.2.4.1>
    2023-07-17T23:54:18.284645  / # #
    2023-07-17T23:54:19.748740  export SHELL=3D/bin/sh
    2023-07-17T23:54:19.769680  #
    2023-07-17T23:54:19.770148  / # export SHELL=3D/bin/sh
    2023-07-17T23:54:21.657461  / # . /lava-987026/environment
    2023-07-17T23:54:25.118093  /lava-987026/bin/lava-test-runner /lava-987=
026/1
    2023-07-17T23:54:25.139668  . /lava-987026/environment
    2023-07-17T23:54:25.140099  / # /lava-987026/bin/lava-test-runner /lava=
-987026/1 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b609675bbfecb5808ace2d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b609675bbfecb5808ace30
        new failure (last pass: next-20230710)

    2023-07-18T03:39:02.680311  / # #
    2023-07-18T03:39:04.144537  export SHELL=3D/bin/sh
    2023-07-18T03:39:04.165109  #
    2023-07-18T03:39:04.165315  / # export SHELL=3D/bin/sh
    2023-07-18T03:39:06.051004  / # . /lava-987116/environment
    2023-07-18T03:39:09.512344  /lava-987116/bin/lava-test-runner /lava-987=
116/1
    2023-07-18T03:39:09.533210  . /lava-987116/environment
    2023-07-18T03:39:09.533321  / # /lava-987116/bin/lava-test-runner /lava=
-987116/1
    2023-07-18T03:39:09.619021  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-18T03:39:09.619237  + cd /lava-987116/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cf81b186df38578ace68

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cf81b186df38578ace6b
        new failure (last pass: next-20230713)

    2023-07-17T23:32:02.052339  / # #
    2023-07-17T23:32:03.511062  export SHELL=3D/bin/sh
    2023-07-17T23:32:03.531489  #
    2023-07-17T23:32:03.531649  / # export SHELL=3D/bin/sh
    2023-07-17T23:32:05.414668  / # . /lava-987005/environment
    2023-07-17T23:32:08.873375  /lava-987005/bin/lava-test-runner /lava-987=
005/1
    2023-07-17T23:32:08.894356  . /lava-987005/environment
    2023-07-17T23:32:08.894517  / # /lava-987005/bin/lava-test-runner /lava=
-987005/1
    2023-07-17T23:32:08.975994  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-17T23:32:08.976674  + cd /lava-987005/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d18a9a136cfae18ace46

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d18a9a136cfae18ace49
        new failure (last pass: next-20230713)

    2023-07-17T23:40:46.061660  / # #
    2023-07-17T23:40:47.523848  export SHELL=3D/bin/sh
    2023-07-17T23:40:47.544427  #
    2023-07-17T23:40:47.544637  / # export SHELL=3D/bin/sh
    2023-07-17T23:40:49.425729  / # . /lava-987017/environment
    2023-07-17T23:40:52.875461  /lava-987017/bin/lava-test-runner /lava-987=
017/1
    2023-07-17T23:40:52.896108  . /lava-987017/environment
    2023-07-17T23:40:52.896254  / # /lava-987017/bin/lava-test-runner /lava=
-987017/1
    2023-07-17T23:40:52.939454  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-17T23:40:52.976374  + cd /lava-987017/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d4460d350ccac98ace21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d4460d350ccac98ace24
        new failure (last pass: next-20230714)

    2023-07-17T23:52:24.661143  / # #
    2023-07-17T23:52:26.120270  export SHELL=3D/bin/sh
    2023-07-17T23:52:26.140706  #
    2023-07-17T23:52:26.140867  / # export SHELL=3D/bin/sh
    2023-07-17T23:52:28.022449  / # . /lava-987024/environment
    2023-07-17T23:52:31.475723  /lava-987024/bin/lava-test-runner /lava-987=
024/1
    2023-07-17T23:52:31.496385  . /lava-987024/environment
    2023-07-17T23:52:31.496495  / # /lava-987024/bin/lava-test-runner /lava=
-987024/1
    2023-07-17T23:52:31.578689  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-17T23:52:31.578878  + cd /lava-987024/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d50eb9441128ac8ace31

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d50eb9441128ac8ace34
        new failure (last pass: next-20230714)

    2023-07-17T23:55:33.815400  / # #
    2023-07-17T23:55:35.278462  export SHELL=3D/bin/sh
    2023-07-17T23:55:35.299011  #
    2023-07-17T23:55:35.299224  / # export SHELL=3D/bin/sh
    2023-07-17T23:55:37.184236  / # . /lava-987027/environment
    2023-07-17T23:55:40.641888  /lava-987027/bin/lava-test-runner /lava-987=
027/1
    2023-07-17T23:55:40.662702  . /lava-987027/environment
    2023-07-17T23:55:40.662816  / # /lava-987027/bin/lava-test-runner /lava=
-987027/1
    2023-07-17T23:55:40.743746  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-17T23:55:40.743967  + cd /lava-987027/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64b5cf072d294044e98ace29

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
64b5cf072d294044e98ace2d
        failing since 145 days (last pass: next-20230214, first fail: next-=
20230222)

    2023-07-17T23:31:38.031297  /lava-11104349/1/../bin/lava-test-case

    2023-07-17T23:31:38.031809  <8>[   22.361006] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-07-17T23:31:38.032096  /lava-11104349/1/../bin/lava-test-case

    2023-07-17T23:31:38.032344  <8>[   22.376442] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-07-17T23:31:38.032582  + set +x

    2023-07-17T23:31:38.032823  <8>[   22.389799] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 11104349_1.5.2.4.5>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cf072d294044e98ace2e
        new failure (last pass: next-20230713)

    2023-07-17T23:31:35.589762  / # #

    2023-07-17T23:31:35.691878  export SHELL=3D/bin/sh

    2023-07-17T23:31:35.692612  #

    2023-07-17T23:31:35.794128  / # export SHELL=3D/bin/sh. /lava-11104349/=
environment

    2023-07-17T23:31:35.794870  =


    2023-07-17T23:31:35.896318  / # . /lava-11104349/environment/lava-11104=
349/bin/lava-test-runner /lava-11104349/1

    2023-07-17T23:31:35.897597  =


    2023-07-17T23:31:35.913573  / # /lava-11104349/bin/lava-test-runner /la=
va-11104349/1

    2023-07-17T23:31:35.966054  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:31:35.966609  + cd /lav<8>[   20.304556] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11104349_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64b5d0d451be75eb148ace75

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
64b5d0d451be75eb148ace79
        failing since 152 days (last pass: next-20230214, first fail: next-=
20230215)

    2023-07-17T23:39:25.497371  /lava-11104369/1/../bin/lava-test-case

    2023-07-17T23:39:25.545425  <8>[   21.507533] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-07-17T23:39:25.545945  /lava-11104369/1/../bin/lava-test-case

    2023-07-17T23:39:25.546235  <8>[   21.523162] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-07-17T23:39:25.546478  + set +x

    2023-07-17T23:39:25.546712  <8>[   21.536615] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 11104369_1.5.2.4.5>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d0d451be75eb148ace7a
        new failure (last pass: next-20230713)

    2023-07-17T23:39:23.105844  / # #

    2023-07-17T23:39:23.207944  export SHELL=3D/bin/sh

    2023-07-17T23:39:23.208669  #

    2023-07-17T23:39:23.310119  / # export SHELL=3D/bin/sh. /lava-11104369/=
environment

    2023-07-17T23:39:23.310836  =


    2023-07-17T23:39:23.412271  / # . /lava-11104369/environment/lava-11104=
369/bin/lava-test-runner /lava-11104369/1

    2023-07-17T23:39:23.413388  =


    2023-07-17T23:39:23.429686  / # /lava-11104369/bin/lava-test-runner /la=
va-11104369/1

    2023-07-17T23:39:23.479715  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:39:23.480224  + cd /lava-111043<8>[   19.451271] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11104369_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3dffa49852e9a8ace50

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a7796=
0-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a7796=
0-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d3dffa49852e9a8ace55
        new failure (last pass: next-20230714)

    2023-07-17T23:52:16.751374  / # #

    2023-07-17T23:52:16.853603  export SHELL=3D/bin/sh

    2023-07-17T23:52:16.854331  #

    2023-07-17T23:52:16.955798  / # export SHELL=3D/bin/sh. /lava-11104469/=
environment

    2023-07-17T23:52:16.956507  =


    2023-07-17T23:52:17.058051  / # . /lava-11104469/environment/lava-11104=
469/bin/lava-test-runner /lava-11104469/1

    2023-07-17T23:52:17.059175  =


    2023-07-17T23:52:17.062856  / # /lava-11104469/bin/lava-test-runner /la=
va-11104469/1

    2023-07-17T23:52:17.126422  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:52:17.126930  + cd /lava-111044<8>[   20.344028] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11104469_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cf2fb186df38578ace21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
79m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cf2fb186df38578ace26
        new failure (last pass: next-20230713)

    2023-07-17T23:30:42.391323  / # #

    2023-07-17T23:30:43.470921  export SHELL=3D/bin/sh

    2023-07-17T23:30:43.472854  #

    2023-07-17T23:30:44.963128  / # export SHELL=3D/bin/sh. /lava-11104352/=
environment

    2023-07-17T23:30:44.964993  =


    2023-07-17T23:30:47.685585  / # . /lava-11104352/environment/lava-11104=
352/bin/lava-test-runner /lava-11104352/1

    2023-07-17T23:30:47.687679  =


    2023-07-17T23:30:47.698023  / # /lava-11104352/bin/lava-test-runner /la=
va-11104352/1

    2023-07-17T23:30:47.757116  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:30:47.757628  + cd /lav<8>[   28.521951] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11104352_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d0feeb16e8f4548ace25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d0feeb16e8f4548ace2a
        new failure (last pass: next-20230713)

    2023-07-17T23:38:07.511175  / # #

    2023-07-17T23:38:08.589343  export SHELL=3D/bin/sh

    2023-07-17T23:38:08.590668  #

    2023-07-17T23:38:10.077936  / # export SHELL=3D/bin/sh. /lava-11104364/=
environment

    2023-07-17T23:38:10.079756  =


    2023-07-17T23:38:12.794373  / # . /lava-11104364/environment/lava-11104=
364/bin/lava-test-runner /lava-11104364/1

    2023-07-17T23:38:12.795737  =


    2023-07-17T23:38:12.805789  / # /lava-11104364/bin/lava-test-runner /la=
va-11104364/1

    2023-07-17T23:38:12.865370  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:38:12.865457  + cd /lava-11104364<8>[   28.546147] <LAVA_=
SIGNAL_STARTRUN 1_bootrr 11104364_1.5.2.4.5>
 =

    ... (39 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a779m1-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3dfa574ba51d38ace28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a779m=
1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d3dfa574ba51d38ace2d
        new failure (last pass: next-20230714)

    2023-07-17T23:50:42.435728  / # #

    2023-07-17T23:50:43.511125  export SHELL=3D/bin/sh

    2023-07-17T23:50:43.513018  #

    2023-07-17T23:50:45.000265  / # export SHELL=3D/bin/sh. /lava-11104463/=
environment

    2023-07-17T23:50:45.001903  =


    2023-07-17T23:50:47.719259  / # . /lava-11104463/environment/lava-11104=
463/bin/lava-test-runner /lava-11104463/1

    2023-07-17T23:50:47.720649  =


    2023-07-17T23:50:47.732897  / # /lava-11104463/bin/lava-test-runner /la=
va-11104463/1

    2023-07-17T23:50:47.791559  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:50:47.791716  + cd /lava-111044<8>[   28.517569] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11104463_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/64b605b6651c6e47778ace24

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b605b6651c6e47778ace29
        failing since 38 days (last pass: next-20221012, first fail: next-2=
0230609)

    2023-07-18T03:23:14.326081  [    5.209605] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3722153_1.5.2.4.1>
    2023-07-18T03:23:14.431352  =

    2023-07-18T03:23:14.533659  / # #export SHELL=3D/bin/sh
    2023-07-18T03:23:14.534061  =

    2023-07-18T03:23:14.635499  / # export SHELL=3D/bin/sh. /lava-3722153/e=
nvironment
    2023-07-18T03:23:14.636059  =

    2023-07-18T03:23:14.737622  / # . /lava-3722153/environment/lava-372215=
3/bin/lava-test-runner /lava-3722153/1
    2023-07-18T03:23:14.738310  =

    2023-07-18T03:23:14.741858  / # /lava-3722153/bin/lava-test-runner /lav=
a-3722153/1
    2023-07-18T03:23:14.801224  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3d9fa49852e9a8ace45

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d3d9fa49852e9a8ace4a
        failing since 166 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-07-17T23:50:35.456693  [   29.265661] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3721759_1.5.2.4.1>
    2023-07-17T23:50:35.561346  =

    2023-07-17T23:50:35.662953  / # #export SHELL=3D/bin/sh
    2023-07-17T23:50:35.663749  =

    2023-07-17T23:50:35.765645  / # export SHELL=3D/bin/sh. /lava-3721759/e=
nvironment
    2023-07-17T23:50:35.766043  =

    2023-07-17T23:50:35.867423  / # . /lava-3721759/environment/lava-372175=
9/bin/lava-test-runner /lava-3721759/1
    2023-07-17T23:50:35.868100  =

    2023-07-17T23:50:35.871484  / # /lava-3721759/bin/lava-test-runner /lav=
a-3721759/1
    2023-07-17T23:50:35.908159  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b6095855e4374db38ad1b9

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-efuse-probed: https://kernelci.org/test/case/i=
d/64b6095855e4374db38ad1df
        new failure (last pass: next-20230710)

    2023-07-18T03:38:58.258738  /lava-11105603/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d4bb659496343f8ace1d

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-efuse-probed: https://kernelci.org/test/case/i=
d/64b5d4bb659496343f8ace43
        failing since 3 days (last pass: next-20230712, first fail: next-20=
230714)

    2023-07-17T23:54:32.494162  <8>[   31.822060] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-driver-present RESULT=3Dpass>

    2023-07-17T23:54:33.526160  /lava-11104564/1/../bin/lava-test-case

    2023-07-17T23:54:33.540774  <8>[   32.869606] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbd9080ff481c48ace28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbd9080ff481c48ac=
e29
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d044516c9ba8018ace26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d044516c9ba8018ac=
e27
        failing since 90 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d007e908d2f7408ace85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d007e908d2f7408ac=
e86
        failing since 90 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d22446b47a7e8b8ace3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d22446b47a7e8b8ac=
e3b
        failing since 31 days (last pass: next-20230608, first fail: next-2=
0230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3b4fa49852e9a8ace20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d3b4fa49852e9a8ac=
e21
        failing since 25 days (last pass: next-20230621, first fail: next-2=
0230622) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d530e38d4e334b8ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d530e38d4e334b8ac=
e1e
        failing since 33 days (last pass: next-20230609, first fail: next-2=
0230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d1d445b3f378908ace2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d1d445b3f378908ac=
e2b
        failing since 31 days (last pass: next-20230608, first fail: next-2=
0230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d490ae8bde7fd28aceb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d490ae8bde7fd28ac=
eb8
        failing since 25 days (last pass: next-20230621, first fail: next-2=
0230622) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d5f88c657f54a58ace56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d5f88c657f54a58ac=
e57
        failing since 33 days (last pass: next-20230609, first fail: next-2=
0230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbd5080ff481c48ace22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbd5080ff481c48ac=
e23
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d017516c9ba8018ace1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d017516c9ba8018ac=
e1e
        failing since 5 days (last pass: next-20230608, first fail: next-20=
230712) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc11c5cc4be26d8ace30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc11c5cc4be26d8ac=
e31
        failing since 5 days (last pass: next-20230608, first fail: next-20=
230712) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d1e293c59eb7bc8ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d1e293c59eb7bc8ac=
e1d
        new failure (last pass: next-20230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3eaa574ba51d38ace40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5d3eaa574ba51d38ac=
e41
        new failure (last pass: next-20230714) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbe7394148e8ae8ace1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbe7394148e8ae8ac=
e1f
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dc13394148e8ae8ace39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dc13394148e8ae8ac=
e3a
        new failure (last pass: next-20230714) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dcee8bbb986fff8ace33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dcee8bbb986fff8ac=
e34
        new failure (last pass: next-20230713) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dd7af2dbd85dc38ace2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dd7af2dbd85dc38ac=
e30
        failing since 160 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5cf06ef2a322b338aceb2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230717112021+83f3=
92085466-1~exp1~20230717112133.775))
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5cf06ef2a322b338aceb7
        new failure (last pass: next-20230713)

    2023-07-17T23:31:45.746077  / # #

    2023-07-17T23:31:45.847034  export SHELL=3D/bin/sh

    2023-07-17T23:31:45.847758  #

    2023-07-17T23:31:45.949180  / # export SHELL=3D/bin/sh. /lava-11104344/=
environment

    2023-07-17T23:31:45.949426  =


    2023-07-17T23:31:46.050073  / # . /lava-11104344/environment/lava-11104=
344/bin/lava-test-runner /lava-11104344/1

    2023-07-17T23:31:46.050305  =


    2023-07-17T23:31:46.059584  / # /lava-11104344/bin/lava-test-runner /la=
va-11104344/1

    2023-07-17T23:31:46.141496  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:31:46.141591  + cd /lava-11104344/1/tests/1_boot<8>[   17=
.233622] <LAVA_SIGNAL_STARTRUN 1_bootrr 11104344_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d0f403a8cca42a8ace29

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d0f403a8cca42a8ace2e
        new failure (last pass: next-20230713)

    2023-07-17T23:38:10.917888  / # #
    2023-07-17T23:38:11.019747  export SHELL=3D/bin/sh
    2023-07-17T23:38:11.020130  #
    2023-07-17T23:38:11.121447  / # export SHELL=3D/bin/sh. /lava-3721701/e=
nvironment
    2023-07-17T23:38:11.121797  =

    2023-07-17T23:38:11.223202  / # . /lava-3721701/environment/lava-372170=
1/bin/lava-test-runner /lava-3721701/1
    2023-07-17T23:38:11.223948  =

    2023-07-17T23:38:11.229204  / # /lava-3721701/bin/lava-test-runner /lav=
a-3721701/1
    2023-07-17T23:38:11.307147  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-17T23:38:11.307411  + cd /lava-3721701<8>[   19.360187] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 3721701_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3ee994e50f0818ace28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d3ee994e50f0818ace2d
        new failure (last pass: next-20230714)

    2023-07-17T23:50:46.414182  / # #
    2023-07-17T23:50:46.516039  export SHELL=3D/bin/sh
    2023-07-17T23:50:46.516456  #
    2023-07-17T23:50:46.617856  / # export SHELL=3D/bin/sh. /lava-3721780/e=
nvironment
    2023-07-17T23:50:46.618269  =

    2023-07-17T23:50:46.719451  / # . /lava-3721780/environment/lava-372178=
0/bin/lava-test-runner /lava-3721780/1
    2023-07-17T23:50:46.720048  =

    2023-07-17T23:50:46.725578  / # /lava-3721780/bin/lava-test-runner /lav=
a-3721780/1
    2023-07-17T23:50:46.803405  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-17T23:50:46.803662  + cd /lava-3721780<8>[   19.312819] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 3721780_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d0e7fb2c448e7a8ace4e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d0e7fb2c448e7a8ace53
        new failure (last pass: next-20230713)

    2023-07-17T23:39:36.760190  / # #

    2023-07-17T23:39:36.862333  export SHELL=3D/bin/sh

    2023-07-17T23:39:36.863044  #

    2023-07-17T23:39:36.964448  / # export SHELL=3D/bin/sh. /lava-11104361/=
environment

    2023-07-17T23:39:36.965200  =


    2023-07-17T23:39:37.066639  / # . /lava-11104361/environment/lava-11104=
361/bin/lava-test-runner /lava-11104361/1

    2023-07-17T23:39:37.067722  =


    2023-07-17T23:39:37.084636  / # /lava-11104361/bin/lava-test-runner /la=
va-11104361/1

    2023-07-17T23:39:37.152637  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:39:37.153167  + cd /lava-11104361/1/tests/1_boot<8>[   17=
.545165] <LAVA_SIGNAL_STARTRUN 1_bootrr 11104361_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5d3e0a574ba51d38ace35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64b5d3e0a574ba51d38ace3a
        new failure (last pass: next-20230714)

    2023-07-17T23:52:29.067014  / # #

    2023-07-17T23:52:29.169093  export SHELL=3D/bin/sh

    2023-07-17T23:52:29.169797  #

    2023-07-17T23:52:29.271286  / # export SHELL=3D/bin/sh. /lava-11104474/=
environment

    2023-07-17T23:52:29.271987  =


    2023-07-17T23:52:29.373481  / # . /lava-11104474/environment/lava-11104=
474/bin/lava-test-runner /lava-11104474/1

    2023-07-17T23:52:29.374660  =


    2023-07-17T23:52:29.391235  / # /lava-11104474/bin/lava-test-runner /la=
va-11104474/1

    2023-07-17T23:52:29.458531  + export 'TESTRUN_ID=3D1_bootrr'

    2023-07-17T23:52:29.458695  + cd /lava-11104474/1/tests/1_boot<8>[   17=
.357556] <LAVA_SIGNAL_STARTRUN 1_bootrr 11104474_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64b5dbd52007aa7be48ace45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230717/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64b5dbd52007aa7be48ac=
e46
        failing since 39 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =20
