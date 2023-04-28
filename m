Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08BAE6F2123
	for <lists+linux-next@lfdr.de>; Sat, 29 Apr 2023 01:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346620AbjD1XRh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Apr 2023 19:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346502AbjD1XRg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2023 19:17:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FA544A4
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2023 16:17:32 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1a6670671e3so4550415ad.0
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2023 16:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682723851; x=1685315851;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kmool5o0j/pdJv1G+VjCUWX17C2G1JODl0x0NxdvzkA=;
        b=A/JAedMywbRbM23KNhAoxzjTFVrJnh+/gBrh3FGW4SdxmX2kPoozL4eO0TeiiXOeYY
         +v0zHi5ElUN3fAoRQVmHK0X1Yq03Md6ey/GeWwa4cpRwjaneemDfunEHoEq9w8hz95ku
         6By0gJj7r7e5SveR5cZCeVSpz/OGQ7ssbvj3wOZOdFdIbGkwDBxcDLrXTjeWSTaC9ovb
         6K+TNjU9AGA6YB71Qotx43B2BWgKszLDdrY/2PkW7kHV0N+ZZX4fCvuxCF2rznoaReyx
         eOY52PxN4C/imI63hSj7JbrCm0qwkw11sAfsqDP/y1S+QULApYvjvgYtIt8VxgpuFhQs
         pKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682723851; x=1685315851;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kmool5o0j/pdJv1G+VjCUWX17C2G1JODl0x0NxdvzkA=;
        b=XdMLB9p/uBOAdedPoz2ZrJO/MaUGUCkfbsuSIDGu+96xv77mc7WHNT5u6Ll3UW1zxS
         OKVFLSawaocYaaI7zgnDNADGoiFD0uKuCqBlspWiv/lSttvwQ/+iFHGU9ob1F9mYaf3J
         U7eeQZzYwpt8mdireDzL0/qHKARX1HQVNrpclZzDsFSvbA8QamDWKN7Zx/3+0OiF8Sfe
         7knt2CmNBhrs2f4pepmvCO2veqv9hPa+mjw4x1JHVDIaOjJyo/XEa1wuUe06Tuuoz1BM
         dga7m0YzeJJfX7M4cgRWPpPRDGAzgAi8IZs+kJYnfWIvhPG86I85QzWm13aH93TaDOMr
         1G6w==
X-Gm-Message-State: AC+VfDys+ynCY5qLoYH4gIKXmyqrq9q9M+hTwW+PH9M0tUUaHSkqq9o9
        yXtGCcmZHBQKOb0lD3cIkStqONcRm7/nqqNsbkY=
X-Google-Smtp-Source: ACHHUZ4S709ib0XRPZR11fQwUB38d/wmJnTEwX3maGZQiFlwB01Xn9aR9emL5S2q8XKxW+Lf0iPyhg==
X-Received: by 2002:a17:902:b18f:b0:1a6:386f:39a3 with SMTP id s15-20020a170902b18f00b001a6386f39a3mr6372199plr.31.1682723849554;
        Fri, 28 Apr 2023 16:17:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902748b00b001a810871797sm13728876pll.38.2023.04.28.16.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 16:17:28 -0700 (PDT)
Message-ID: <644c5408.170a0220.91f74.eb1a@mx.google.com>
Date:   Fri, 28 Apr 2023 16:17:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230428
X-Kernelci-Report-Type: test
Subject: next/master baseline: 431 runs, 72 regressions (next-20230428)
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

next/master baseline: 431 runs, 72 regressions (next-20230428)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230428/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230428
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      92e815cf07ed24ee1c51b122f24ffcf2964b4b13 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d8d4eda3d187e2e8644

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d8d4eda3d187e2e8653
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:32.164641  /usr/bin/tpm2_getcap

    2023-04-28T19:24:32.207556  <3>[   12.170680] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:33.250662  <3>[   13.213678] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:34.296521  <3>[   14.259683] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:34.993533  <3>[   14.956686] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:35.342649  <3>[   15.305686] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:36.389500  <3>[   16.351688] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:37.435216  <3>[   17.397685] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:38.481303  <3>[   18.443689] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:39.526709  <3>[   19.489684] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c198c310486a4c82e85e6

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c198c310486a4c82e85f5
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:07:37.094471  /usr/bin/tpm2_getcap

    2023-04-28T19:07:37.119614  <3>[   11.325061] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:38.147596  <3>[   12.353059] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:39.175979  <3>[   13.381058] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:40.204058  <3>[   14.409060] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:40.748050  <3>[   14.953055] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:41.231968  <3>[   15.437063] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:42.259919  <3>[   16.465065] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:43.287915  <3>[   17.493063] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:07:44.316000  <3>[   18.521066] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1edb7e2228afb42e8610

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1edb7e2228afb42e861f
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:30:02.444812  /usr/bin/tpm2_getcap

    2023-04-28T19:30:02.490474  <3>[  101.074889] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:03.536370  <3>[  102.120899] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:04.584310  <3>[  103.168908] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:05.631286  <3>[  104.215909] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:06.679093  <3>[  105.262913] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:07.725189  <3>[  106.309907] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:08.773161  <3>[  107.357909] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:09.545479  <3>[  108.129903] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:30:09.815718  <3>[  108.399872] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1fa6b9c164d6ac2e85ef

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1fa6b9c164d6ac2e85fe
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:33:37.555849  /usr/bin/tpm2_getcap

    2023-04-28T19:33:37.581847  <3>[   11.077044] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:38.610236  <3>[   12.105033] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:39.638249  <3>[   13.133034] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:40.666426  <3>[   14.161037] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:40.946409  <3>[   14.441041] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:41.694833  <3>[   15.189033] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:42.722458  <3>[   16.217034] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:43.750506  <3>[   17.245036] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:44.778255  <3>[   18.273036] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c177dc371a08bab2e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c177dc371a08bab2e860c
        failing since 31 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-28T18:58:55.711702  <8>[   10.705462] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154567_1.4.2.3.1>

    2023-04-28T18:58:55.715139  + set +x

    2023-04-28T18:58:55.819148  / # #

    2023-04-28T18:58:55.919858  export SHELL=3D/bin/sh

    2023-04-28T18:58:55.920093  #

    2023-04-28T18:58:56.020752  / # export SHELL=3D/bin/sh. /lava-10154567/=
environment

    2023-04-28T18:58:56.020953  =


    2023-04-28T18:58:56.121493  / # . /lava-10154567/environment/lava-10154=
567/bin/lava-test-runner /lava-10154567/1

    2023-04-28T18:58:56.121935  =


    2023-04-28T18:58:56.127613  / # /lava-10154567/bin/lava-test-runner /la=
va-10154567/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1eb2b3c58fa45d2e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1eb2b3c58fa45d2e8606
        failing since 28 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-28T19:29:48.799851  + set<8>[   13.331809] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10154842_1.4.2.3.1>

    2023-04-28T19:29:48.800381   +x

    2023-04-28T19:29:48.908408  / # #

    2023-04-28T19:29:49.011075  export SHELL=3D/bin/sh

    2023-04-28T19:29:49.011905  #

    2023-04-28T19:29:49.113786  / # export SHELL=3D/bin/sh. /lava-10154842/=
environment

    2023-04-28T19:29:49.114604  =


    2023-04-28T19:29:49.216205  / # . /lava-10154842/environment/lava-10154=
842/bin/lava-test-runner /lava-10154842/1

    2023-04-28T19:29:49.217810  =


    2023-04-28T19:29:49.223843  / # /lava-10154842/bin/lava-test-runner /la=
va-10154842/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1fa3a2e8aa54532e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1fa3a2e8aa54532e85eb
        failing since 31 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-28T19:33:36.154017  + set +x

    2023-04-28T19:33:36.160537  <8>[    8.040481] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154943_1.4.2.3.1>

    2023-04-28T19:33:36.268670  / # #

    2023-04-28T19:33:36.371508  export SHELL=3D/bin/sh

    2023-04-28T19:33:36.372305  #

    2023-04-28T19:33:36.473766  / # export SHELL=3D/bin/sh. /lava-10154943/=
environment

    2023-04-28T19:33:36.474558  =


    2023-04-28T19:33:36.576164  / # . /lava-10154943/environment/lava-10154=
943/bin/lava-test-runner /lava-10154943/1

    2023-04-28T19:33:36.577448  =


    2023-04-28T19:33:36.583049  / # /lava-10154943/bin/lava-test-runner /la=
va-10154943/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d8d94940c32f02e85e8

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d8d94940c32f02e85eb
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:29.405281  /usr/bin/tpm2_getcap

    2023-04-28T19:24:37.255404  <6>[   24.190727] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-28T19:24:38.291088  <3>[   25.229756] tpm tpm0: Data still avai=
lable

    2023-04-28T19:24:38.298294  <3>[   25.235646] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-28T19:24:39.789734  /lava-10154693/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1781c371a08bab2e8621

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1781c371a08bab2e8626
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T18:58:47.871760  /usr/bin/tpm2_getcap

    2023-04-28T18:58:50.773082  <6>[   15.998070] udevd (120) used greatest=
 stack depth: 13152 bytes left

    2023-04-28T18:58:55.897001  <6>[   21.121015] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-28T18:58:55.903644  <6>[   21.129552] platform MX98357A:00: def=
erred probe pending

    2023-04-28T18:58:56.420533  <3>[   21.647736] tpm tpm0: Data still avai=
lable

    2023-04-28T18:58:56.427272  <3>[   21.653313] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-28T18:58:58.317307  /lava-10154556/1/../bin/lava-test-case

    2023-04-28T18:58:58.328606  <8>[   23.552306] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1e70a384a14ea22e85eb

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1e70a384a14ea22e85ee
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:28:19.616928  /usr/bin/tpm2_getcap

    2023-04-28T19:28:19.732219  <3>[   16.611184] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:20.853037  <3>[   17.732184] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:21.973418  <3>[   18.852184] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:23.094968  <3>[   19.974185] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:24.217106  <3>[   21.096195] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:25.326411  <3>[   22.205193] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:25.645716  <6>[   22.521046] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-28T19:28:25.651794  <6>[   22.529591] platform MX98357A:00: def=
erred probe pending

    2023-04-28T19:28:26.432066  <3>[   23.311197] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1f98c3b83f65952e8662

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1f98c3b83f65952e8665
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:33:11.825504  <8>[   10.252083] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T19:33:11.834274  /usr/bin/tpm2_getcap

    2023-04-28T19:33:11.882836  <3>[   10.313430] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:14.817151  <6>[   13.245529] udevd (118) used greatest=
 stack depth: 13104 bytes left

    2023-04-28T19:33:15.079002  <3>[   13.509424] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:19.623029  <6>[   18.049106] sdhci-pci 0000:00:1b.0: S=
DHCI controller found [8086:5aca] (rev b)

    2023-04-28T19:33:19.628732  <6>[   18.049514] platform MX98357A:00: def=
erred probe pending

    2023-04-28T19:33:22.243409  /lava-10154869/1/../bin/lava-test-case

    2023-04-28T19:33:22.254484  <8>[   20.681903] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d897a6d8d9ef72e8636

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-CM1=
400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d897a6d8d9ef72e8639
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:25.848841  /usr/bin/tpm2_getcap

    2023-04-28T19:24:25.874982  <3>[    7.941197] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:26.902545  <3>[    8.968469] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:27.930242  <3>[    9.996482] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:28.958438  <3>[   11.024466] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:29.985744  <3>[   12.051216] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:31.012377  <3>[   13.078471] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:31.881526  <3>[   13.947200] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:32.040488  <3>[   14.106468] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:33.069556  <3>[   15.135595] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1766e4b3bb69422e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1766e4b3bb69422e8605
        failing since 31 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-28T18:58:29.822324  <8>[   10.079097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154529_1.4.2.3.1>

    2023-04-28T18:58:29.825563  + set +x

    2023-04-28T18:58:29.926980  =


    2023-04-28T18:58:30.027497  / # #export SHELL=3D/bin/sh

    2023-04-28T18:58:30.027712  =


    2023-04-28T18:58:30.128223  / # export SHELL=3D/bin/sh. /lava-10154529/=
environment

    2023-04-28T18:58:30.128438  =


    2023-04-28T18:58:30.229001  / # . /lava-10154529/environment/lava-10154=
529/bin/lava-test-runner /lava-10154529/1

    2023-04-28T18:58:30.229300  =


    2023-04-28T18:58:30.233900  / # /lava-10154529/bin/lava-test-runner /la=
va-10154529/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1e74fccbdfb60b2e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1e74fccbdfb60b2e85f0
        failing since 28 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-28T19:28:37.135216  + set +x

    2023-04-28T19:28:37.141490  <8>[   13.255328] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154816_1.4.2.3.1>

    2023-04-28T19:28:37.245876  / # #

    2023-04-28T19:28:37.346527  export SHELL=3D/bin/sh

    2023-04-28T19:28:37.346721  #

    2023-04-28T19:28:37.447246  / # export SHELL=3D/bin/sh. /lava-10154816/=
environment

    2023-04-28T19:28:37.447442  =


    2023-04-28T19:28:37.547982  / # . /lava-10154816/environment/lava-10154=
816/bin/lava-test-runner /lava-10154816/1

    2023-04-28T19:28:37.548256  =


    2023-04-28T19:28:37.553932  / # /lava-10154816/bin/lava-test-runner /la=
va-10154816/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1fa1c3b83f65952e8692

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1fa1c3b83f65952e8697
        failing since 31 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-28T19:33:32.555907  <8>[   11.404835] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154902_1.4.2.3.1>

    2023-04-28T19:33:32.559582  + set +x

    2023-04-28T19:33:32.665943  =


    2023-04-28T19:33:32.767937  / # #export SHELL=3D/bin/sh

    2023-04-28T19:33:32.768846  =


    2023-04-28T19:33:32.870355  / # export SHELL=3D/bin/sh. /lava-10154902/=
environment

    2023-04-28T19:33:32.871204  =


    2023-04-28T19:33:32.972730  / # . /lava-10154902/environment/lava-10154=
902/bin/lava-test-runner /lava-10154902/1

    2023-04-28T19:33:32.973988  =


    2023-04-28T19:33:32.979655  / # /lava-10154902/bin/lava-test-runner /la=
va-10154902/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d002a0b45ae3c2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1d002a0b45ae3c2e8=
5f3
        new failure (last pass: next-20230427) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d7733cffc70eb2e85e8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644c1d7733cffc7=
0eb2e85ef
        failing since 74 days (last pass: next-20230208, first fail: next-2=
0230213)
        30 lines

    2023-04-28T19:24:25.542640  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-28T19:24:25.544064  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-28T19:24:25.544709  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2f4000 allocated at load_module+0x6b0/0=
x1954
    2023-04-28T19:24:25.546032  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-28T19:24:25.650525  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-28T19:24:25.651555  kern  :emerg : Process udevd (pid: 64, stac=
k limit =3D 0x51643ab7)
    2023-04-28T19:24:25.652061  kern  :emerg : Stack: (0xc88fdcf8 to 0xc88f=
e000)
    2023-04-28T19:24:25.652961  kern  :emerg : dce0:                       =
                                c4d48200 c0777860
    2023-04-28T19:24:25.653440  kern  :emerg : dd00: 00000000 c03b06e0 0000=
0000 c2c19c59 0000005d c2c19c59 c0777860 bf2f4220
    2023-04-28T19:24:25.654153  kern  :emerg : dd20: 00000000 00000000 0000=
0000 00000001 c077785c bf2ce5ac bf2f4220 00000000 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1da121858d95242e860d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1da121858d95242e8610
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:52.022856  /usr/bin/tpm2_getcap

    2023-04-28T19:24:52.052778  <3>[    9.762797] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:53.082287  <3>[   10.791796] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:54.111606  <3>[   11.821798] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:55.140639  <3>[   12.850798] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:56.171314  <3>[   13.880796] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:57.200686  <3>[   14.910798] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:58.230776  <3>[   15.940799] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:59.260140  <3>[   16.969798] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:59.384699  <3>[   17.093809] tpm tpm0: Operation Timed=
 out
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c179cc4e6b8dd052e8657

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c179cc4e6b8dd052e865c
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T18:59:11.831946  est-case

    2023-04-28T18:59:11.835467  /usr/bin/tpm2_getcap

    2023-04-28T18:59:11.865350  <3>[   13.125314] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:12.913051  <3>[   14.172307] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:13.959904  <3>[   15.220306] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:14.990058  <3>[   16.250306] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:15.838006  <3>[   17.098307] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:16.020077  <3>[   17.280307] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:17.050182  <3>[   18.310307] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:59:18.080553  <3>[   19.340307] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1f8cd8bc53f0442e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1f8cd8bc53f0442e85f9
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:32:57.268583  <8>[   13.798568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T19:32:57.279470  /usr/bin/tpm2_getcap

    2023-04-28T19:32:57.324171  <3>[   13.858437] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:32:58.378634  <3>[   14.913427] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:32:59.442366  <3>[   15.976424] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:32:59.668145  <3>[   16.202434] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:00.488330  <3>[   17.022430] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:01.546738  <3>[   18.081444] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:02.598721  <3>[   19.133416] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:03.655612  <3>[   20.190434] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1fbda2e8aa54532e863a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1fbda2e8aa54532e863d
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:33:58.316700  /lava-10154870/1/../bin/lava<8>[   10.01918=
4] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T19:33:58.317182  -test-case

    2023-04-28T19:33:58.320130  /usr/bin/tpm2_getcap

    2023-04-28T19:33:58.357347  <3>[   10.069031] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:59.405610  <3>[   11.117037] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:34:00.454283  <3>[   12.166037] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:34:01.484394  <3>[   13.196029] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:34:02.532775  <3>[   14.244038] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:34:02.826488  <3>[   14.538041] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:34:03.558710  <3>[   15.270028] tpm tpm0: Operation Timed=
 out
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d94688a1b28912e85f1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d94688a1b28912e85f4
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:40.794797  <8>[    9.818840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T19:24:40.800971  /usr/bin/tpm2_getcap

    2023-04-28T19:24:40.840238  <3>[    9.870349] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:41.869247  <3>[   10.899365] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:41.949965  <3>[   10.980351] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:42.894564  <3>[   11.924410] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:43.923910  <3>[   12.953397] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:44.953025  <3>[   13.982394] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:45.979111  <3>[   15.009375] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:47.008275  <3>[   16.037369] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c187f31b75222452e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c187f31b75222452e85f9
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:02:59.495406  <8>[    9.924893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-28T19:02:59.500833  /usr/bin/tpm2_getcap

    2023-04-28T19:02:59.537226  <3>[    9.970769] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:00.568366  <3>[   11.001769] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:01.062791  <3>[   11.495763] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:01.596830  <3>[   12.030770] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:02.626661  <3>[   13.060798] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:03.655976  <3>[   14.088812] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:04.683781  <3>[   15.116790] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:03:05.712801  <3>[   16.145798] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/644c1e92b3c58fa45d2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1e93b3c58fa45d2e85e9
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:29:00.594809  /usr/bin/tpm2_getcap

    2023-04-28T19:29:00.624139  <3>[   13.834604] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:01.676880  <3>[   14.886631] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:02.715538  <3>[   15.925599] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:03.763536  <3>[   16.973607] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:04.812482  <3>[   18.022611] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:05.852219  <3>[   19.062607] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:06.897268  <3>[   20.107563] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:07.940484  <3>[   21.150618] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:29:08.980189  <3>[   22.190617] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/644c1fb2b9c164d6ac2e860d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1fb2b9c164d6ac2e8610
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:33:38.986444  /usr/bin/tpm2_getcap

    2023-04-28T19:33:39.021909  <3>[    9.725640] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:40.051111  <3>[   10.754646] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:40.791677  <3>[   11.495639] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:41.080221  <3>[   11.783639] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:42.109160  <3>[   12.812643] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:43.137802  <3>[   13.841640] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:44.165711  <3>[   14.869683] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:45.194123  <3>[   15.898665] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:46.224989  <3>[   16.928686] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c55a93f0998522e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1c55a93f0998522e85e9
        failing since 77 days (last pass: next-20230209, first fail: next-2=
0230210)

    2023-04-28T19:19:16.332200  + set +x
    2023-04-28T19:19:16.333977  [   29.232879] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1211040_1.5.2.4.1>
    2023-04-28T19:19:16.447602  #
    2023-04-28T19:19:16.549698  / # #export SHELL=3D/bin/sh
    2023-04-28T19:19:16.550156  =

    2023-04-28T19:19:16.651475  / # export SHELL=3D/bin/sh. /lava-1211040/e=
nvironment
    2023-04-28T19:19:16.651942  =

    2023-04-28T19:19:16.753371  / # . /lava-1211040/environment/lava-121104=
0/bin/lava-test-runner /lava-1211040/1
    2023-04-28T19:19:16.754177  =

    2023-04-28T19:19:16.756452  / # /lava-1211040/bin/lava-test-runner /lav=
a-1211040/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d747a6d8d9ef72e85e7

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d747a6d8d9ef72e85f8
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:19.807068  /usr/bin/tpm2_getcap

    2023-04-28T19:24:21.061361  <3>[   13.413340] tpm tpm0: Data still avai=
lable

    2023-04-28T19:24:21.067554  <3>[   13.418448] tpm tpm0: tpm_transmit: t=
pm_recv: error -5

    2023-04-28T19:24:30.203899  /lava-10154703/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c176f337a46d5a52e85e6

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c176f337a46d5a52e85f5
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T18:58:39.205338  /usr/bin/tpm2_getcap

    2023-04-28T18:58:49.414569  /lava-10154570/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1e6622cf0ce4542e861a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1e6622cf0ce4542e8629
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:28:14.232177  /usr/bin/tpm2_getcap

    2023-04-28T19:28:24.655450  /lava-10154841/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1f8e3ce0a370da2e8631

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1f8e3ce0a370da2e8640
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:33:16.738827  /usr/bin/tpm2_getcap

    2023-04-28T19:33:16.761347  <3>[   11.456292] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:17.789436  <3>[   12.484290] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:18.817417  <3>[   13.512294] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:19.844557  <3>[   14.539293] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:20.257576  <3>[   14.952295] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:20.872542  <3>[   15.567293] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:21.900450  <3>[   16.595296] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:22.928610  <3>[   17.623295] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:23.956330  <3>[   18.651298] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d6b8ed58532102e85ff

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d6b8ed58532102e860e
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:07.212823  /usr/bin/tpm2_getcap

    2023-04-28T19:24:07.255678  <3>[   11.639992] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:08.300277  <3>[   12.684989] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:09.346046  <3>[   13.730997] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:10.054310  <3>[   14.438998] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:10.392164  <3>[   14.776992] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:11.437025  <3>[   15.821992] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:12.481388  <3>[   16.865993] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:13.532171  <3>[   17.916991] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:14.576373  <3>[   18.960993] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c176ee4b3bb69422e8613

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c176ee4b3bb69422e8622
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T18:58:36.241604  /usr/bin/tpm2_getcap

    2023-04-28T18:58:36.266595  <3>[    8.790298] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:37.295086  <3>[    9.818289] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:38.322917  <3>[   10.846288] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:39.350865  <3>[   11.874296] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:40.378477  <3>[   12.902288] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:41.407014  <3>[   13.930290] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:41.916318  <3>[   14.440294] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:42.429729  <3>[   14.953295] tpm tpm0: Operation Timed=
 out

    2023-04-28T18:58:43.456501  <3>[   15.980291] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/644c1e61a02b9874f02e8600

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1e61a02b9874f02e860f
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:28:11.060648  /usr/bin/tpm2_getcap

    2023-04-28T19:28:11.104541  <3>[   14.871089] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:12.152600  <3>[   15.918096] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:12.182072  <3>[   15.948089] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:13.199302  <3>[   16.965095] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:14.245608  <3>[   18.013089] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:15.292499  <3>[   19.060089] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:16.339981  <3>[   20.106089] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:17.386583  <3>[   21.153089] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:28:18.432580  <3>[   22.199092] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/644c1f8ec3b83f65952e8612

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1f8ec3b83f65952e8623
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:33:10.916823  /usr/bin/tpm2_getcap

    2023-04-28T19:33:10.939653  <3>[   10.492283] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:11.968696  <3>[   11.519282] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:12.996087  <3>[   12.547287] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:14.024862  <3>[   13.575290] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:14.889119  <3>[   14.439285] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:15.047922  <3>[   14.598290] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:16.074256  <3>[   15.626290] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:17.103242  <3>[   16.654283] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:33:18.131591  <3>[   17.682285] tpm tpm0: Operation Timed=
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


  Details:     https://kernelci.org/test/plan/id/644c18476d305066992e8627

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c18476d305066992e862c
        failing since 31 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-28T19:02:17.723256  + set +x

    2023-04-28T19:02:17.729913  <8>[   10.263283] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154573_1.4.2.3.1>

    2023-04-28T19:02:17.837990  / # #

    2023-04-28T19:02:17.940085  export SHELL=3D/bin/sh

    2023-04-28T19:02:17.940801  #

    2023-04-28T19:02:18.042179  / # export SHELL=3D/bin/sh. /lava-10154573/=
environment

    2023-04-28T19:02:18.042894  =


    2023-04-28T19:02:18.144193  / # . /lava-10154573/environment/lava-10154=
573/bin/lava-test-runner /lava-10154573/1

    2023-04-28T19:02:18.145298  =


    2023-04-28T19:02:18.149914  / # /lava-10154573/bin/lava-test-runner /la=
va-10154573/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1e76d9463e28f52e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1e76d9463e28f52e85fa
        failing since 28 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-28T19:28:29.765157  + set +x

    2023-04-28T19:28:29.771931  <8>[   15.326386] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154829_1.4.2.3.1>

    2023-04-28T19:28:29.881748  / # #

    2023-04-28T19:28:29.983804  export SHELL=3D/bin/sh

    2023-04-28T19:28:29.984483  #

    2023-04-28T19:28:30.085830  / # export SHELL=3D/bin/sh. /lava-10154829/=
environment

    2023-04-28T19:28:30.086581  =


    2023-04-28T19:28:30.188195  / # . /lava-10154829/environment/lava-10154=
829/bin/lava-test-runner /lava-10154829/1

    2023-04-28T19:28:30.189400  =


    2023-04-28T19:28:30.194453  / # /lava-10154829/bin/lava-test-runner /la=
va-10154829/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1f9cc3b83f65952e867c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1f9cc3b83f65952e8681
        failing since 31 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-28T19:33:34.502017  + set +x

    2023-04-28T19:33:34.508753  <8>[   10.340265] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154868_1.4.2.3.1>

    2023-04-28T19:33:34.616443  / # #

    2023-04-28T19:33:34.719090  export SHELL=3D/bin/sh

    2023-04-28T19:33:34.719742  #

    2023-04-28T19:33:34.820947  / # export SHELL=3D/bin/sh. /lava-10154868/=
environment

    2023-04-28T19:33:34.821587  =


    2023-04-28T19:33:34.922994  / # . /lava-10154868/environment/lava-10154=
868/bin/lava-test-runner /lava-10154868/1

    2023-04-28T19:33:34.924125  =


    2023-04-28T19:33:34.928415  / # /lava-10154868/bin/lava-test-runner /la=
va-10154868/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644c18366d305066992e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c18366d305066992e860c
        failing since 31 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-28T19:01:55.006906  + set +x

    2023-04-28T19:01:55.013355  <8>[   10.113700] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154546_1.4.2.3.1>

    2023-04-28T19:01:55.120454  / # #

    2023-04-28T19:01:55.221326  export SHELL=3D/bin/sh

    2023-04-28T19:01:55.222044  #

    2023-04-28T19:01:55.323580  / # export SHELL=3D/bin/sh. /lava-10154546/=
environment

    2023-04-28T19:01:55.324395  =


    2023-04-28T19:01:55.425824  / # . /lava-10154546/environment/lava-10154=
546/bin/lava-test-runner /lava-10154546/1

    2023-04-28T19:01:55.427448  =


    2023-04-28T19:01:55.432515  / # /lava-10154546/bin/lava-test-runner /la=
va-10154546/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1e6222cf0ce4542e860f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1e6222cf0ce4542e8614
        failing since 28 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-28T19:28:15.158776  + set<8>[   14.353889] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10154819_1.4.2.3.1>

    2023-04-28T19:28:15.158862   +x

    2023-04-28T19:28:15.263104  / # #

    2023-04-28T19:28:15.363854  export SHELL=3D/bin/sh

    2023-04-28T19:28:15.364632  #

    2023-04-28T19:28:15.465895  / # export SHELL=3D/bin/sh. /lava-10154819/=
environment

    2023-04-28T19:28:15.466568  =


    2023-04-28T19:28:15.567820  / # . /lava-10154819/environment/lava-10154=
819/bin/lava-test-runner /lava-10154819/1

    2023-04-28T19:28:15.568125  =


    2023-04-28T19:28:15.573158  / # /lava-10154819/bin/lava-test-runner /la=
va-10154819/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1f90c3b83f65952e8640

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1f90c3b83f65952e8645
        failing since 31 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-28T19:33:24.366454  <8>[   10.643245] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154940_1.4.2.3.1>

    2023-04-28T19:33:24.369713  + set +x

    2023-04-28T19:33:24.474950  #

    2023-04-28T19:33:24.476075  =


    2023-04-28T19:33:24.577742  / # #export SHELL=3D/bin/sh

    2023-04-28T19:33:24.578590  =


    2023-04-28T19:33:24.679972  / # export SHELL=3D/bin/sh. /lava-10154940/=
environment

    2023-04-28T19:33:24.680735  =


    2023-04-28T19:33:24.782088  / # . /lava-10154940/environment/lava-10154=
940/bin/lava-test-runner /lava-10154940/1

    2023-04-28T19:33:24.783314  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d8f0043d5672e2e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d8f0043d5672e2e85fa
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:36.868401  /usr/bin/tpm2_getcap

    2023-04-28T19:24:36.894764  <3>[   10.464381] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:37.921909  <3>[   11.491651] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:38.949731  <3>[   12.519663] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:39.840246  <3>[   13.410663] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:39.977921  <3>[   13.547655] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:41.005294  <3>[   14.575657] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:42.036078  <3>[   15.605646] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:43.065371  <3>[   16.634404] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:44.091662  <3>[   17.661660] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1cc06b8f6586632e860f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1cc06b8f6586632e8614
        new failure (last pass: next-20230427)

    2023-04-28T19:21:13.419124  + set[   15.091934] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 940471_1.5.2.3.1>
    2023-04-28T19:21:13.419360   +x
    2023-04-28T19:21:13.525243  / # #
    2023-04-28T19:21:13.626884  export SHELL=3D/bin/sh
    2023-04-28T19:21:13.627493  #
    2023-04-28T19:21:13.728898  / # export SHELL=3D/bin/sh. /lava-940471/en=
vironment
    2023-04-28T19:21:13.729321  =

    2023-04-28T19:21:13.830495  / # . /lava-940471/environment/lava-940471/=
bin/lava-test-runner /lava-940471/1
    2023-04-28T19:21:13.831024  =

    2023-04-28T19:21:13.834568  / # /lava-940471/bin/lava-test-runner /lava=
-940471/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c149d22c8f4c0632e8606

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c149d22c8f4c0632e860b
        failing since 8 days (last pass: next-20230417, first fail: next-20=
230419)

    2023-04-28T18:46:29.156885  <8>[   19.962878] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541664_1.5.2.4.1>
    2023-04-28T18:46:29.272024  / # #
    2023-04-28T18:46:29.376382  export SHELL=3D/bin/sh
    2023-04-28T18:46:29.377422  #
    2023-04-28T18:46:29.479571  / # export SHELL=3D/bin/sh. /lava-3541664/e=
nvironment
    2023-04-28T18:46:29.480632  =

    2023-04-28T18:46:29.582513  / # . /lava-3541664/environment/lava-354166=
4/bin/lava-test-runner /lava-3541664/1
    2023-04-28T18:46:29.583111  =

    2023-04-28T18:46:29.603417  / # /lava-3541664/bin/lava-test-runner /lav=
a-3541664/1
    2023-04-28T18:46:29.650255  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c145353cea9e10f2e864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c145353cea9e10f2e8=
64d
        failing since 8 days (last pass: next-20230417, first fail: next-20=
230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1d7a7a6d8d9ef72e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44c1d7a7a6d8d9ef72e8609
        failing since 4 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-28T19:24:27.761835  /usr/bin/tpm2_getcap

    2023-04-28T19:24:27.787556  <3>[   10.093078] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:28.814619  <3>[   11.120518] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:29.032374  <3>[   11.338125] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:29.841442  <3>[   12.147110] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:30.867461  <3>[   13.173078] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:31.896031  <3>[   14.201507] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:32.922908  <3>[   15.228115] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:33.951551  <3>[   16.256351] tpm tpm0: Operation Timed=
 out

    2023-04-28T19:24:34.978166  <3>[   17.283358] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c14b89b2512addd2e867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c14b89b2512addd2e8=
67e
        failing since 8 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1ccc5c0ce6cfaa2e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1ccc5c0ce6cfaa2e8=
5eb
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1cd145c4043f262e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1cd145c4043f262e8=
5eb
        failing since 93 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1da5a2301139a72e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1da5a2301139a72e8=
5f3
        failing since 93 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c722a2e018a322e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c722a2e018a322e8=
610
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c5f701a7ca4012e860e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c5f701a7ca4012e8=
60f
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c74a08b6076db2e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c74a08b6076db2e8=
5ef
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1cda5c0ce6cfaa2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1cda5c0ce6cfaa2e8=
5f0
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c762533eba9322e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c762533eba9322e8=
610
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c25082126b6cd112e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c25082126b6cd112e8=
5ec
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1af1e193c041c52e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1af1e193c041c52e8=
5f6
        new failure (last pass: next-20230427) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1a32ade85394702e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1a32ade85394702e8=
5f3
        failing since 157 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c192e6568fa87a92e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c192e6568fa87a92e8=
5f0
        failing since 157 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/644c1466524f6505112e8605

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-rk3399-=
roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/baseline-rk3399-=
roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644c1466524f650=
5112e860c
        failing since 16 days (last pass: next-20230406, first fail: next-2=
0230412)
        2 lines

    2023-04-28T18:45:41.604056  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-04-28T18:45:41.605379  kern  :emerg : Code: 97f0ae87 f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-04-28T18:45:41.615765  <8>[   19.342920] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-28T18:45:41.616131  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644c1466524f650=
5112e860d
        failing since 16 days (last pass: next-20230406, first fail: next-2=
0230412)
        12 lines

    2023-04-28T18:45:41.579307  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-28T18:45:41.580368  kern  :alert : Mem abort info:
    2023-04-28T18:45:41.580737  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-28T18:45:41.581745  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-28T18:45:41.583275  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-28T18:45:41.583648  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-28T18:45:41.584673  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-28T18:45:41.585850  kern  :alert : Data abort info:
    2023-04-28T18:45:41.586213  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-28T18:45:41.587444  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c74bc4a456d6f2e8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c74bc4a456d6f2e8=
656
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/644c148ec7b7b43e212e8677

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644c148ec7b7b43=
e212e867e
        failing since 14 days (last pass: next-20230406, first fail: v6.3-r=
c6-12018-gd3f2cd248191)
        2 lines

    2023-04-28T18:46:15.137224  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-28T18:46:15.137815  kern  :emerg : Code: 97d6ee87 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-28T18:46:15.138173  <8>[   23.036328] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-28T18:46:15.138504  + set +x

    2023-04-28T18:46:15.138821  <8>[   23.037927] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10154388_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644c148ec7b7b43=
e212e867f
        failing since 14 days (last pass: next-20230406, first fail: v6.3-r=
c6-12018-gd3f2cd248191)
        12 lines

    2023-04-28T18:46:15.089090  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-28T18:46:15.089690  kern  :alert : Mem abort info:

    2023-04-28T18:46:15.090061  kern  :alert :   ESR =3D 0x0000000096000007

    2023-04-28T18:46:15.090387  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-28T18:46:15.090706  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-28T18:46:15.091017  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-28T18:46:15.091319  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-04-28T18:46:15.091616  kern  :alert : Data abort info:

    2023-04-28T18:46:15.091905  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-28T18:46:15.092195  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c893086bde9f42e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c893086bde9f42e8=
5ff
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1cb6411ec0ad7c2e85ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644c1cb6411ec0ad7c2e85f3
        failing since 86 days (last pass: next-20221012, first fail: next-2=
0230201)

    2023-04-28T19:21:09.066361  <8>[   13.765435] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3541840_1.5.2.4.1>
    2023-04-28T19:21:09.172165  / # #
    2023-04-28T19:21:09.273902  export SHELL=3D/bin/sh
    2023-04-28T19:21:09.274332  #
    2023-04-28T19:21:09.375699  / # export SHELL=3D/bin/sh. /lava-3541840/e=
nvironment
    2023-04-28T19:21:09.376088  =

    2023-04-28T19:21:09.477504  / # . /lava-3541840/environment/lava-354184=
0/bin/lava-test-runner /lava-3541840/1
    2023-04-28T19:21:09.478181  =

    2023-04-28T19:21:09.482409  / # /lava-3541840/bin/lava-test-runner /lav=
a-3541840/1
    2023-04-28T19:21:09.557349  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1696a0014fd1442e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1696a0014fd1442e8=
605
        failing since 10 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c5fbc4a456d6f2e8611

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c5fbc4a456d6f2e8=
612
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1567060ab6b2502e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1567060ab6b2502e8=
5e7
        new failure (last pass: next-20230224) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c78a93f0998522e8611

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c78a93f0998522e8=
612
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1c612533eba9322e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1c612533eba9322e8=
5fd
        failing since 80 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1dc767db9f92a22e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1dc767db9f92a22e8=
5ed
        new failure (last pass: next-20230427) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644c1a9363b5bcce742e862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230428/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230428/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644c1a9363b5bcce742e8=
630
        failing since 1 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230426) =

 =20
