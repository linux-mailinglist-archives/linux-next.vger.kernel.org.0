Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F1B6FB522
	for <lists+linux-next@lfdr.de>; Mon,  8 May 2023 18:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbjEHQbO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 May 2023 12:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbjEHQbN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 May 2023 12:31:13 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FA565B5
        for <linux-next@vger.kernel.org>; Mon,  8 May 2023 09:31:08 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-643aad3bc41so3501663b3a.0
        for <linux-next@vger.kernel.org>; Mon, 08 May 2023 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683563467; x=1686155467;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l0ud/asZEhO/xBTIjgjs2EHRNmIRfPVskSlT/OYHRNI=;
        b=ITmqjeBcF0u0+WCfRTLLbtTPLQdaK86DhZg7awC5txRLR7/tqW38wohNHZNOE0/Shn
         q2+6IuW9L5C9dFCcNFtd9QTb7DtgqotJIgU/ADdq4PZZJ0ncyTqs/nlZdfsaHeEFlEze
         u7PaU17qi5ePvj+1XohcfvBH6bFEXX34xfNOWTCY8+pI3C10rncXmaen3g40NgJl2i0Q
         aL7LsZ6dKu1StKQXp1faB0LH0MjHjrF77vue+UeW9uVEi7lMW0YcWBKUjut1vHAiFgYY
         sz+Kldrpj51DTr81g7wbjF2rK+drt1e/59l2XqynQQwhVyCkbuXKH7Rgn1/GSjsm9RBI
         J7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683563467; x=1686155467;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0ud/asZEhO/xBTIjgjs2EHRNmIRfPVskSlT/OYHRNI=;
        b=H1zfK9OOgZpobdRjNWpSd7e5PHEGNcNfcBYr62NBaueiEMGwDwUqjw/oRxNBJxCL6N
         bI++0TQULH8KgvH0MZgO2ZLV5G7Vl1RbSEFjBTR3kZCZaB4owplKoA/mKW3TtfDspBOE
         K2T1nZyvyTk2YytQmrd0icIUmObAu+A4AFQorghGpo/wO2DRIR7emvYf9papT2z0z9mm
         c8C/KoSjQXN610C0t/b/zmwXrQ+xvjEQ7aebUROziDg6efiAx63wSyjJli8jnoAOBCFz
         VAOVE8jVflb+z/FWZ7TnJT3OiJIYGZRyCHb2nHZbmERJQBnFGvPtDm9iWJOqf3YK93Qj
         Sjlg==
X-Gm-Message-State: AC+VfDz0t00+Y2apKBZdVQ15G0Hgk3wZzzIT09zZ5WKrLy9hkep/7qZp
        WyIywHaD/uPb+eKs/aHqRuWx3W5itadGP8b3xnnm3w==
X-Google-Smtp-Source: ACHHUZ5R0SFM0z9hVZlbDbhwFM0FXx7bKtR/mNICcohlGUxM2sAhzgoEd9hJzyUUo1JU4VDZxBBJiA==
X-Received: by 2002:a05:6a00:21c9:b0:645:1081:98ec with SMTP id t9-20020a056a0021c900b00645108198ecmr7981844pfj.13.1683563465360;
        Mon, 08 May 2023 09:31:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79249000000b0063db25e140bsm200227pfp.32.2023.05.08.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 09:31:04 -0700 (PDT)
Message-ID: <645923c8.a70a0220.717e5.0ba4@mx.google.com>
Date:   Mon, 08 May 2023 09:31:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230508
X-Kernelci-Report-Type: test
Subject: next/master baseline: 534 runs, 62 regressions (next-20230508)
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

next/master baseline: 534 runs, 62 regressions (next-20230508)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230508/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230508
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      52025ebbb518a2d876b8aba191b348ffb1cf368b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f05a34ec9fd4122e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f05a34ec9fd4122e860a
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-08T12:51:17.878985  <8>[   19.945630] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238746_1.4.2.3.1>

    2023-05-08T12:51:17.881987  + set +x

    2023-05-08T12:51:17.983381  =


    2023-05-08T12:51:18.083914  / # #export SHELL=3D/bin/sh

    2023-05-08T12:51:18.084095  =


    2023-05-08T12:51:18.184627  / # export SHELL=3D/bin/sh. /lava-10238746/=
environment

    2023-05-08T12:51:18.184822  =


    2023-05-08T12:51:18.285315  / # . /lava-10238746/environment/lava-10238=
746/bin/lava-test-runner /lava-10238746/1

    2023-05-08T12:51:18.285611  =


    2023-05-08T12:51:18.291027  / # /lava-10238746/bin/lava-test-runner /la=
va-10238746/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f0c052c2c920e72e8650

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f0c052c2c920e72e8655
        failing since 40 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-08T12:53:06.217748  + set +x

    2023-05-08T12:53:06.224420  <8>[   11.000553] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238808_1.4.2.3.1>

    2023-05-08T12:53:06.332833  / # #

    2023-05-08T12:53:06.435277  export SHELL=3D/bin/sh

    2023-05-08T12:53:06.436212  #

    2023-05-08T12:53:06.537908  / # export SHELL=3D/bin/sh. /lava-10238808/=
environment

    2023-05-08T12:53:06.538662  =


    2023-05-08T12:53:06.640226  / # . /lava-10238808/environment/lava-10238=
808/bin/lava-test-runner /lava-10238808/1

    2023-05-08T12:53:06.641515  =


    2023-05-08T12:53:06.647647  / # /lava-10238808/bin/lava-test-runner /la=
va-10238808/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f523f550b133142e87f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f523f550b133142e87f6
        failing since 38 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-08T13:11:49.597889  + set +x

    2023-05-08T13:11:49.604424  <8>[   13.143806] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10239060_1.4.2.3.1>

    2023-05-08T13:11:49.708770  / # #

    2023-05-08T13:11:49.809454  export SHELL=3D/bin/sh

    2023-05-08T13:11:49.809653  #

    2023-05-08T13:11:49.910142  / # export SHELL=3D/bin/sh. /lava-10239060/=
environment

    2023-05-08T13:11:49.910321  =


    2023-05-08T13:11:50.010823  / # . /lava-10239060/environment/lava-10239=
060/bin/lava-test-runner /lava-10239060/1

    2023-05-08T13:11:50.011169  =


    2023-05-08T13:11:50.016548  / # /lava-10239060/bin/lava-test-runner /la=
va-10239060/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f03a59d78b71a52e85fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f03a59d78b71a52e8602
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-08T12:51:01.718059  <8>[   10.411293] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238683_1.4.2.3.1>

    2023-05-08T12:51:01.721490  + set +x

    2023-05-08T12:51:01.823791  =


    2023-05-08T12:51:01.924566  / # #export SHELL=3D/bin/sh

    2023-05-08T12:51:01.924791  =


    2023-05-08T12:51:02.025301  / # export SHELL=3D/bin/sh. /lava-10238683/=
environment

    2023-05-08T12:51:02.025586  =


    2023-05-08T12:51:02.126239  / # . /lava-10238683/environment/lava-10238=
683/bin/lava-test-runner /lava-10238683/1

    2023-05-08T12:51:02.126670  =


    2023-05-08T12:51:02.131100  / # /lava-10238683/bin/lava-test-runner /la=
va-10238683/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f0b9e55b4e43652e8610

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f0b9e55b4e43652e8615
        failing since 40 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-08T12:52:50.669752  <8>[   10.251804] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238782_1.4.2.3.1>

    2023-05-08T12:52:50.672741  + set +x

    2023-05-08T12:52:50.773997  =


    2023-05-08T12:52:50.874581  / # #export SHELL=3D/bin/sh

    2023-05-08T12:52:50.874757  =


    2023-05-08T12:52:50.975366  / # export SHELL=3D/bin/sh. /lava-10238782/=
environment

    2023-05-08T12:52:50.975620  =


    2023-05-08T12:52:51.076380  / # . /lava-10238782/environment/lava-10238=
782/bin/lava-test-runner /lava-10238782/1

    2023-05-08T12:52:51.076708  =


    2023-05-08T12:52:51.081855  / # /lava-10238782/bin/lava-test-runner /la=
va-10238782/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f4d3b8a4d76d322e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f4d3b8a4d76d322e85fb
        failing since 38 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-08T13:10:28.693743  <8>[   12.491822] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10239085_1.4.2.3.1>

    2023-05-08T13:10:28.697051  + set +x

    2023-05-08T13:10:28.802305  #

    2023-05-08T13:10:28.803399  =


    2023-05-08T13:10:28.905067  / # #export SHELL=3D/bin/sh

    2023-05-08T13:10:28.905768  =


    2023-05-08T13:10:29.007255  / # export SHELL=3D/bin/sh. /lava-10239085/=
environment

    2023-05-08T13:10:29.007990  =


    2023-05-08T13:10:29.109523  / # . /lava-10239085/environment/lava-10239=
085/bin/lava-test-runner /lava-10239085/1

    2023-05-08T13:10:29.110655  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f4289dfe7ba4722e861c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f4289dfe7ba4722e861f
        failing since 87 days (last pass: next-20230209, first fail: next-2=
0230210)

    2023-05-08T13:05:38.236027  + set +x
    2023-05-08T13:05:38.237751  [   29.388481] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1215921_1.5.2.4.1>
    2023-05-08T13:05:38.351315  #
    2023-05-08T13:05:38.453392  / # #export SHELL=3D/bin/sh
    2023-05-08T13:05:38.453840  =

    2023-05-08T13:05:38.555222  / # export SHELL=3D/bin/sh. /lava-1215921/e=
nvironment
    2023-05-08T13:05:38.555671  =

    2023-05-08T13:05:38.657063  / # . /lava-1215921/environment/lava-121592=
1/bin/lava-test-runner /lava-1215921/1
    2023-05-08T13:05:38.657780  =

    2023-05-08T13:05:38.660193  / # /lava-1215921/bin/lava-test-runner /lav=
a-1215921/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f048d8530046f02e8602

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f048d8530046f02e8607
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-08T12:51:03.616713  + set +x

    2023-05-08T12:51:03.623063  <8>[   10.284355] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238705_1.4.2.3.1>

    2023-05-08T12:51:03.727862  / # #

    2023-05-08T12:51:03.828451  export SHELL=3D/bin/sh

    2023-05-08T12:51:03.828668  #

    2023-05-08T12:51:03.929163  / # export SHELL=3D/bin/sh. /lava-10238705/=
environment

    2023-05-08T12:51:03.929390  =


    2023-05-08T12:51:04.029895  / # . /lava-10238705/environment/lava-10238=
705/bin/lava-test-runner /lava-10238705/1

    2023-05-08T12:51:04.030236  =


    2023-05-08T12:51:04.034621  / # /lava-10238705/bin/lava-test-runner /la=
va-10238705/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f0c662a87cda342e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f0c662a87cda342e85eb
        failing since 40 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-08T12:53:09.433171  + set +x

    2023-05-08T12:53:09.439928  <8>[   11.069363] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238778_1.4.2.3.1>

    2023-05-08T12:53:09.544363  / # #

    2023-05-08T12:53:09.644951  export SHELL=3D/bin/sh

    2023-05-08T12:53:09.645176  #

    2023-05-08T12:53:09.745742  / # export SHELL=3D/bin/sh. /lava-10238778/=
environment

    2023-05-08T12:53:09.745965  =


    2023-05-08T12:53:09.846538  / # . /lava-10238778/environment/lava-10238=
778/bin/lava-test-runner /lava-10238778/1

    2023-05-08T12:53:09.846960  =


    2023-05-08T12:53:09.851034  / # /lava-10238778/bin/lava-test-runner /la=
va-10238778/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f4c0304fd78a6e2e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f4c0304fd78a6e2e8601
        failing since 38 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-08T13:10:13.269861  + set +x

    2023-05-08T13:10:13.276166  <8>[   14.524775] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10239037_1.4.2.3.1>

    2023-05-08T13:10:13.382563  / # #

    2023-05-08T13:10:13.483177  export SHELL=3D/bin/sh

    2023-05-08T13:10:13.483370  #

    2023-05-08T13:10:13.583883  / # export SHELL=3D/bin/sh. /lava-10239037/=
environment

    2023-05-08T13:10:13.584072  =


    2023-05-08T13:10:13.684627  / # . /lava-10239037/environment/lava-10239=
037/bin/lava-test-runner /lava-10239037/1

    2023-05-08T13:10:13.684896  =


    2023-05-08T13:10:13.689442  / # /lava-10239037/bin/lava-test-runner /la=
va-10239037/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f017f52e1b18ff2e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f017f52e1b18ff2e85f1
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-08T12:50:19.750599  + set +x

    2023-05-08T12:50:19.756797  <8>[   10.646091] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238679_1.4.2.3.1>

    2023-05-08T12:50:19.861456  / # #

    2023-05-08T12:50:19.962174  export SHELL=3D/bin/sh

    2023-05-08T12:50:19.962382  #

    2023-05-08T12:50:20.062892  / # export SHELL=3D/bin/sh. /lava-10238679/=
environment

    2023-05-08T12:50:20.063182  =


    2023-05-08T12:50:20.163727  / # . /lava-10238679/environment/lava-10238=
679/bin/lava-test-runner /lava-10238679/1

    2023-05-08T12:50:20.164076  =


    2023-05-08T12:50:20.169122  / # /lava-10238679/bin/lava-test-runner /la=
va-10238679/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f0984473bf6f582e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f0984473bf6f582e85eb
        failing since 40 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-08T12:52:27.598866  <8>[   10.541009] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10238781_1.4.2.3.1>

    2023-05-08T12:52:27.601992  + set +x

    2023-05-08T12:52:27.703283  #

    2023-05-08T12:52:27.703563  =


    2023-05-08T12:52:27.804072  / # #export SHELL=3D/bin/sh

    2023-05-08T12:52:27.804254  =


    2023-05-08T12:52:27.904743  / # export SHELL=3D/bin/sh. /lava-10238781/=
environment

    2023-05-08T12:52:27.904934  =


    2023-05-08T12:52:28.005466  / # . /lava-10238781/environment/lava-10238=
781/bin/lava-test-runner /lava-10238781/1

    2023-05-08T12:52:28.005757  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f4b3f87b9a5e382e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f4b3f87b9a5e382e85ec
        failing since 38 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-08T13:09:50.511229  + set<8>[   14.778004] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10239059_1.4.2.3.1>

    2023-05-08T13:09:50.511334   +x

    2023-05-08T13:09:50.616040  / # #

    2023-05-08T13:09:50.716609  export SHELL=3D/bin/sh

    2023-05-08T13:09:50.716822  #

    2023-05-08T13:09:50.817340  / # export SHELL=3D/bin/sh. /lava-10239059/=
environment

    2023-05-08T13:09:50.817529  =


    2023-05-08T13:09:50.918033  / # . /lava-10239059/environment/lava-10239=
059/bin/lava-test-runner /lava-10239059/1

    2023-05-08T13:09:50.918315  =


    2023-05-08T13:09:50.923564  / # /lava-10239059/bin/lava-test-runner /la=
va-10239059/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f7002c4a15395e2e8804

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f7002c4a15395e2e8=
805
        failing since 18 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f3fc7e7c3969682e863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f3fc7e7c3969682e8=
63f
        failing since 103 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f504178839c47d2e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f504178839c47d2e8=
616
        failing since 91 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f4139dfe7ba4722e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f4139dfe7ba4722e8=
5f3
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458fc25262028cce32e8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458fc25262028cce32e8=
663
        failing since 91 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f41cb463d333bb2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f41cb463d333bb2e8=
5e8
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f52d27ee55500e2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f52d27ee55500e2e8=
5f2
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f415ccdc05813b2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f415ccdc05813b2e8=
5ec
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f388e0861fc9a62e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f388e0861fc9a62e8=
5e8
        failing since 104 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f3e31582890a722e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f3e31582890a722e8=
618
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f398fb0b4cad782e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f398fb0b4cad782e8=
607
        failing since 89 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f40e241757745f2e8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f40e241757745f2e8=
634
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f390e0861fc9a62e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f390e0861fc9a62e8=
5ed
        failing since 89 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f4b1751e45b2f32e879d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f4b1751e45b2f32e8=
79e
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6459000b534ca17a552e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459000b534ca17a552e8=
5e8
        failing since 89 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6459064c93718fe2272e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6459064c93718fe2272e8=
603
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6458efaf6d4097a2eb2e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458efaf6d4097a2eb2e8=
613
        failing since 9 days (last pass: next-20230427, first fail: next-20=
230428) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f3833d6d60e7ca2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f3833d6d60e7ca2e8=
607
        new failure (last pass: next-20230505) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f21dfaea7968842e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f21dfaea7968842e8=
5ee
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f0c9794236af012e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f0c9794236af012e8=
5f6
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f5552f1fd7d1492e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f5552f1fd7d1492e8=
5f7
        failing since 167 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f42556d83221c42e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f42556d83221c42e8=
5fd
        failing since 167 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f373b3c63b6eaa2e85e6

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f373b3c63b6=
eaa2e863d
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417)
        2 lines

    2023-05-08T13:04:21.980522  fo:

    2023-05-08T13:04:21.984721  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-08T13:04:21.990595  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-08T13:04:21.993727  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-08T13:04:21.997777  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-08T13:04:22.002803  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-08T13:04:22.006000  kern  :alert : Data abort info:

    2023-05-08T13:04:22.010110  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T13:04:22.013526  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-08T13:04:22.026472  kern  :alert : user pgtable: 4k pages<8>[  =
 19.313205] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f373b3c63b6=
eaa2e863e
        failing since 20 days (last pass: next-20230404, first fail: next-2=
0230417)
        12 lines

    2023-05-08T13:04:21.926795  <8>[   19.213846] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-05-08T13:04:21.968202  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-08T13:04:21.979985  kern  :alert : Mem abort in<8>[   19.264829=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f383b3c63b6eaa2e86b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f383b3c63b6eaa2e8=
6b8
        failing since 89 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f7459b34d961892e85ea

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230501072117+6875=
42413531-1~exp1~20230501072238.645))
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f7459b34d96=
1892e85f1
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:20:57.144183  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-08T13:20:57.145440  kern  :emerg : Code: 97ff3af8 f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-05-08T13:20:57.151303  <8>[   24.780583] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-08T13:20:57.151618  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f7459b34d96=
1892e85f2
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:20:57.124463  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T13:20:57.125113  kern  :alert : Mem abort info:
    2023-05-08T13:20:57.125362  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-08T13:20:57.125921  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T13:20:57.126474  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T13:20:57.126731  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T13:20:57.127159  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-08T13:20:57.127886  kern  :alert : Data abort info:
    2023-05-08T13:20:57.128157  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-08T13:20:57.129392  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f410241757745f2e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f410241757745f2e8=
637
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6458f7a9fa162a5c2b2e862d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6458f7a9fa162a5c2b2e8632
        new failure (last pass: next-20230505)

    2023-05-08T13:22:30.653921  <8>[   21.595492] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 428758_1.5.2.4.1>
    2023-05-08T13:22:30.761087  / # #
    2023-05-08T13:22:30.863399  export SHELL=3D/bin/sh
    2023-05-08T13:22:30.864053  #
    2023-05-08T13:22:30.965566  / # export SHELL=3D/bin/sh. /lava-428758/en=
vironment
    2023-05-08T13:22:30.966290  =

    2023-05-08T13:22:31.067900  / # . /lava-428758/environment/lava-428758/=
bin/lava-test-runner /lava-428758/1
    2023-05-08T13:22:31.068981  =

    2023-05-08T13:22:31.074769  / # /lava-428758/bin/lava-test-runner /lava=
-428758/1
    2023-05-08T13:22:31.118953  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f7a9fa162a5=
c2b2e8634
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:22:30.639387  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-05-08T13:22:30.640649  kern  :emerg : Code: 9402b0be f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-08T13:22:30.651713  <8>[   21.593438] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-08T13:22:30.652103  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f7a9fa162a5=
c2b2e8635
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:22:30.617510  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T13:22:30.619236  kern  :alert : Mem abort info:
    2023-05-08T13:22:30.619666  kern  :alert :   ESR =3D 0x0000000096000007
    2023-05-08T13:22:30.621024  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T13:22:30.623453  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T13:22:30.623903  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T13:22:30.624501  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-05-08T13:22:30.626197  kern  :alert : Data abort info:
    2023-05-08T13:22:30.626629  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-05-08T13:22:30.628536  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f80d59fa45b5ea2e8635

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f80d59fa45b=
5ea2e863c
        failing since 27 days (last pass: next-20230404, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:24:12.699925  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-08T13:24:12.701235  kern  :emerg : Code: 97f7e110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-08T13:24:12.710751  <8>[   23.893499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f80d59fa45b=
5ea2e863d
        failing since 27 days (last pass: next-20230404, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:24:12.677987  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T13:24:12.679331  kern  :alert : Mem abort info:
    2023-05-08T13:24:12.679705  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-08T13:24:12.681033  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T13:24:12.682791  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T13:24:12.683149  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T13:24:12.684558  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-08T13:24:12.686307  kern  :alert : Data abort info:
    2023-05-08T13:24:12.686678  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-08T13:24:12.688377  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f87122777069ad2e85e7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f8712277706=
9ad2e85ee
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:25:54.206309  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-08T13:25:54.207664  kern  :emerg : Code: 97fde910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-08T13:25:54.215381  <8>[   21.493233] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f8712277706=
9ad2e85ef
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:25:54.178369  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-08T13:25:54.179077  kern  :alert : Mem abort info:
    2023-05-08T13:25:54.179388  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-08T13:25:54.180101  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-08T13:25:54.180582  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-08T13:25:54.180849  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-08T13:25:54.181456  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-08T13:25:54.182052  kern  :alert : Data abort info:
    2023-05-08T13:25:54.182331  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-08T13:25:54.182977  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f66acee9b5e3f22e85fe

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230501072117+6875=
42413531-1~exp1~20230501072238.645))
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f66acee9b5e=
3f22e8605
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:17:09.384801  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-08T13:17:09.385413  kern  :emerg : Code: 97fccaf8 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-05-08T13:17:09.385805  <8>[   23.752290] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T13:17:09.386165  + set +x

    2023-05-08T13:17:09.386509  <8>[   23.754265] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10239153_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f66acee9b5e=
3f22e8606
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:17:09.338824  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-08T13:17:09.339252  kern  :alert : Mem abort info:

    2023-05-08T13:17:09.339637  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-08T13:17:09.339960  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-08T13:17:09.340273  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-08T13:17:09.340575  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-08T13:17:09.340871  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-08T13:17:09.341227  kern  :alert : Data abort info:

    2023-05-08T13:17:09.341580  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T13:17:09.341874  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f3fd7e7c3969682e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f3fd7e7c3969682e8=
653
        failing since 90 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f6f6b3d60b38a02e85f8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f6f6b3d60b3=
8a02e85ff
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:19:25.031574  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-05-08T13:19:25.031679  kern  :emerg : Code: 97e970be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-08T13:19:25.031796  <8>[   23.713643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T13:19:25.031902  + set +x

    2023-05-08T13:19:25.032011  <8>[   23.715483] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10239165_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f6f6b3d60b3=
8a02e8600
        failing since 27 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:19:25.005517  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-05-08T13:19:25.005608  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-08T13:19:25.005681  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000011f00800

    2023-05-08T13:19:25.005749  kern  :alert : [0000000000000008] pgd=3D080=
0000015000003, p4d=3D0800000015000003, pud=3D0800000015000003, pmd=3D080000=
0015e60003, pte=3D0000000000000000

    2023-05-08T13:19:25.005816  <8>[   23.689184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/6458f79da0131221792e8621

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6458f79da013122=
1792e8628
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-08T13:22:23.037907  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-08T13:22:23.038426  kern  :emerg : Code: 97faf110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-08T13:22:23.038770  <8>[   24.491088] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-08T13:22:23.039092  + set +x

    2023-05-08T13:22:23.039398  <8>[   24.493086] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10239253_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6458f79da013122=
1792e8629
        failing since 27 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-08T13:22:23.010635  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-08T13:22:23.011152  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-08T13:22:23.011493  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078c73000

    2023-05-08T13:22:23.011811  kern  :alert : [0000000000000008] pgd=3D080=
0000078c15003, p4d=3D0800000078c15003, pud=3D08000000796f9003, pmd=3D000000=
0000000000

    2023-05-08T13:22:23.012121  <8>[   24.465231] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f3908f9e5f7add2e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f3908f9e5f7add2e8=
5ff
        failing since 89 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645901265325ad11392e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645901265325ad11392e8=
5ef
        failing since 3 days (last pass: next-20230209, first fail: next-20=
230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f8e1f41356b2972e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f8e1f41356b2972e8=
5ec
        failing since 3 days (last pass: next-20230222, first fail: next-20=
230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f9f5c99d5686f42e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f9f5c99d5686f42e8=
5e7
        new failure (last pass: next-20230427) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f8c3414956f1af2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f8c3414956f1af2e8=
5ec
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6458fa15c99d5686f42e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458fa15c99d5686f42e8=
628
        new failure (last pass: next-20230427) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6458f3e91582890a722e863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230508/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230508/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6458f3e91582890a722e8=
63c
        failing since 10 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230426) =

 =20
