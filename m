Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6405E6FECF3
	for <lists+linux-next@lfdr.de>; Thu, 11 May 2023 09:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237737AbjEKHfL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 May 2023 03:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237234AbjEKHep (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 May 2023 03:34:45 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3479EE9
        for <linux-next@vger.kernel.org>; Thu, 11 May 2023 00:34:10 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso8913657b3a.3
        for <linux-next@vger.kernel.org>; Thu, 11 May 2023 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683790449; x=1686382449;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eD3jN+vwjWh3OM5SSxHw6OmRznCETCi7Owx0ydImhvk=;
        b=BrhPI+Yg12CNdd8I0v3c2Ppr/aDq8LS0orahCbu0UZAHljkisjvPmBS/WZVY3YYI8t
         y+MIrPbeZ5ncQQQ3jvKkavUJgTCEcc2mqOcBnlCL8a6SjrWOt7sK2cjBSR5y2TUQ/s5H
         xCVLMJNkLQnWa6EDhbAsAjnUB5xrvD66JwFglp+vCQtkHwk37fwr1WBvHKUK/M9Tli3f
         LeDGyaX6sditkQ0zS75kdqdfrfTHHrrukVuX2JTyqze4I4Q9FqfhsfZHWpDfEMRNexQ6
         q2wlEBBemuqKoGBVUOosplIUgE3p38nqsbz8G9fT53dH4xr3bpNMSPx+/38Y5da9PnL3
         K/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683790449; x=1686382449;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eD3jN+vwjWh3OM5SSxHw6OmRznCETCi7Owx0ydImhvk=;
        b=RWSs9TxTVTuGVqJ7YzN10hxMfwuXhFs5QM177v39d0yvJVJY4och35JWfdmR9E+gff
         6ADvizTm9Ee52MGxnxrD9kZIpJPHQd2R97CThZSS6i46a+KJSfnJgAc86dNXL2PQFiqD
         8EcF6UFMINpV9YWr/2lUr2wkWzVkh+y4idks2l5AhQyYdEShIKxoZLKOgKM7AYwO2oqj
         NW8MeZelJoxZiYI6+lH3D2UUC2Us63oTh65brVz2tCZvlPxKDK7cmWR21ljcqBsdejOI
         r81SOn4mosQtDdABaLkg4CJCMq2FxBzjD1saQn+37W4c+CoHRjTloLONIhzBjq84Wa4A
         lTLA==
X-Gm-Message-State: AC+VfDx0O5TjMMYnh+93W/0xuVOV5nySIhn/e0Hvn7ichrZbmzh+FbNw
        w3eM2F1Pu98R+xZvzPMm/lFnIopatEcyB82LzH3/fw==
X-Google-Smtp-Source: ACHHUZ5Gly8vz4v2fiIi4c5sI5FJcwgvClRJd5UcVfhyPolKIonMlVY9WfNCKykudVjCklllNSX2pQ==
X-Received: by 2002:a05:6a20:9143:b0:f0:2ba6:8406 with SMTP id x3-20020a056a20914300b000f02ba68406mr28002491pzc.26.1683790447996;
        Thu, 11 May 2023 00:34:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j8-20020aa79288000000b0063f0068cf6csm4614604pfa.198.2023.05.11.00.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 00:34:07 -0700 (PDT)
Message-ID: <645c9a6f.a70a0220.3e530.a131@mx.google.com>
Date:   Thu, 11 May 2023 00:34:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230511
X-Kernelci-Report-Type: test
Subject: next/master baseline: 737 runs, 82 regressions (next-20230511)
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

next/master baseline: 737 runs, 82 regressions (next-20230511)

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

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

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

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 31         =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

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

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230511/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230511
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aabe491169befbe5481144acf575a0260939764a =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c681ad9945fa2642e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c681ad9945fa2642e85eb
        failing since 43 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-11T03:59:05.718594  <8>[   10.426854] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10276714_1.4.2.3.1>

    2023-05-11T03:59:05.721992  + set +x

    2023-05-11T03:59:05.826618  / # #

    2023-05-11T03:59:05.927282  export SHELL=3D/bin/sh

    2023-05-11T03:59:05.927491  #

    2023-05-11T03:59:06.028070  / # export SHELL=3D/bin/sh. /lava-10276714/=
environment

    2023-05-11T03:59:06.028285  =


    2023-05-11T03:59:06.128832  / # . /lava-10276714/environment/lava-10276=
714/bin/lava-test-runner /lava-10276714/1

    2023-05-11T03:59:06.129217  =


    2023-05-11T03:59:06.134612  / # /lava-10276714/bin/lava-test-runner /la=
va-10276714/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6e165fb49a74372e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6e165fb49a74372e85fc
        failing since 43 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-11T04:24:47.635010  + set +x

    2023-05-11T04:24:47.641603  <8>[   10.507268] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277194_1.4.2.3.1>

    2023-05-11T04:24:47.746543  / # #

    2023-05-11T04:24:47.847136  export SHELL=3D/bin/sh

    2023-05-11T04:24:47.847310  #

    2023-05-11T04:24:47.947807  / # export SHELL=3D/bin/sh. /lava-10277194/=
environment

    2023-05-11T04:24:47.947979  =


    2023-05-11T04:24:48.048473  / # . /lava-10277194/environment/lava-10277=
194/bin/lava-test-runner /lava-10277194/1

    2023-05-11T04:24:48.048722  =


    2023-05-11T04:24:48.054287  / # /lava-10277194/bin/lava-test-runner /la=
va-10277194/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6f86b1700e41432e860d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6f86b1700e41432e8612
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-11T04:30:41.378459  + set +x<8>[   13.874652] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10277302_1.4.2.3.1>

    2023-05-11T04:30:41.378574  =


    2023-05-11T04:30:41.483506  / # #

    2023-05-11T04:30:41.584251  export SHELL=3D/bin/sh

    2023-05-11T04:30:41.585364  #

    2023-05-11T04:30:41.687318  / # export SHELL=3D/bin/sh. /lava-10277302/=
environment

    2023-05-11T04:30:41.687521  =


    2023-05-11T04:30:41.788062  / # . /lava-10277302/environment/lava-10277=
302/bin/lava-test-runner /lava-10277302/1

    2023-05-11T04:30:41.788356  =


    2023-05-11T04:30:41.794596  / # /lava-10277302/bin/lava-test-runner /la=
va-10277302/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c68183f9626db9c2e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c68183f9626db9c2e8605
        failing since 43 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-11T03:59:02.418326  <8>[   10.824056] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10276703_1.4.2.3.1>

    2023-05-11T03:59:02.421481  + set +x

    2023-05-11T03:59:02.524123  #

    2023-05-11T03:59:02.524391  =


    2023-05-11T03:59:02.624973  / # #export SHELL=3D/bin/sh

    2023-05-11T03:59:02.625137  =


    2023-05-11T03:59:02.725689  / # export SHELL=3D/bin/sh. /lava-10276703/=
environment

    2023-05-11T03:59:02.725856  =


    2023-05-11T03:59:02.826445  / # . /lava-10276703/environment/lava-10276=
703/bin/lava-test-runner /lava-10276703/1

    2023-05-11T03:59:02.826694  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6e0ea8d7db46032e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6e0ea8d7db46032e85eb
        failing since 43 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-11T04:24:28.055746  <8>[   10.269882] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277191_1.4.2.3.1>

    2023-05-11T04:24:28.059240  + set +x

    2023-05-11T04:24:28.164976  #

    2023-05-11T04:24:28.166259  =


    2023-05-11T04:24:28.268136  / # #export SHELL=3D/bin/sh

    2023-05-11T04:24:28.268898  =


    2023-05-11T04:24:28.370262  / # export SHELL=3D/bin/sh. /lava-10277191/=
environment

    2023-05-11T04:24:28.371002  =


    2023-05-11T04:24:28.472481  / # . /lava-10277191/environment/lava-10277=
191/bin/lava-test-runner /lava-10277191/1

    2023-05-11T04:24:28.473726  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6f6285e2f1f3ae2e8622

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6f6285e2f1f3ae2e8627
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-11T04:30:16.989826  + set +x

    2023-05-11T04:30:16.996395  <8>[   21.159899] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277328_1.4.2.3.1>

    2023-05-11T04:30:17.103469  / # #

    2023-05-11T04:30:17.205711  export SHELL=3D/bin/sh

    2023-05-11T04:30:17.206515  #

    2023-05-11T04:30:17.308151  / # export SHELL=3D/bin/sh. /lava-10277328/=
environment

    2023-05-11T04:30:17.308866  =


    2023-05-11T04:30:17.410426  / # . /lava-10277328/environment/lava-10277=
328/bin/lava-test-runner /lava-10277328/1

    2023-05-11T04:30:17.411708  =


    2023-05-11T04:30:17.417371  / # /lava-10277328/bin/lava-test-runner /la=
va-10277328/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6bd10b8c0677a42e86ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6bd10b8c0677a42e8=
6af
        failing since 43 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6b4a2ea3be05472e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c6b4a2ea3be0=
5472e85ed
        failing since 86 days (last pass: next-20230208, first fail: next-2=
0230213)
        30 lines

    2023-05-11T04:12:40.556315  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e9d200 pointer offset 4 size 512
    2023-05-11T04:12:40.588722  kern  :alert : Register r9 information: non=
-paged memory
    2023-05-11T04:12:40.589899  kern  :alert : Register r10 information: NU=
LL pointer
    2023-05-11T04:12:40.590318  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2d9000 allocated at load_module+0x6b0/0=
x1954
    2023-05-11T04:12:40.592140  kern  :alert : Register r12 information: no=
n-paged memory
    2023-05-11T04:12:40.697154  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-05-11T04:12:40.697817  kern  :emerg : Process udevd (pid: 66, stac=
k limit =3D 0xb7921b09)
    2023-05-11T04:12:40.698258  kern  :emerg : Stack: (0xc8905cf8 to 0xc890=
6000)
    2023-05-11T04:12:40.698619  kern  :emerg : 5ce0:                       =
                                c4e9d200 c0777880
    2023-05-11T04:12:40.698965  kern  :emerg : 5d00: 00000000 c03b0f68 0000=
0000 4e102e78 0000005d 4e102e78 c0777880 bf2d9220 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c687ff8047fb1242e8619

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c687ff8047fb1242e861e
        failing since 43 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-11T04:00:46.677121  + set +x

    2023-05-11T04:00:46.683527  <8>[   11.036755] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10276691_1.4.2.3.1>

    2023-05-11T04:00:46.787891  / # #

    2023-05-11T04:00:46.888414  export SHELL=3D/bin/sh

    2023-05-11T04:00:46.888578  #

    2023-05-11T04:00:46.989083  / # export SHELL=3D/bin/sh. /lava-10276691/=
environment

    2023-05-11T04:00:46.989297  =


    2023-05-11T04:00:47.089811  / # . /lava-10276691/environment/lava-10276=
691/bin/lava-test-runner /lava-10276691/1

    2023-05-11T04:00:47.090073  =


    2023-05-11T04:00:47.094886  / # /lava-10276691/bin/lava-test-runner /la=
va-10276691/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6e188c55005eac2e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6e188c55005eac2e85ef
        failing since 43 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-11T04:24:39.461391  + set +x

    2023-05-11T04:24:39.467450  <8>[   10.800912] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277228_1.4.2.3.1>

    2023-05-11T04:24:39.572940  / # #

    2023-05-11T04:24:39.673587  export SHELL=3D/bin/sh

    2023-05-11T04:24:39.673797  #

    2023-05-11T04:24:39.774399  / # export SHELL=3D/bin/sh. /lava-10277228/=
environment

    2023-05-11T04:24:39.774580  =


    2023-05-11T04:24:39.875089  / # . /lava-10277228/environment/lava-10277=
228/bin/lava-test-runner /lava-10277228/1

    2023-05-11T04:24:39.875353  =


    2023-05-11T04:24:39.880675  / # /lava-10277228/bin/lava-test-runner /la=
va-10277228/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6f6185e2f1f3ae2e860c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6f6185e2f1f3ae2e8611
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-11T04:30:07.950671  + set +x

    2023-05-11T04:30:07.957495  <8>[   13.561963] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277329_1.4.2.3.1>

    2023-05-11T04:30:08.063808  / # #

    2023-05-11T04:30:08.164462  export SHELL=3D/bin/sh

    2023-05-11T04:30:08.164681  #

    2023-05-11T04:30:08.265208  / # export SHELL=3D/bin/sh. /lava-10277329/=
environment

    2023-05-11T04:30:08.265441  =


    2023-05-11T04:30:08.365978  / # . /lava-10277329/environment/lava-10277=
329/bin/lava-test-runner /lava-10277329/1

    2023-05-11T04:30:08.366294  =


    2023-05-11T04:30:08.370578  / # /lava-10277329/bin/lava-test-runner /la=
va-10277329/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c67f46b5978b5a82e8608

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c67f46b5978b5a82e860d
        failing since 43 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-11T03:58:31.388304  <8>[   10.533629] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10276684_1.4.2.3.1>

    2023-05-11T03:58:31.391713  + set +x

    2023-05-11T03:58:31.496509  #

    2023-05-11T03:58:31.599317  / # #export SHELL=3D/bin/sh

    2023-05-11T03:58:31.600084  =


    2023-05-11T03:58:31.701708  / # export SHELL=3D/bin/sh. /lava-10276684/=
environment

    2023-05-11T03:58:31.702495  =


    2023-05-11T03:58:31.804186  / # . /lava-10276684/environment/lava-10276=
684/bin/lava-test-runner /lava-10276684/1

    2023-05-11T03:58:31.805396  =


    2023-05-11T03:58:31.810932  / # /lava-10276684/bin/lava-test-runner /la=
va-10276684/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6dfb5c370ed2042e860f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6dfb5c370ed2042e8614
        failing since 43 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-11T04:24:13.836412  + set +x

    2023-05-11T04:24:13.842503  <8>[    7.961915] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277206_1.4.2.3.1>

    2023-05-11T04:24:13.947532  / # #

    2023-05-11T04:24:14.048486  export SHELL=3D/bin/sh

    2023-05-11T04:24:14.048757  #

    2023-05-11T04:24:14.149384  / # export SHELL=3D/bin/sh. /lava-10277206/=
environment

    2023-05-11T04:24:14.149572  =


    2023-05-11T04:24:14.250092  / # . /lava-10277206/environment/lava-10277=
206/bin/lava-test-runner /lava-10277206/1

    2023-05-11T04:24:14.250448  =


    2023-05-11T04:24:14.255194  / # /lava-10277206/bin/lava-test-runner /la=
va-10277206/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6f56f813b4dc052e861a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c6f56f813b4dc052e861f
        failing since 40 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-11T04:29:53.567527  + set +x

    2023-05-11T04:29:53.573943  <8>[   14.313553] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10277311_1.4.2.3.1>

    2023-05-11T04:29:53.682244  / # #

    2023-05-11T04:29:53.784554  export SHELL=3D/bin/sh

    2023-05-11T04:29:53.785347  #

    2023-05-11T04:29:53.886766  / # export SHELL=3D/bin/sh. /lava-10277311/=
environment

    2023-05-11T04:29:53.887483  =


    2023-05-11T04:29:53.988980  / # . /lava-10277311/environment/lava-10277=
311/bin/lava-test-runner /lava-10277311/1

    2023-05-11T04:29:53.990071  =


    2023-05-11T04:29:53.995355  / # /lava-10277311/bin/lava-test-runner /la=
va-10277311/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6de0b5a490673a2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6de0b5a490673a2e8=
5f5
        failing since 394 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645c68d3ca566822e82e866b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645c68d3ca566822e82e8670
        failing since 21 days (last pass: next-20230417, first fail: next-2=
0230419)

    2023-05-11T04:02:04.251421  <8>[   11.380728] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3574613_1.5.2.4.1>
    2023-05-11T04:02:04.369777  / # #
    2023-05-11T04:02:04.471386  export SHELL=3D/bin/sh
    2023-05-11T04:02:04.471876  #
    2023-05-11T04:02:04.575111  / # export SHELL=3D/bin/sh. /lava-3574613/e=
nvironment
    2023-05-11T04:02:04.575676  =

    2023-05-11T04:02:04.677513  / # . /lava-3574613/environment/lava-357461=
3/bin/lava-test-runner /lava-3574613/1
    2023-05-11T04:02:04.678267  =

    2023-05-11T04:02:04.699351  / # /lava-3574613/bin/lava-test-runner /lav=
a-3574613/1
    2023-05-11T04:02:04.742147  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645c696c71a74e7bbe2e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c696c71a74e7bbe2e8=
61f
        failing since 20 days (last pass: next-20230412, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c69e6fd0d5a560b2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c69e6fd0d5a560b2e8=
5f1
        failing since 20 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6c273da518094a2e8730

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6c273da518094a2e8=
731
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6eaec46bd2550b2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6eaec46bd2550b2e8=
5e7
        failing since 106 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c68aa889a02de4d2e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c68aa889a02de4d2e8=
61c
        failing since 103 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6871f8047fb1242e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6871f8047fb1242e8=
5e9
        failing since 106 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645c69b9cd2c856f442e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c69b9cd2c856f442e8=
5fa
        failing since 22 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6eabe9d9b64d2c2e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6eabe9d9b64d2c2e8=
5ef
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 31         =


  Details:     https://kernelci.org/test/plan/id/645c67e8e7d90931ce2e8602

  Results:     140 PASS, 45 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mt8192-audio-probed: https://kernelci.org/test/case/id/=
645c67e8e7d90931ce2e8615
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:19.407223  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:19.414264  <8>[   51.036422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt8192-audio-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-vcodec-enc-probed: https://kernelci.org/test/case/i=
d/645c67e8e7d90931ce2e861d
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:15.229001  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:15.235936  <8>[   46.857634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-vcodec-enc-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-gamma-probed: https://kernelci.org/test/c=
ase/id/645c67e9e7d90931ce2e8636
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:10.755925  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:10.762523  <8>[   42.383043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-gamma-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-color-probed: https://kernelci.org/test/c=
ase/id/645c67e9e7d90931ce2e8638
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:09.714246  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:09.724291  <8>[   41.342611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-color-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ccorr-probed: https://kernelci.org/test/c=
ase/id/645c67e9e7d90931ce2e863a
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:08.672795  /lava-10276634/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-aal-probed: https://kernelci.org/test/cas=
e/id/645c67e9e7d90931ce2e863c
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:07.631029  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:07.637166  <8>[   39.258344] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-aal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma4-probed: https://kernelci.org/test/c=
ase/id/645c67e9e7d90931ce2e863e
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:06.589224  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:06.596016  <8>[   38.216551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma0-probed: https://kernelci.org/test/c=
ase/id/645c67e9e7d90931ce2e863f
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:05.565550  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:05.572343  <8>[   37.193092] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l2-probed: https://kernelci.org/test/=
case/id/645c67e9e7d90931ce2e8641
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:03.510874  <8>[   35.127939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l0-probed RESULT=3Dfail>

    2023-05-11T03:58:04.524091  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:04.530886  <8>[   36.151057] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l0-probed: https://kernelci.org/test/=
case/id/645c67e9e7d90931ce2e8642
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:03.501184  /lava-10276634/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-ovl0-probed: https://kernelci.org/test/ca=
se/id/645c67e9e7d90931ce2e8643
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:02.476994  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:02.483836  <8>[   34.103305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mutex-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8645
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:58:01.436890  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:58:01.443675  <8>[   33.064047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mutex-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/645c6=
7e9e7d90931ce2e8650
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:58.225779  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:58.232461  <8>[   29.851594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-iommu-probed: https://kernelci.org/test/case/id/645=
c67e9e7d90931ce2e8667
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:56.798373  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:56.804645  <8>[   28.423862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-iommu-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb18-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8669
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:55.759157  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:55.765961  <8>[   27.384858] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb18-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb13-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e866a
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:54.735774  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:54.742575  <8>[   26.361201] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb13-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb11-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e866b
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:53.712875  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:53.719733  <8>[   25.338640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb11-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb2-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e866c
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:52.691171  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:52.697376  <8>[   24.315268] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb17-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e866d
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:51.667851  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:51.674031  <8>[   23.292588] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb17-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb7-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e866e
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:50.643885  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:50.650626  <8>[   22.269291] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb7-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb9-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e866f
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:49.620277  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:49.626870  <8>[   21.245736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb9-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb19-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8670
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:48.597989  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:48.603896  <8>[   20.222080] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb19-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb16-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8671
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:47.574019  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:47.580863  <8>[   19.198817] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb16-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb4-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e8672
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:46.551098  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:46.557662  <8>[   18.175960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb1-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e8673
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:45.526947  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:45.533825  <8>[   17.152455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb20-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8674
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:44.504463  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:44.511201  <8>[   16.129070] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb20-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb14-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8675
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:43.480292  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:43.487218  <8>[   15.105742] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb14-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb5-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e8676
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:41.965455  <4>[   13.581896] rt5682 1-001a: Using defa=
ult DAI clk names: rt5682-dai-wclk, rt5682-dai-bclk

    2023-05-11T03:57:41.972097  <6>[   13.583548] platform 1502e000.larb: d=
eferred probe pending

    2023-05-11T03:57:41.975564  <6>[   13.583555] platform 1582e000.larb: d=
eferred probe pending

    2023-05-11T03:57:41.982266  <6>[   13.583559] platform 1600d000.larb: d=
eferred probe pending

    2023-05-11T03:57:41.988596  <6>[   13.583562] platform 1602e000.larb: d=
eferred probe pending

    2023-05-11T03:57:41.995257  <6>[   13.583565] platform 17010000.larb: d=
eferred probe pending

    2023-05-11T03:57:41.998617  <6>[   13.583568] platform 1a001000.larb: d=
eferred probe pending

    2023-05-11T03:57:42.005685  <6>[   13.583571] platform 1a002000.larb: d=
eferred probe pending

    2023-05-11T03:57:42.012432  <6>[   13.583574] platform 1a00f000.larb: d=
eferred probe pending

    2023-05-11T03:57:42.019401  <6>[   13.583578] platform 1a010000.larb: d=
eferred probe pending
 =

    ... (30 line(s) more)  =


  * baseline.bootrr.mtk-smi-larb0-probed: https://kernelci.org/test/case/id=
/645c67e9e7d90931ce2e8677
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:41.434975  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:41.441466  <8>[   13.058810] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-common-probed: https://kernelci.org/test/case/i=
d/645c67e9e7d90931ce2e8679
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:40.395443  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:40.402270  <8>[   12.020052] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-common-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-power-controller-probed: https://kernelci.org/test/=
case/id/645c67e9e7d90931ce2e868e
        failing since 5 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-11T03:57:36.975525  /lava-10276634/1/../bin/lava-test-case

    2023-05-11T03:57:36.981853  <8>[    8.599382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-power-controller-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645c69c9a5ab58fab52e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c69c9a5ab58fab52e8=
5f2
        failing since 22 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6eb04d7e1ddf0f2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6eb04d7e1ddf0f2e8=
5e9
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c84d9dd669c501d2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c84d9dd669c501d2e8=
5f9
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6da8c304f5c7622e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6da8c304f5c7622e8=
610
        failing since 2 days (last pass: next-20230505, first fail: next-20=
230508) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6658f81ad7cf732e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6658f81ad7cf732e8=
5f4
        failing since 29 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645c67ace4efde40222e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c67ace4efde40222e8=
5f1
        failing since 29 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6e79eb1cf74af62e8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6e79eb1cf74af62e8=
632
        failing since 169 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6d7578be81551e2e8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6d7578be81551e2e8=
684
        failing since 169 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645c68253f9626db9c2e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c68253f9626db9c2e8=
61b
        failing since 29 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645c69026e4d22b0382e860e

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c69026e4d22b=
0382e8665
        failing since 22 days (last pass: next-20230404, first fail: next-2=
0230417)
        2 lines

    2023-05-11T04:02:44.605430  at virtual address 0000000000000008

    2023-05-11T04:02:44.609190  kern  :alert : Mem abort info:

    2023-05-11T04:02:44.613145  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-11T04:02:44.619094  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-11T04:02:44.622786  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-11T04:02:44.626599  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-11T04:02:44.631955  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-11T04:02:44.634104  kern  :alert : Data abort info:

    2023-05-11T04:02:44.638874  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c69026e4d22b=
0382e8666
        failing since 22 days (last pass: next-20230404, first fail: next-2=
0230417)
        12 lines

    2023-05-11T04:02:44.602502  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   18.472721] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6efbad05c15f332e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6efbad05c15f332e8=
5e7
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/645c6875f8047fb1242e85eb

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c6875f8047fb=
1242e85f2
        failing since 29 days (last pass: next-20230404, first fail: next-2=
0230411)
        2 lines

    2023-05-11T04:00:38.841415  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-11T04:00:38.842797  kern  :emerg : Code: 97fd7110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-11T04:00:38.852332  <8>[   25.804219] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-11T04:00:38.852822  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c6875f8047fb=
1242e85f3
        failing since 29 days (last pass: next-20230404, first fail: next-2=
0230411)
        12 lines

    2023-05-11T04:00:38.813877  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-11T04:00:38.814619  kern  :alert : Mem abort info:
    2023-05-11T04:00:38.814986  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-11T04:00:38.815335  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-11T04:00:38.815688  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-11T04:00:38.815976  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-11T04:00:38.816305  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-11T04:00:38.816859  kern  :alert : Data abort info:
    2023-05-11T04:00:38.817159  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-11T04:00:38.819621  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645c69150a2fb056fe2e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c69150a2fb05=
6fe2e85ee
        failing since 29 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-11T04:03:16.845573  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-11T04:03:16.849998  kern  :alert : Mem abort info:
    2023-05-11T04:03:16.854290  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-11T04:03:16.854671  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-11T04:03:16.858555  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-11T04:03:16.860731  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-11T04:03:16.861346  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-11T04:03:16.861692  kern  :alert : Data abort info:
    2023-05-11T04:03:16.862047  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-11T04:03:16.862350  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c69150a2fb05=
6fe2e85ef
        failing since 29 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-11T04:03:16.870647  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-11T04:03:16.871071  kern  :emerg : Code: 97fe1110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-11T04:03:16.883686  <8>[   21.552142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-11T04:03:16.884170  + set +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645c6c4a581401a8ef2e85e7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645c6c4a581401a=
8ef2e85ee
        failing since 29 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-11T04:16:55.009040  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-11T04:16:55.009753  kern  :emerg : Code: 97fc0110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-11T04:16:55.019542  <8>[   21.700625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-11T04:16:55.019876  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645c6c4a581401a=
8ef2e85ef
        failing since 29 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-11T04:16:54.982362  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-11T04:16:54.985416  kern  :alert : Mem abort info:
    2023-05-11T04:16:54.988123  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-11T04:16:54.988433  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-11T04:16:54.990932  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-11T04:16:54.993649  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-11T04:16:54.996564  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-11T04:16:54.996870  kern  :alert : Data abort info:
    2023-05-11T04:16:54.999054  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-11T04:16:54.999344  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6a142fbef088f22e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6a142fbef088f22e8=
5f7
        new failure (last pass: next-20230505) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6cf940d2bf61e62e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6cf940d2bf61e62e8=
5fc
        new failure (last pass: next-20230425) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6eca105e53f1792e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6eca105e53f1792e8=
5ed
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6982e0d52727bc2e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6982e0d52727bc2e8=
628
        failing since 0 day (last pass: next-20230508, first fail: next-202=
30510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6aed70a41ac0302e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6aed70a41ac0302e8=
5ec
        failing since 5 days (last pass: next-20230504, first fail: next-20=
230505) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6966fda714c3c62e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6966fda714c3c62e8=
617
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6acd5ed58224792e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6acd5ed58224792e8=
5e8
        failing since 5 days (last pass: next-20230504, first fail: next-20=
230505) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645c698dbf4f0ac2012e86c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c698dbf4f0ac2012e8=
6c7
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645c6dc66bb9ed09f92e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230511/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230511/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645c6dc66bb9ed09f92e8=
60b
        new failure (last pass: next-20230510) =

 =20
