Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28D0742064
	for <lists+linux-next@lfdr.de>; Thu, 29 Jun 2023 08:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjF2Gay (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jun 2023 02:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjF2Gax (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2023 02:30:53 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6662102
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 23:30:47 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-67ef5af0ce8so369003b3a.2
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688020247; x=1690612247;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MSa7Im2g6N9fZWNrkngGbgkDIbbhjp2HjNRkJlAAEkw=;
        b=YgbhltLJff/nDISzlNnvSNymy6QHFq8SXd5JbKywMn5p42o7gtkfNqrfBIVRX4eEPw
         Afq/wPwcmO3vs8uECTxIZKiNk6aFIhMlQyjS5ROurKauXMznCeHLBmVEU8NI+CjP8liO
         IBQxWmva0l4rc1QHYZzNgiPebhds7tzTI5h+JI4qHlXNDenRCP5sZWqEXFE5/8yZhew3
         hZCutnvLO7s8u8wcapHAqigfQj4TpU2DIr9SxnnS4QCjnpJN0xlWAeMczOFKrPGChtc+
         Cox75UJ9f0iRL3ae1gYACm4++5bDiZK0yGHEL5GBFu8A0waZMRRmk4hsABcwucPmUoe3
         st3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688020247; x=1690612247;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSa7Im2g6N9fZWNrkngGbgkDIbbhjp2HjNRkJlAAEkw=;
        b=lZWuiNAfOs767vqNfjV5ihCVazxJFgs3x3nZyiEkEJL0TE9G/Yvbx8+VFFV9+C1dCr
         S40vruNGqThPUkBwqy/JtQa8htByRgLAc6U7HrXC/K9PPqyWPLhg0GxlV1FqCGILr2N7
         O4VGKVHaMJZbBssFYkAPEulEvIYT514xWzGqX/9KaigKoDMjATWpUE5QOH1QjZ/uy+EL
         7+k7DTBDyuJGkqJWrlUeEz7CAfxZ4hwD9WPgrkuTIqOEcMgS/i0kRY5X9lbLmQ68VNlb
         a1IXzn5tGmEwtbZqLs3NzUr3J/13ftkZAYo6L5RZ0XJS5ZHm8gKZP2H2c1537ofEy8Ss
         fecA==
X-Gm-Message-State: AC+VfDy/33A4CgHAcBYrazwReJqfLnCqH//xEsW8kUR9jil/jnMdJBuY
        +CGMncicMDKkh5PgznrxU497lehrIruNp2G97Coebg==
X-Google-Smtp-Source: ACHHUZ509llVuY4oVkWAA2GJoPi6zkRHT3GvfJfyWNH66ytU7zifyeacdXyCKk+Iny0+IHmFu1USAg==
X-Received: by 2002:a05:6a20:914d:b0:122:e62d:dd0a with SMTP id x13-20020a056a20914d00b00122e62ddd0amr30353513pzc.26.1688020245689;
        Wed, 28 Jun 2023 23:30:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v26-20020aa7809a000000b006589cf6d88bsm8130442pff.145.2023.06.28.23.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 23:30:44 -0700 (PDT)
Message-ID: <649d2514.a70a0220.6d04b.0569@mx.google.com>
Date:   Wed, 28 Jun 2023 23:30:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-4938-g5c1c4e99720d8
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 341 runs,
 65 regressions (v6.4-4938-g5c1c4e99720d8)
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

next/pending-fixes baseline: 341 runs, 65 regressions (v6.4-4938-g5c1c4e997=
20d8)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+crypto    | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+ima       | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-4938-g5c1c4e99720d8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-4938-g5c1c4e99720d8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5c1c4e99720d8ee34ed41b3623a4ea04aa84600f =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce546900962f0f3bb2a9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce546900962f0f3bb2=
a9c
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce2ba32b03b3d51bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce2ba32b03b3d51bb2=
a76
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce248fd68888f85bb2a8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce248fd68888f85bb2=
a90
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce47101543ce34dbb2a7b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce47101543ce34dbb2a80
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:54:41.594278  <8>[   10.517685] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10943321_1.4.2.3.1>

    2023-06-29T01:54:41.597738  + set +x

    2023-06-29T01:54:41.701622  / # #

    2023-06-29T01:54:41.802278  export SHELL=3D/bin/sh

    2023-06-29T01:54:41.802473  #

    2023-06-29T01:54:41.903006  / # export SHELL=3D/bin/sh. /lava-10943321/=
environment

    2023-06-29T01:54:41.903241  =


    2023-06-29T01:54:42.003799  / # . /lava-10943321/environment/lava-10943=
321/bin/lava-test-runner /lava-10943321/1

    2023-06-29T01:54:42.004071  =


    2023-06-29T01:54:42.008965  / # /lava-10943321/bin/lava-test-runner /la=
va-10943321/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce83e6d708f5709bb2acb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce83e6d708f5709bb2ad0
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:11:00.292567  <8>[   10.513379] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10943973_1.4.2.3.1>

    2023-06-29T02:11:00.295665  + set +x

    2023-06-29T02:11:00.396924  #

    2023-06-29T02:11:00.397229  =


    2023-06-29T02:11:00.497737  / # #export SHELL=3D/bin/sh

    2023-06-29T02:11:00.497981  =


    2023-06-29T02:11:00.598501  / # export SHELL=3D/bin/sh. /lava-10943973/=
environment

    2023-06-29T02:11:00.598733  =


    2023-06-29T02:11:00.699244  / # . /lava-10943973/environment/lava-10943=
973/bin/lava-test-runner /lava-10943973/1

    2023-06-29T02:11:00.699538  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce2bb0d1cc94e5cbb2a82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce2bb0d1cc94e5cbb2=
a83
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce44d90f4ebc7d3bb2a75

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce44d90f4ebc7d3bb2a7a
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:54:02.066228  + set<8>[    8.967114] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10943335_1.4.2.3.1>

    2023-06-29T01:54:02.066340   +x

    2023-06-29T01:54:02.170212  / # #

    2023-06-29T01:54:02.270828  export SHELL=3D/bin/sh

    2023-06-29T01:54:02.271047  #

    2023-06-29T01:54:02.371618  / # export SHELL=3D/bin/sh. /lava-10943335/=
environment

    2023-06-29T01:54:02.371838  =


    2023-06-29T01:54:02.472421  / # . /lava-10943335/environment/lava-10943=
335/bin/lava-test-runner /lava-10943335/1

    2023-06-29T01:54:02.472860  =


    2023-06-29T01:54:02.477219  / # /lava-10943335/bin/lava-test-runner /la=
va-10943335/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce84ae48a282d00bb2ac7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce84ae48a282d00bb2acc
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:11:08.669865  + set<8>[   11.735696] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10944021_1.4.2.3.1>

    2023-06-29T02:11:08.669970   +x

    2023-06-29T02:11:08.774123  / # #

    2023-06-29T02:11:08.874783  export SHELL=3D/bin/sh

    2023-06-29T02:11:08.874990  #

    2023-06-29T02:11:08.975517  / # export SHELL=3D/bin/sh. /lava-10944021/=
environment

    2023-06-29T02:11:08.975737  =


    2023-06-29T02:11:09.076263  / # . /lava-10944021/environment/lava-10944=
021/bin/lava-test-runner /lava-10944021/1

    2023-06-29T02:11:09.076640  =


    2023-06-29T02:11:09.080804  / # /lava-10944021/bin/lava-test-runner /la=
va-10944021/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce1eccd2d307fc0bb2aa4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce1eccd2d307fc0bb2=
aa5
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce44f7669a41b5dbb2a98

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce44f7669a41b5dbb2a9d
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:54:06.130618  <8>[    9.839050] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10943379_1.4.2.3.1>

    2023-06-29T01:54:06.133749  + set +x

    2023-06-29T01:54:06.235153  #

    2023-06-29T01:54:06.235528  =


    2023-06-29T01:54:06.336172  / # #export SHELL=3D/bin/sh

    2023-06-29T01:54:06.336385  =


    2023-06-29T01:54:06.436923  / # export SHELL=3D/bin/sh. /lava-10943379/=
environment

    2023-06-29T01:54:06.437139  =


    2023-06-29T01:54:06.537674  / # . /lava-10943379/environment/lava-10943=
379/bin/lava-test-runner /lava-10943379/1

    2023-06-29T01:54:06.537998  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce848e48a282d00bb2ab9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce848e48a282d00bb2abe
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:11:08.345082  <8>[   10.144246] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10944011_1.4.2.3.1>

    2023-06-29T02:11:08.348871  + set +x

    2023-06-29T02:11:08.454112  #

    2023-06-29T02:11:08.455129  =


    2023-06-29T02:11:08.556708  / # #export SHELL=3D/bin/sh

    2023-06-29T02:11:08.557488  =


    2023-06-29T02:11:08.658865  / # export SHELL=3D/bin/sh. /lava-10944011/=
environment

    2023-06-29T02:11:08.659533  =


    2023-06-29T02:11:08.760890  / # . /lava-10944011/environment/lava-10944=
011/bin/lava-test-runner /lava-10944011/1

    2023-06-29T02:11:08.761923  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/649cd91e157b95bb1fbb2a7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649cd91e157b95bb1fbb2a7f
        failing since 168 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-29T01:07:15.861797  / # #

    2023-06-29T01:07:15.963868  export SHELL=3D/bin/sh

    2023-06-29T01:07:15.964591  #

    2023-06-29T01:07:16.065968  / # export SHELL=3D/bin/sh. /lava-10942657/=
environment

    2023-06-29T01:07:16.066677  =


    2023-06-29T01:07:16.167941  / # . /lava-10942657/environment/lava-10942=
657/bin/lava-test-runner /lava-10942657/1

    2023-06-29T01:07:16.168959  =


    2023-06-29T01:07:16.185648  / # /lava-10942657/bin/lava-test-runner /la=
va-10942657/1

    2023-06-29T01:07:16.296801  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-29T01:07:16.297321  + cd /lava-10942657/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce88493ac2d6db1bb2a86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce88493ac2d6db1bb2=
a87
        failing since 122 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce31b3e86959b90bb2a7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce31b3e86959b90bb2=
a7f
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce2d032b03b3d51bb2a8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce2d032b03b3d51bb2=
a8f
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce203e7d4ea32c5bb2ab3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce203e7d4ea32c5bb2=
ab4
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce1e19ae4dbab6abb2a90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce1e19ae4dbab6abb2=
a91
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce480164c5dc8c8bb2aae

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce480164c5dc8c8bb2ab3
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-29T01:55:07.299204  + set +x

    2023-06-29T01:55:07.305570  <8>[   12.927948] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10943169_1.4.2.3.1>

    2023-06-29T01:55:07.412963  / # #

    2023-06-29T01:55:07.515238  export SHELL=3D/bin/sh

    2023-06-29T01:55:07.515959  #

    2023-06-29T01:55:07.617430  / # export SHELL=3D/bin/sh. /lava-10943169/=
environment

    2023-06-29T01:55:07.618193  =


    2023-06-29T01:55:07.719570  / # . /lava-10943169/environment/lava-10943=
169/bin/lava-test-runner /lava-10943169/1

    2023-06-29T01:55:07.721025  =


    2023-06-29T01:55:07.725717  / # /lava-10943169/bin/lava-test-runner /la=
va-10943169/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce4d54456c110abbb2a86

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce4d54456c110abbb2a8b
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:56:22.777472  + <8>[   10.884527] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10943322_1.4.2.3.1>

    2023-06-29T01:56:22.777963  set +x

    2023-06-29T01:56:22.883525  #

    2023-06-29T01:56:22.884671  =


    2023-06-29T01:56:22.986335  / # #export SHELL=3D/bin/sh

    2023-06-29T01:56:22.987050  =


    2023-06-29T01:56:23.088384  / # export SHELL=3D/bin/sh. /lava-10943322/=
environment

    2023-06-29T01:56:23.089062  =


    2023-06-29T01:56:23.190434  / # . /lava-10943322/environment/lava-10943=
322/bin/lava-test-runner /lava-10943322/1

    2023-06-29T01:56:23.191491  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce86d79cab1a4b5bb2b2e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce86d79cab1a4b5bb2b33
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:11:43.962016  + set +x

    2023-06-29T02:11:43.968830  <8>[   10.588802] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10944015_1.4.2.3.1>

    2023-06-29T02:11:44.073155  / # #

    2023-06-29T02:11:44.173678  export SHELL=3D/bin/sh

    2023-06-29T02:11:44.173833  #

    2023-06-29T02:11:44.274301  / # export SHELL=3D/bin/sh. /lava-10944015/=
environment

    2023-06-29T02:11:44.274467  =


    2023-06-29T02:11:44.374951  / # . /lava-10944015/environment/lava-10944=
015/bin/lava-test-runner /lava-10944015/1

    2023-06-29T02:11:44.375209  =


    2023-06-29T02:11:44.379396  / # /lava-10944015/bin/lava-test-runner /la=
va-10944015/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce1d3002619b958bb2a8b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce1d3002619b958bb2a90
        failing since 90 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-29T01:43:39.089141  + set<8>[   13.657179] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10943154_1.4.2.3.1>

    2023-06-29T01:43:39.089248   +x

    2023-06-29T01:43:39.191751  =


    2023-06-29T01:43:39.292364  / # #export SHELL=3D/bin/sh

    2023-06-29T01:43:39.292629  =


    2023-06-29T01:43:39.393113  / # export SHELL=3D/bin/sh. /lava-10943154/=
environment

    2023-06-29T01:43:39.393302  =


    2023-06-29T01:43:39.493829  / # . /lava-10943154/environment/lava-10943=
154/bin/lava-test-runner /lava-10943154/1

    2023-06-29T01:43:39.494131  =


    2023-06-29T01:43:39.499605  / # /lava-10943154/bin/lava-test-runner /la=
va-10943154/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce43b56b3da4824bb2a9a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce43b56b3da4824bb2a9f
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:53:51.381480  <8>[   10.129703] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10943349_1.4.2.3.1>

    2023-06-29T01:53:51.384481  + set +x

    2023-06-29T01:53:51.486194  #

    2023-06-29T01:53:51.587173  / # #export SHELL=3D/bin/sh

    2023-06-29T01:53:51.587461  =


    2023-06-29T01:53:51.688074  / # export SHELL=3D/bin/sh. /lava-10943349/=
environment

    2023-06-29T01:53:51.688346  =


    2023-06-29T01:53:51.789054  / # . /lava-10943349/environment/lava-10943=
349/bin/lava-test-runner /lava-10943349/1

    2023-06-29T01:53:51.789400  =


    2023-06-29T01:53:51.793989  / # /lava-10943349/bin/lava-test-runner /la=
va-10943349/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce848340abee5d6bb2abd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce848340abee5d6bb2ac2
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:11:01.418879  + set +x<8>[   10.578113] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10943943_1.4.2.3.1>

    2023-06-29T02:11:01.418973  =


    2023-06-29T02:11:01.520696  #

    2023-06-29T02:11:01.621508  / # #export SHELL=3D/bin/sh

    2023-06-29T02:11:01.621732  =


    2023-06-29T02:11:01.722229  / # export SHELL=3D/bin/sh. /lava-10943943/=
environment

    2023-06-29T02:11:01.722432  =


    2023-06-29T02:11:01.822967  / # . /lava-10943943/environment/lava-10943=
943/bin/lava-test-runner /lava-10943943/1

    2023-06-29T02:11:01.823255  =


    2023-06-29T02:11:01.828051  / # /lava-10943943/bin/lava-test-runner /la=
va-10943943/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce1e0002619b958bb2aaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce1e0002619b958bb2=
ab0
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce44bda1b13a4f4bb2aa2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce44bda1b13a4f4bb2aa7
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:54:02.552556  + <8>[   10.889542] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10943370_1.4.2.3.1>

    2023-06-29T01:54:02.553176  set +x

    2023-06-29T01:54:02.661120  / # #

    2023-06-29T01:54:02.763507  export SHELL=3D/bin/sh

    2023-06-29T01:54:02.764306  #

    2023-06-29T01:54:02.865840  / # export SHELL=3D/bin/sh. /lava-10943370/=
environment

    2023-06-29T01:54:02.866704  =


    2023-06-29T01:54:02.968403  / # . /lava-10943370/environment/lava-10943=
370/bin/lava-test-runner /lava-10943370/1

    2023-06-29T01:54:02.969884  =


    2023-06-29T01:54:02.974933  / # /lava-10943370/bin/lava-test-runner /la=
va-10943370/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce846340abee5d6bb2aa3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce846340abee5d6bb2aa8
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:10:59.071458  + <8>[   11.131862] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10944010_1.4.2.3.1>

    2023-06-29T02:10:59.071550  set +x

    2023-06-29T02:10:59.175851  / # #

    2023-06-29T02:10:59.276706  export SHELL=3D/bin/sh

    2023-06-29T02:10:59.276906  #

    2023-06-29T02:10:59.377442  / # export SHELL=3D/bin/sh. /lava-10944010/=
environment

    2023-06-29T02:10:59.377683  =


    2023-06-29T02:10:59.478228  / # . /lava-10944010/environment/lava-10944=
010/bin/lava-test-runner /lava-10944010/1

    2023-06-29T02:10:59.478497  =


    2023-06-29T02:10:59.483220  / # /lava-10944010/bin/lava-test-runner /la=
va-10944010/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce5951ea322b818bb2a83

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/=
baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/=
baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce5951ea322b818bb2a88
        failing since 150 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-29T01:59:24.785167  + set +x
    2023-06-29T01:59:24.785334  [   12.244963] <LAVA_SIGNAL_ENDRUN 0_dmesg =
990107_1.5.2.3.1>
    2023-06-29T01:59:24.892730  / # #
    2023-06-29T01:59:24.994299  export SHELL=3D/bin/sh
    2023-06-29T01:59:24.994805  #
    2023-06-29T01:59:25.096005  / # export SHELL=3D/bin/sh. /lava-990107/en=
vironment
    2023-06-29T01:59:25.096404  =

    2023-06-29T01:59:25.197755  / # . /lava-990107/environment/lava-990107/=
bin/lava-test-runner /lava-990107/1
    2023-06-29T01:59:25.198253  =

    2023-06-29T01:59:25.201849  / # /lava-990107/bin/lava-test-runner /lava=
-990107/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce684f74f70b954bb2a8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce684f74f70b954bb2a8f
        failing since 150 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-29T02:03:25.764121  + set +x
    2023-06-29T02:03:25.764357  [   14.324430] <LAVA_SIGNAL_ENDRUN 0_dmesg =
990121_1.5.2.3.1>
    2023-06-29T02:03:25.872197  / # #
    2023-06-29T02:03:25.973802  export SHELL=3D/bin/sh
    2023-06-29T02:03:25.974271  #
    2023-06-29T02:03:26.075508  / # export SHELL=3D/bin/sh. /lava-990121/en=
vironment
    2023-06-29T02:03:26.075902  =

    2023-06-29T02:03:26.177118  / # . /lava-990121/environment/lava-990121/=
bin/lava-test-runner /lava-990121/1
    2023-06-29T02:03:26.177681  =

    2023-06-29T02:03:26.180886  / # /lava-990121/bin/lava-test-runner /lava=
-990121/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce738f8d7e0ff4ebb2a77

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-im=
x53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-im=
x53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce738f8d7e0ff4ebb2a7c
        failing since 150 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-29T02:06:26.248813  + set +x
    2023-06-29T02:06:26.248984  [   13.145741] <LAVA_SIGNAL_ENDRUN 0_dmesg =
990127_1.5.2.3.1>
    2023-06-29T02:06:26.356671  / # #
    2023-06-29T02:06:26.458149  export SHELL=3D/bin/sh
    2023-06-29T02:06:26.458555  #
    2023-06-29T02:06:26.559792  / # export SHELL=3D/bin/sh. /lava-990127/en=
vironment
    2023-06-29T02:06:26.560236  =

    2023-06-29T02:06:26.661408  / # . /lava-990127/environment/lava-990127/=
bin/lava-test-runner /lava-990127/1
    2023-06-29T02:06:26.661964  =

    2023-06-29T02:06:26.665342  / # /lava-990127/bin/lava-test-runner /lava=
-990127/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce78961c18d9fc4bb2a78

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pe=
ngutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pe=
ngutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce78961c18d9fc4bb2a7d
        failing since 150 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-29T02:07:43.355339  + set +x
    2023-06-29T02:07:43.355591  [   12.882112] <LAVA_SIGNAL_ENDRUN 0_dmesg =
990136_1.5.2.3.1>
    2023-06-29T02:07:43.463188  / # #
    2023-06-29T02:07:43.565096  export SHELL=3D/bin/sh
    2023-06-29T02:07:43.565591  #
    2023-06-29T02:07:43.666926  / # export SHELL=3D/bin/sh. /lava-990136/en=
vironment
    2023-06-29T02:07:43.667416  =

    2023-06-29T02:07:43.768758  / # . /lava-990136/environment/lava-990136/=
bin/lava-test-runner /lava-990136/1
    2023-06-29T02:07:43.769386  =

    2023-06-29T02:07:43.773067  / # /lava-990136/bin/lava-test-runner /lava=
-990136/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/649cec0d8908ff1d78bb2a8c

  Results:     92 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
49cec0d8908ff1d78bb2ac2
        new failure (last pass: v6.4-rc7-318-gd779731ecfed)

    2023-06-29T02:27:07.633095  /lava-366566/1/../bin/lava-test-case
    2023-06-29T02:27:07.636195  <8>[   43.777703] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
49cec0d8908ff1d78bb2ac3
        new failure (last pass: v6.4-rc7-318-gd779731ecfed)

    2023-06-29T02:27:08.655643  /lava-366566/1/../bin/lava-test-case
    2023-06-29T02:27:08.658692  <8>[   44.799676] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
49cec0d8908ff1d78bb2ac4
        new failure (last pass: v6.4-rc7-318-gd779731ecfed)

    2023-06-29T02:27:09.718968  /lava-366566/1/../bin/lava-test-case
    2023-06-29T02:27:09.719183  <8>[   45.821560] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-06-29T02:27:09.719294  /lava-366566/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/649cebd1c79e42ab16bb2aae

  Results:     100 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
49cebd1c79e42ab16bb2aeb
        new failure (last pass: v6.4-rc7-318-gd779731ecfed)

    2023-06-29T02:26:09.434829  /lava-366568/1/../bin/lava-test-case
    2023-06-29T02:26:09.438070  <8>[   43.348073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
49cebd1c79e42ab16bb2aec
        new failure (last pass: v6.4-rc7-318-gd779731ecfed)

    2023-06-29T02:26:10.456289  /lava-366568/1/../bin/lava-test-case
    2023-06-29T02:26:10.459571  <8>[   44.370043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
49cebd1c79e42ab16bb2aed
        new failure (last pass: v6.4-rc7-318-gd779731ecfed)

    2023-06-29T02:26:11.521243  /lava-366568/1/../bin/lava-test-case
    2023-06-29T02:26:11.521783  <8>[   45.393740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-06-29T02:26:11.522237  /lava-366568/1/../bin/lava-test-case
    2023-06-29T02:26:11.522686  <8>[   45.411278] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce1e29ae4dbab6abb2a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce1e29ae4dbab6abb2=
a96
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce45d6d467fdc63bb2a9b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce45d6d467fdc63bb2aa0
        failing since 92 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T01:54:16.864559  <8>[   11.571010] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10943365_1.4.2.3.1>

    2023-06-29T01:54:16.969045  / # #

    2023-06-29T01:54:17.069800  export SHELL=3D/bin/sh

    2023-06-29T01:54:17.070010  #

    2023-06-29T01:54:17.170496  / # export SHELL=3D/bin/sh. /lava-10943365/=
environment

    2023-06-29T01:54:17.170730  =


    2023-06-29T01:54:17.271323  / # . /lava-10943365/environment/lava-10943=
365/bin/lava-test-runner /lava-10943365/1

    2023-06-29T01:54:17.271630  =


    2023-06-29T01:54:17.276623  / # /lava-10943365/bin/lava-test-runner /la=
va-10943365/1

    2023-06-29T01:54:17.282889  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce838e48a282d00bb2a83

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce838e48a282d00bb2a88
        failing since 92 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-29T02:10:51.297400  <8>[   11.404614] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10944008_1.4.2.3.1>

    2023-06-29T02:10:51.401122  / # #

    2023-06-29T02:10:51.501809  export SHELL=3D/bin/sh

    2023-06-29T02:10:51.501994  #

    2023-06-29T02:10:51.602487  / # export SHELL=3D/bin/sh. /lava-10944008/=
environment

    2023-06-29T02:10:51.602688  =


    2023-06-29T02:10:51.703227  / # . /lava-10944008/environment/lava-10944=
008/bin/lava-test-runner /lava-10944008/1

    2023-06-29T02:10:51.703503  =


    2023-06-29T02:10:51.708115  / # /lava-10944008/bin/lava-test-runner /la=
va-10944008/1

    2023-06-29T02:10:51.715013  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649cf1df000233331cbb2a81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cf1df000233331cbb2=
a82
        failing since 1 day (last pass: v6.4-rc7-318-gd779731ecfed, first f=
ail: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649d0f789f74f3e1a2bb2b2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774a1-hihope-r=
zg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774a1-hihope-r=
zg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649d0f789f74f3e1a2bb2=
b30
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649cee375b25911359bb2a91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cee375b25911359bb2=
a92
        new failure (last pass: v6.4-1651-gf52dd2890422) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649cf168321eab0bb3bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cf168321eab0bb3bb2=
a76
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce383249bf8bdebbb2ac7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce383249bf8bdebbb2=
ac8
        failing since 195 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce27fae35bf6f8ebb2a8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ce27fae35bf6f8ebb2=
a8e
        failing since 195 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =


  Details:     https://kernelci.org/test/plan/id/649ce5a3133463d3c4bb2a7e

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/ba=
seline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/ba=
seline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/649ce5a3133463d3c4bb2a94
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:00:44.727630  /lava-10943639/1/../bin/lava-test-case<8>[ =
  23.418425] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-driver-=
present RESULT=3Dpass>

    2023-06-29T02:00:44.727865  =

   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/649ce5a3133463d3c4bb2aaa
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:00:43.262344  /lava-10943639/1/../bin/lava-test-case<8>[ =
  21.953364] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwmmc_rockchip-sdmmc-prob=
ed RESULT=3Dfail>

    2023-06-29T02:00:43.262404  =

   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/649ce5a3133463d3c4bb2aab
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:00:42.242500  0943639/1/../bin/lava-test-case

    2023-06-29T02:00:42.248051  BusyBox v1.31.1 (2023-06-23 08:10:20 UTC) m=
ulti-call binary.

    2023-06-29T02:00:42.248693  =


    2023-06-29T02:00:42.253026  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-29T02:00:42.253077  =


    2023-06-29T02:00:42.258153  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-29T02:00:42.260733  FIRST, INC default to 1.

    2023-06-29T02:00:42.260947  =


    2023-06-29T02:00:42.264285  	-w	Pad to last with leading zeros

    2023-06-29T02:00:42.266815  	-s SEP	String separator
 =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+crypto    | 3          =


  Details:     https://kernelci.org/test/plan/id/649ce66858fd168ee5bb2b49

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/649ce66858fd168ee5bb2b5f
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:04:08.568693  <8>[   22.916029] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-06-29T02:04:09.581938  /lava-10943799/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/649ce66858fd168ee5bb2b75
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:04:07.103452  <8>[   21.451330] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/649ce66858fd168ee5bb2b76
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:04:06.080402  	-w	P<8>[   20.425955] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-29T02:04:06.083365  ad to last with leading zeros

    2023-06-29T02:04:06.085793  	-s SEP	String separator

    2023-06-29T02:04:06.089732  /lava-10943799/1/../bin/lava-test-case

    2023-06-29T02:04:06.095815  BusyBox v1.31.1 (2023-06-23 08:10:20 UTC) m=
ulti-call binary.

    2023-06-29T02:04:06.095869  =


    2023-06-29T02:04:06.100209  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-29T02:04:06.100424  =


    2023-06-29T02:04:06.105648  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-29T02:04:06.108202  FIRST, INC default to 1.
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+ima       | 3          =


  Details:     https://kernelci.org/test/plan/id/649ce709ca91bc0391bb2a91

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-rk32=
88-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-rk32=
88-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/649ce709ca91bc0391bb2aa7
        new failure (last pass: v6.4-4072-ge8f5f1933319) =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/649ce709ca91bc0391bb2abd
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:06:30.185519  /lava-10943877/1/../bin/lava-test-case<8>[ =
  20.413508] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwmmc_rockchip-sdmmc-prob=
ed RESULT=3Dfail>

    2023-06-29T02:06:30.185587  =


    2023-06-29T02:06:31.200170  /lava-10943877/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/649ce709ca91bc0391bb2abe
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:06:29.161734  /lava-1<8>[   19.387871] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-29T02:06:29.164858  0943877/1/../bin/lava-test-case

    2023-06-29T02:06:29.170666  BusyBox v1.31.1 (2023-06-23 08:10:20 UTC) m=
ulti-call binary.

    2023-06-29T02:06:29.170948  =


    2023-06-29T02:06:29.175424  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-29T02:06:29.175648  =


    2023-06-29T02:06:29.180685  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-29T02:06:29.183037  FIRST, INC default to 1.

    2023-06-29T02:06:29.183295  =


    2023-06-29T02:06:29.186725  	-w	Pad to last with leading zeros
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/649ce794effb99ce18bb2a86

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/649ce794effb99ce18bb2a9c
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:09:07.767059  /lava-10943907/1/../bin/lava-test-case<8>[ =
  21.621738] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-driver-=
present RESULT=3Dpass>

    2023-06-29T02:09:07.767111  =


    2023-06-29T02:09:08.789301  /lava-10943907/1/../bin/lava-test-case<8>[ =
  22.644690] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-grf-pro=
bed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/649ce794effb99ce18bb2ab2
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:09:06.307976  <8>[   20.162945] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>

    2023-06-29T02:09:07.330644  /lava-10943907/1/../bin/lava-test-case<8>[ =
  21.185958] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwmmc_rockchip-sdio0-prob=
ed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/649ce794effb99ce18bb2ab3
        new failure (last pass: v6.4-4072-ge8f5f1933319)

    2023-06-29T02:09:05.284348  	-w	P<8>[   19.138006] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-29T02:09:05.287462  ad to last with leading zeros

    2023-06-29T02:09:05.289831  	-s SEP	String separator

    2023-06-29T02:09:05.293713  /lava-10943907/1/../bin/lava-test-case

    2023-06-29T02:09:05.299760  BusyBox v1.31.1 (2023-06-23 08:10:20 UTC) m=
ulti-call binary.

    2023-06-29T02:09:05.299981  =


    2023-06-29T02:09:05.304365  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-29T02:09:05.304592  =


    2023-06-29T02:09:05.309480  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-29T02:09:05.311959  FIRST, INC default to 1.
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649cea5f498bab1bdbbb2a9c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649cea5f498bab1bdbbb2aa1
        failing since 148 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-29T02:20:07.392129  [   23.526619] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3698431_1.5.2.4.1>
    2023-06-29T02:20:07.497631  =

    2023-06-29T02:20:07.599319  / # #export SHELL=3D/bin/sh
    2023-06-29T02:20:07.599805  =

    2023-06-29T02:20:07.701142  / # export SHELL=3D/bin/sh. /lava-3698431/e=
nvironment
    2023-06-29T02:20:07.701577  =

    2023-06-29T02:20:07.803499  / # . /lava-3698431/environment/lava-369843=
1/bin/lava-test-runner /lava-3698431/1
    2023-06-29T02:20:07.804154  =

    2023-06-29T02:20:07.808013  / # /lava-3698431/bin/lava-test-runner /lav=
a-3698431/1
    2023-06-29T02:20:07.855927  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649cebc7c79e42ab16bb2a90

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649cebc7c79e42ab16bb2a95
        failing since 148 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-29T02:25:54.358693  [   29.564522] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3698559_1.5.2.4.1>
    2023-06-29T02:25:54.464296  =

    2023-06-29T02:25:54.565836  / # #export SHELL=3D/bin/sh
    2023-06-29T02:25:54.566295  =

    2023-06-29T02:25:54.667755  / # export SHELL=3D/bin/sh. /lava-3698559/e=
nvironment
    2023-06-29T02:25:54.668238  =

    2023-06-29T02:25:54.769595  / # . /lava-3698559/environment/lava-369855=
9/bin/lava-test-runner /lava-3698559/1
    2023-06-29T02:25:54.770240  =

    2023-06-29T02:25:54.773673  / # /lava-3698559/bin/lava-test-runner /lav=
a-3698559/1
    2023-06-29T02:25:54.822293  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649cf52b104e782dcabb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-p=
ine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-p=
ine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cf52b104e782dcabb2=
a76
        new failure (last pass: v6.4-1651-gf52dd2890422) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649cfb93c708dbbd2fbb2a78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cfb93c708dbbd2fbb2=
a79
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649cee2b7b8915675cbb2aab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pi=
ne64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pi=
ne64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cee2b7b8915675cbb2=
aac
        new failure (last pass: v6.4-1651-gf52dd2890422) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649cf23dc6f44951abbb2a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649cf23dc6f44951abbb2=
a96
        new failure (last pass: v6.4-rc7-318-gd779731ecfed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649ceb712753f9d1ccbb2ab3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649ceb712753f9d1ccbb2=
ab4
        new failure (last pass: v6.4-1651-gf52dd2890422) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/649ce4e5ef287316f6bb2a8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-4938-g=
5c1c4e99720d8/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649ce4e5ef287316f6bb2a8f
        failing since 147 days (last pass: v6.0-12387-ge54e01f1826aa, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-29T01:56:28.847449  <8>[    9.260721] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3698026_1.5.2.4.1>
    2023-06-29T01:56:28.972284  / # #
    2023-06-29T01:56:29.078207  export SHELL=3D/bin/sh
    2023-06-29T01:56:29.079868  #
    2023-06-29T01:56:29.183331  / # export SHELL=3D/bin/sh. /lava-3698026/e=
nvironment
    2023-06-29T01:56:29.185032  =

    2023-06-29T01:56:29.288637  / # . /lava-3698026/environment/lava-369802=
6/bin/lava-test-runner /lava-3698026/1
    2023-06-29T01:56:29.291547  =

    2023-06-29T01:56:29.307000  / # /lava-3698026/bin/lava-test-runner /lav=
a-3698026/1
    2023-06-29T01:56:29.410844  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
