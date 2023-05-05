Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8916F896A
	for <lists+linux-next@lfdr.de>; Fri,  5 May 2023 21:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjEETSl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 May 2023 15:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbjEETSi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 May 2023 15:18:38 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD40E73
        for <linux-next@vger.kernel.org>; Fri,  5 May 2023 12:18:34 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-643465067d1so1715198b3a.0
        for <linux-next@vger.kernel.org>; Fri, 05 May 2023 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683314313; x=1685906313;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ4Y1SKXLBHsn9m9uf2PGNg0S96OiDhwDcErJG+aNcc=;
        b=eghSn4THMzHqw0SMDMeWi4IfsPFn2pSyMpGdqZ8tfWLHPuQ3uNHxG16SucIPP9ntc5
         8GwQ41blJNh31sIk1g2kahmm87/OJ9zlwx4CoIZtJ0YeBiiszHc10E35j7alCVKjJhnp
         mTGgr5B/uWQBemEhURgWq/GmgIhcW7YCXPJkTsc2OqoK6Ow+wrviTkG3I+weL1/F+hHl
         +4/kHWvC1Lk0sab6AyDCcm8rd6BWpfEPtuXa8DCtBqsNNSnSmnAWGmcIc2z9uxUgPx39
         80003mAOCchmmoiLcecZzIqFX+X5Rk9DpKhqblEk5+fJSZO1XG+6ugT+VBHJWTekEFbD
         LYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683314313; x=1685906313;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ4Y1SKXLBHsn9m9uf2PGNg0S96OiDhwDcErJG+aNcc=;
        b=d7PJA4ATchE0XHIXkNTqbIFqHnLEuMWSTDeRBBpXQLTqvsS5DcdwRH3iSjdSDdtj9B
         f0jP+KDByhVFChzK9/DXa1y9M+V3XGUfHZ27hSj79NEtDnKcVyQt5cAiWOj8JxMkerEm
         2w2Btv8uDTgNDDTMYKWMSDozMlr0tNg+L5vwOGAT0+7lzQMHvFOIe2SifqybTX799kyi
         nn1EgBbplILYnEgaYDZ4f4cpyqtsaSa44jdKX72gXkiaxydXRwuVYInGaDQMHMC+qt1L
         eLmwlIDO4lWhPWNOoBpgXHlf+2bix+cnaUXpc4rFbms3s2U+AqmaWjKcjFPbt0JCxHrg
         +F0w==
X-Gm-Message-State: AC+VfDzremDmMhPEEaeur5jL8X0AY8/udnF/mPPNnaBswEG0m90Czw3S
        qLnqpfQRSBcxaIZwbAKpflQuTqNkFK67CJ7TJlLLGA==
X-Google-Smtp-Source: ACHHUZ7cVapzqqXJFeLCZv4zDlw+vUSKJWCe8bphXMP9FWJtSjEFiNtT8LFSUrXaQdzWRwWVZDqGQA==
X-Received: by 2002:aa7:88c4:0:b0:643:958e:f75 with SMTP id k4-20020aa788c4000000b00643958e0f75mr3674743pff.31.1683314312414;
        Fri, 05 May 2023 12:18:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7800d000000b0063f00898245sm2008397pfi.146.2023.05.05.12.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:18:31 -0700 (PDT)
Message-ID: <64555687.a70a0220.cae76.4116@mx.google.com>
Date:   Fri, 05 May 2023 12:18:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230505
X-Kernelci-Report-Type: test
Subject: next/master baseline: 615 runs, 74 regressions (next-20230505)
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

next/master baseline: 615 runs, 74 regressions (next-20230505)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 31         =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

odroid-xu3                   | arm    | lab-collabora | gcc-10   | exynos_d=
efconfig             | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =

r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 2          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230505/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230505
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      83e5775d7afda68f6d7576d21f7a080fbfeecc4f =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6455190c605e8de7692e862e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6455190c605e8de7692e8633
        failing since 37 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-05T14:55:56.457633  + set +x

    2023-05-05T14:55:56.463815  <8>[   10.590457] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207294_1.4.2.3.1>

    2023-05-05T14:55:56.565620  #

    2023-05-05T14:55:56.565913  =


    2023-05-05T14:55:56.666513  / # #export SHELL=3D/bin/sh

    2023-05-05T14:55:56.666741  =


    2023-05-05T14:55:56.767309  / # export SHELL=3D/bin/sh. /lava-10207294/=
environment

    2023-05-05T14:55:56.767545  =


    2023-05-05T14:55:56.868105  / # . /lava-10207294/environment/lava-10207=
294/bin/lava-test-runner /lava-10207294/1

    2023-05-05T14:55:56.868436  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551e9ae64231e9622e8666

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551e9ae64231e9622e866b
        failing since 37 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-05T15:19:38.253757  + set +x

    2023-05-05T15:19:38.260195  <8>[    7.883320] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207797_1.4.2.3.1>

    2023-05-05T15:19:38.364497  / # #

    2023-05-05T15:19:38.465114  export SHELL=3D/bin/sh

    2023-05-05T15:19:38.465296  #

    2023-05-05T15:19:38.565810  / # export SHELL=3D/bin/sh. /lava-10207797/=
environment

    2023-05-05T15:19:38.565995  =


    2023-05-05T15:19:38.666528  / # . /lava-10207797/environment/lava-10207=
797/bin/lava-test-runner /lava-10207797/1

    2023-05-05T15:19:38.666839  =


    2023-05-05T15:19:38.672748  / # /lava-10207797/bin/lava-test-runner /la=
va-10207797/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551f843f461ea09a2e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551f843f461ea09a2e8601
        failing since 35 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-05T15:23:33.199713  + set +x

    2023-05-05T15:23:33.206397  <8>[   13.878306] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10208040_1.4.2.3.1>

    2023-05-05T15:23:33.314095  / # #

    2023-05-05T15:23:33.416559  export SHELL=3D/bin/sh

    2023-05-05T15:23:33.417251  #

    2023-05-05T15:23:33.518636  / # export SHELL=3D/bin/sh. /lava-10208040/=
environment

    2023-05-05T15:23:33.519330  =


    2023-05-05T15:23:33.620734  / # . /lava-10208040/environment/lava-10208=
040/bin/lava-test-runner /lava-10208040/1

    2023-05-05T15:23:33.622064  =


    2023-05-05T15:23:33.627561  / # /lava-10208040/bin/lava-test-runner /la=
va-10208040/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64551914605e8de7692e865a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551914605e8de7692e865f
        failing since 37 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-05T14:56:00.008534  <8>[   10.181844] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207274_1.4.2.3.1>

    2023-05-05T14:56:00.012143  + set +x

    2023-05-05T14:56:00.113427  #

    2023-05-05T14:56:00.113650  =


    2023-05-05T14:56:00.214349  / # #export SHELL=3D/bin/sh

    2023-05-05T14:56:00.215045  =


    2023-05-05T14:56:00.316585  / # export SHELL=3D/bin/sh. /lava-10207274/=
environment

    2023-05-05T14:56:00.317351  =


    2023-05-05T14:56:00.418676  / # . /lava-10207274/environment/lava-10207=
274/bin/lava-test-runner /lava-10207274/1

    2023-05-05T14:56:00.419501  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551e0a790e5ff0bd2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551e0a790e5ff0bd2e85eb
        failing since 37 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-05T15:17:02.843841  <8>[   10.895480] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207779_1.4.2.3.1>

    2023-05-05T15:17:02.847813  + set +x

    2023-05-05T15:17:02.951588  / # #

    2023-05-05T15:17:03.052319  export SHELL=3D/bin/sh

    2023-05-05T15:17:03.052521  #

    2023-05-05T15:17:03.153083  / # export SHELL=3D/bin/sh. /lava-10207779/=
environment

    2023-05-05T15:17:03.153333  =


    2023-05-05T15:17:03.253873  / # . /lava-10207779/environment/lava-10207=
779/bin/lava-test-runner /lava-10207779/1

    2023-05-05T15:17:03.254203  =


    2023-05-05T15:17:03.259100  / # /lava-10207779/bin/lava-test-runner /la=
va-10207779/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551f8a698408944c2e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551f8b698408944c2e861b
        failing since 35 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-05T15:23:38.231646  <8>[   12.342876] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10208065_1.4.2.3.1>

    2023-05-05T15:23:38.234778  + set +x

    2023-05-05T15:23:38.336269  #

    2023-05-05T15:23:38.336535  =


    2023-05-05T15:23:38.437169  / # #export SHELL=3D/bin/sh

    2023-05-05T15:23:38.437335  =


    2023-05-05T15:23:38.537823  / # export SHELL=3D/bin/sh. /lava-10208065/=
environment

    2023-05-05T15:23:38.538010  =


    2023-05-05T15:23:38.638526  / # . /lava-10208065/environment/lava-10208=
065/bin/lava-test-runner /lava-10208065/1

    2023-05-05T15:23:38.638836  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64551c5ce4cce236da2e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551c5ce4cce236da2e8=
627
        failing since 93 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64551f39e20a73fc762e860e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551f39e20a73fc762e8=
60f
        failing since 37 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64551eedfe694398a72e8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551eedfe694398a72e8=
651
        failing since 35 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64551954962a4418422e8621

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551954962a4418422e8626
        failing since 37 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-05T14:57:01.445560  + set<8>[   10.672062] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10207293_1.4.2.3.1>

    2023-05-05T14:57:01.445648   +x

    2023-05-05T14:57:01.549895  / # #

    2023-05-05T14:57:01.650514  export SHELL=3D/bin/sh

    2023-05-05T14:57:01.650707  #

    2023-05-05T14:57:01.751223  / # export SHELL=3D/bin/sh. /lava-10207293/=
environment

    2023-05-05T14:57:01.751547  =


    2023-05-05T14:57:01.852374  / # . /lava-10207293/environment/lava-10207=
293/bin/lava-test-runner /lava-10207293/1

    2023-05-05T14:57:01.853570  =


    2023-05-05T14:57:01.858163  / # /lava-10207293/bin/lava-test-runner /la=
va-10207293/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551e5a77bf40bfd62e85fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551e5a77bf40bfd62e8602
        failing since 37 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-05T15:18:33.147115  + set +x

    2023-05-05T15:18:33.153658  <8>[   11.953616] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207800_1.4.2.3.1>

    2023-05-05T15:18:33.257958  / # #

    2023-05-05T15:18:33.358779  export SHELL=3D/bin/sh

    2023-05-05T15:18:33.358972  #

    2023-05-05T15:18:33.459525  / # export SHELL=3D/bin/sh. /lava-10207800/=
environment

    2023-05-05T15:18:33.459739  =


    2023-05-05T15:18:33.560262  / # . /lava-10207800/environment/lava-10207=
800/bin/lava-test-runner /lava-10207800/1

    2023-05-05T15:18:33.560595  =


    2023-05-05T15:18:33.564763  / # /lava-10207800/bin/lava-test-runner /la=
va-10207800/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551f97b3046b31c62e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551f97b3046b31c62e85eb
        failing since 35 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-05T15:23:45.431243  + set +x

    2023-05-05T15:23:45.437752  <8>[   16.279765] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10208032_1.4.2.3.1>

    2023-05-05T15:23:45.547481  / # #

    2023-05-05T15:23:45.649484  export SHELL=3D/bin/sh

    2023-05-05T15:23:45.649758  #

    2023-05-05T15:23:45.750557  / # export SHELL=3D/bin/sh. /lava-10208032/=
environment

    2023-05-05T15:23:45.751240  =


    2023-05-05T15:23:45.852639  / # . /lava-10208032/environment/lava-10208=
032/bin/lava-test-runner /lava-10208032/1

    2023-05-05T15:23:45.853744  =


    2023-05-05T15:23:45.858493  / # /lava-10208032/bin/lava-test-runner /la=
va-10208032/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645518f5c6f0ae9ba42e861d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645518f5c6f0ae9ba42e8622
        failing since 37 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-05T14:55:35.217876  + set +x

    2023-05-05T14:55:35.224164  <8>[   10.798534] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207297_1.4.2.3.1>

    2023-05-05T14:55:35.331821  / # #

    2023-05-05T14:55:35.434454  export SHELL=3D/bin/sh

    2023-05-05T14:55:35.435157  #

    2023-05-05T14:55:35.536654  / # export SHELL=3D/bin/sh. /lava-10207297/=
environment

    2023-05-05T14:55:35.537564  =


    2023-05-05T14:55:35.639205  / # . /lava-10207297/environment/lava-10207=
297/bin/lava-test-runner /lava-10207297/1

    2023-05-05T14:55:35.640504  =


    2023-05-05T14:55:35.645872  / # /lava-10207297/bin/lava-test-runner /la=
va-10207297/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64551df04fd54f9a742e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551df04fd54f9a742e85ed
        failing since 37 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-05T15:16:52.210553  <8>[   10.237092] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207790_1.4.2.3.1>

    2023-05-05T15:16:52.213589  + set +x

    2023-05-05T15:16:52.318442  / # #

    2023-05-05T15:16:52.419272  export SHELL=3D/bin/sh

    2023-05-05T15:16:52.419558  #

    2023-05-05T15:16:52.520197  / # export SHELL=3D/bin/sh. /lava-10207790/=
environment

    2023-05-05T15:16:52.520533  =


    2023-05-05T15:16:52.621203  / # . /lava-10207790/environment/lava-10207=
790/bin/lava-test-runner /lava-10207790/1

    2023-05-05T15:16:52.621480  =


    2023-05-05T15:16:52.626378  / # /lava-10207790/bin/lava-test-runner /la=
va-10207790/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64551f7242d89a10d92e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551f7242d89a10d92e8620
        failing since 35 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-05T15:23:13.557716  + <8>[   15.394233] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10208015_1.4.2.3.1>

    2023-05-05T15:23:13.557800  set +x

    2023-05-05T15:23:13.659343  =


    2023-05-05T15:23:13.759915  / # #export SHELL=3D/bin/sh

    2023-05-05T15:23:13.760199  =


    2023-05-05T15:23:13.860677  / # export SHELL=3D/bin/sh. /lava-10208015/=
environment

    2023-05-05T15:23:13.860865  =


    2023-05-05T15:23:13.961353  / # . /lava-10208015/environment/lava-10208=
015/bin/lava-test-runner /lava-10208015/1

    2023-05-05T15:23:13.961628  =


    2023-05-05T15:23:13.966820  / # /lava-10208015/bin/lava-test-runner /la=
va-10208015/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6455211b6ec61572e72e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6455211b6ec61572e72e8=
61c
        failing since 15 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6455233957ef2866552e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6455233957ef2866552e8=
5f6
        failing since 98 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64552340ffd606ae7f2e864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552340ffd606ae7f2e8=
64d
        failing since 101 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64552070228a64d6b62e86a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552070228a64d6b62e8=
6a8
        failing since 35 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 31         =


  Details:     https://kernelci.org/test/plan/id/64552275e24204df0b2e85e6

  Results:     140 PASS, 45 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mt8192-audio-probed: https://kernelci.org/test/case/id/=
64552275e24204df0b2e85f9
        new failure (last pass: next-20230411)

    2023-05-05T15:36:07.846225  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:36:07.852404  <8>[   50.707203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt8192-audio-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-vcodec-enc-probed: https://kernelci.org/test/case/i=
d/64552275e24204df0b2e8601
        new failure (last pass: next-20230411)

    2023-05-05T15:36:03.667910  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:36:03.674294  <8>[   46.529208] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-vcodec-enc-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-gamma-probed: https://kernelci.org/test/c=
ase/id/64552275e24204df0b2e861a
        new failure (last pass: next-20230411)

    2023-05-05T15:35:59.192291  /lava-10208223/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-color-probed: https://kernelci.org/test/c=
ase/id/64552275e24204df0b2e861c
        new failure (last pass: next-20230411)

    2023-05-05T15:35:58.150089  /lava-10208223/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-ovl2l0-probed: https://kernelci.org/test/=
case/id/64552275e24204df0b2e861d
        new failure (last pass: next-20230411)

    2023-05-05T15:35:51.932356  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:51.944473  <8>[   34.795719] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl0-probed: https://kernelci.org/test/ca=
se/id/64552275e24204df0b2e861e
        new failure (last pass: next-20230411)

    2023-05-05T15:35:49.898487  <8>[   32.747599] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl-driver-present RESULT=3Dpass>

    2023-05-05T15:35:50.912303  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:50.918905  <8>[   33.771033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mutex-probed: https://kernelci.org/test/case/i=
d/64552275e24204df0b2e8620
        new failure (last pass: next-20230411)

    2023-05-05T15:35:49.144960  <6>[   32.002451] Vgpu: disabling

    2023-05-05T15:35:49.155003  <6>[   32.009180] pp3300_mipibrdg: disabling

    2023-05-05T15:35:49.158497  <6>[   32.013222] pp3300_dpbrdg: disabling

    2023-05-05T15:35:49.870669  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:49.877486  <8>[   32.729664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mutex-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ccorr-probed: https://kernelci.org/test/c=
ase/id/64552275e24204df0b2e862b
        new failure (last pass: next-20230411)

    2023-05-05T15:35:57.108121  /lava-10208223/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-aal-probed: https://kernelci.org/test/cas=
e/id/64552275e24204df0b2e862d
        new failure (last pass: next-20230411)

    2023-05-05T15:35:56.066499  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:56.073512  <8>[   38.925967] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-aal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma4-probed: https://kernelci.org/test/c=
ase/id/64552275e24204df0b2e862f
        new failure (last pass: next-20230411)

    2023-05-05T15:35:55.025436  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:55.032493  <8>[   37.884861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma0-probed: https://kernelci.org/test/c=
ase/id/64552275e24204df0b2e8630
        new failure (last pass: next-20230411)

    2023-05-05T15:35:54.003130  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:54.010061  <8>[   36.862554] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l2-probed: https://kernelci.org/test/=
case/id/64552275e24204df0b2e8632
        new failure (last pass: next-20230411)

    2023-05-05T15:35:52.960167  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:52.966462  <8>[   35.819505] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/64552=
275e24204df0b2e8634
        new failure (last pass: next-20230411)

    2023-05-05T15:35:46.655658  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:46.662609  <8>[   29.514329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-iommu-probed: https://kernelci.org/test/case/id/645=
52276e24204df0b2e864b
        new failure (last pass: next-20230411)

    2023-05-05T15:35:45.227508  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:45.234383  <8>[   28.085800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-iommu-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb18-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e864d
        new failure (last pass: next-20230411)

    2023-05-05T15:35:44.187631  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:44.194530  <8>[   27.045963] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb18-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb13-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e864e
        new failure (last pass: next-20230411)

    2023-05-05T15:35:43.164800  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:43.171813  <8>[   26.023216] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb13-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb11-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e864f
        new failure (last pass: next-20230411)

    2023-05-05T15:35:42.141323  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:42.148258  <8>[   25.000321] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb11-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb2-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e8650
        new failure (last pass: next-20230411)

    2023-05-05T15:35:41.118557  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:41.125427  <8>[   23.976568] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb17-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e8651
        new failure (last pass: next-20230411)

    2023-05-05T15:35:40.094193  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:40.101189  <8>[   22.952875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb17-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb7-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e8652
        new failure (last pass: next-20230411)

    2023-05-05T15:35:39.071929  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:39.078299  <8>[   21.929083] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb7-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb9-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e8653
        new failure (last pass: next-20230411)

    2023-05-05T15:35:38.048169  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:38.054449  <8>[   20.906448] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb9-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb19-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e8654
        new failure (last pass: next-20230411)

    2023-05-05T15:35:37.025200  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:37.031493  <8>[   19.882511] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb19-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb16-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e8655
        new failure (last pass: next-20230411)

    2023-05-05T15:35:36.001846  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:36.008188  <8>[   18.859463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb16-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb4-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e8656
        new failure (last pass: next-20230411)

    2023-05-05T15:35:34.978107  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:34.984588  <8>[   17.835672] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb1-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e8657
        new failure (last pass: next-20230411)

    2023-05-05T15:35:33.954878  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:33.961699  <8>[   16.812380] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb20-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e8658
        new failure (last pass: next-20230411)

    2023-05-05T15:35:32.932943  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:32.938868  <8>[   15.789482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb20-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb14-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e8659
        new failure (last pass: next-20230411)

    2023-05-05T15:35:30.901324  /../bin/lava-tes<6>[   13.742951] platform =
14009000.color: deferred probe pending

    2023-05-05T15:35:30.908089  <6>[   13.742955] platform 1400c000.gamma: =
deferred probe pending

    2023-05-05T15:35:30.914638  <6>[   13.742958] platform 14005000.ovl: de=
ferred probe pending

    2023-05-05T15:35:30.918130  <6>[   13.742963] platform 14006000.ovl: de=
ferred probe pending

    2023-05-05T15:35:30.924258  <6>[   13.742966] platform 14014000.ovl: de=
ferred probe pending

    2023-05-05T15:35:30.931203  <6>[   13.742970] platform 14007000.rdma: d=
eferred probe pending

    2023-05-05T15:35:30.934948  <6>[   13.742973] platform 14015000.rdma: d=
eferred probe pending

    2023-05-05T15:35:30.941034  <6>[   13.742977] platform 14010000.dsi: de=
ferred probe pending

    2023-05-05T15:35:30.947897  <6>[   13.799118] platform regulator-1v8-mi=
pibrdg: deferred probe pending

    2023-05-05T15:35:30.954460  <6>[   13.805648] platform regulator-1v0-dp=
brdg: deferred probe pending
 =

    ... (6 line(s) more)  =


  * baseline.bootrr.mtk-smi-larb5-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e865a
        new failure (last pass: next-20230411)

    2023-05-05T15:35:30.735220  <4>[   13.583821] rt5682 1-001a: Using defa=
ult DAI clk names: rt5682-dai-wclk, rt5682-dai-bclk

    2023-05-05T15:35:30.741931  <6>[   13.592238] platform 13000000.gpu: de=
ferred probe pending

    2023-05-05T15:35:30.745215  <6>[   13.592246] i2c 3-0058: deferred prob=
e pending

    2023-05-05T15:35:30.752026  <6>[   13.602597] platform 14002000.smi: de=
ferred probe pending

    2023-05-05T15:35:30.758378  <6>[   13.602601] platform 14003000.larb: d=
eferred probe pending

    2023-05-05T15:35:30.761944  <6>[   13.613990] platform 14004000.larb: d=
eferred probe pending

    2023-05-05T15:35:30.768173  <6>[   13.613994] platform 1502e000.larb: d=
eferred probe pending

    2023-05-05T15:35:30.774881  <6>[   13.625478] platform 1582e000.larb: d=
eferred probe pending

    2023-05-05T15:35:30.778524  <6>[   13.631221] platform 1600d000.larb: d=
eferred probe pending

    2023-05-05T15:35:30.784729  <6>[   13.636963] platform 1602e000.larb: d=
eferred probe pending
 =

    ... (18 line(s) more)  =


  * baseline.bootrr.mtk-smi-larb0-probed: https://kernelci.org/test/case/id=
/64552276e24204df0b2e865b
        new failure (last pass: next-20230411)

    2023-05-05T15:35:29.850880  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:29.857987  <8>[   12.707587] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-common-probed: https://kernelci.org/test/case/i=
d/64552276e24204df0b2e865d
        new failure (last pass: next-20230411)

    2023-05-05T15:35:28.809830  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:28.816486  <8>[   11.666844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-common-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-power-controller-probed: https://kernelci.org/test/=
case/id/64552276e24204df0b2e8672
        new failure (last pass: next-20230411)

    2023-05-05T15:35:25.387658  /lava-10208223/1/../bin/lava-test-case

    2023-05-05T15:35:25.394113  <8>[    8.243673] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-power-controller-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645522716c327249292e860b

  Results:     178 PASS, 7 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-apmixedsys-probed: https://kernelci.org/test=
/case/id/645522716c327249292e86b0
        failing since 45 days (last pass: next-20230316, first fail: next-2=
0230321)

    2023-05-05T15:35:56.873150  /lava-10208277/1/../bin/lava-test-case

    2023-05-05T15:35:56.879369  <8>[    5.892939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-apmixedsys-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64552068741f80fa712e862d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552068741f80fa712e8=
62e
        failing since 20 days (last pass: next-20230411, first fail: v6.3-r=
c6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
odroid-xu3                   | arm    | lab-collabora | gcc-10   | exynos_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64551b280c67b0242e2e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64551b280c67b0242e2e8607
        new failure (last pass: next-20230504)

    2023-05-05T15:04:48.864599  + set +x

    2023-05-05T15:04:48.865100  <8>[   15.297350] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10207594_1.5.2.4.1>

    2023-05-05T15:04:48.971960  / # #

    2023-05-05T15:04:49.074107  export SHELL=3D/bin/sh

    2023-05-05T15:04:49.074812  #

    2023-05-05T15:04:49.176113  / # export SHELL=3D/bin/sh. /lava-10207594/=
environment

    2023-05-05T15:04:49.176819  =


    2023-05-05T15:04:49.278256  / # . /lava-10207594/environment/lava-10207=
594/bin/lava-test-runner /lava-10207594/1

    2023-05-05T15:04:49.279316  =


    2023-05-05T15:04:49.281860  / # /lava-10207594/bin/lava-test-runner /la=
va-10207594/1
 =

    ... (36 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | clang-17 | i386_def=
config               | 1          =


  Details:     https://kernelci.org/test/plan/id/64551de1e35ce07bdd2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230501072117+6875=
42413531-1~exp1~20230501072238.645))
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551de1e35ce07bdd2e8=
5f5
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645536e858f6c76e592e860f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
645536e858f6c76e592e8613
        failing since 79 days (last pass: next-20230214, first fail: next-2=
0230215)

    2023-05-05T17:03:28.927958  /lava-10208377/1/../bin/lava-test-case

    2023-05-05T17:03:28.928501  <8>[   29.015310] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-05-05T17:03:28.928820  /lava-10208377/1/../bin/lava-test-case

    2023-05-05T17:03:28.929071  <8>[   29.031047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-05-05T17:03:28.929307  + set +x

    2023-05-05T17:03:28.929574  <8>[   29.044351] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 10208377_1.5.2.4.5>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645523223bce8d121e2e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645523223bce8d121e2e8=
62d
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645520dea95715e35d2e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645520dea95715e35d2e8=
604
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645523d7ae47e3d28d2e866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645523d7ae47e3d28d2e8=
66b
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/64551fe96cca034bcc2e864f

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64551fe96cca034=
bcc2e86a6
        failing since 24 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-05T15:24:56.798618  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   19.223870] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-05-05T15:24:56.802123  at virtual address 0000000000000008

    2023-05-05T15:24:56.804825  kern  :alert : Mem abort info:

    2023-05-05T15:24:56.809531  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-05T15:24:56.815823  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-05T15:24:56.818507  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-05T15:24:56.822403  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-05T15:24:56.827926  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-05T15:24:56.831374  kern  :alert : Data abort info:

    2023-05-05T15:24:56.835520  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64551fe96cca034=
bcc2e86a7
        failing since 24 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-05T15:24:56.757445  <8>[   19.183970] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645521b8fe3aa379082e863f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645521b8fe3aa37=
9082e8646
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-05T15:32:56.385392  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-05-05T15:32:56.385750  kern  :emerg : Code: 9402b0be f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-05T15:32:56.386341  <8>[   22.578003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-05T15:32:56.386669  + set +x
    2023-05-05T15:32:56.387064  <8>[   22.579535] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 427715_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645521b8fe3aa37=
9082e8647
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-05T15:32:56.362966  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-05T15:32:56.366353  kern  :alert : Mem abort info:
    2023-05-05T15:32:56.366731  kern  :alert :   ESR =3D 0x0000000096000007
    2023-05-05T15:32:56.369912  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-05T15:32:56.373536  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-05T15:32:56.373904  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-05T15:32:56.376938  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-05-05T15:32:56.379741  kern  :alert : Data abort info:
    2023-05-05T15:32:56.380104  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-05-05T15:32:56.380663  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645523d41516bc3e932e8605

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645523d41516bc3=
e932e860c
        failing since 24 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-05T15:41:51.350121  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-05T15:41:51.351433  kern  :emerg : Code: 97fbb910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-05T15:41:51.369626  <8>[   19.281336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-05T15:41:51.370004  + set +x
    2023-05-05T15:41:51.370263  <8>[   19.283918] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 427720_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645523d41516bc3=
e932e860d
        failing since 24 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-05T15:41:51.325444  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-05T15:41:51.327203  kern  :alert : Mem abort info:
    2023-05-05T15:41:51.327574  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-05T15:41:51.329019  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-05T15:41:51.330792  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-05T15:41:51.331207  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-05T15:41:51.332555  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-05T15:41:51.334307  kern  :alert : Data abort info:
    2023-05-05T15:41:51.334776  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-05T15:41:51.336052  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6455213c20e61b24482e8635

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6455213c20e61b2=
4482e863c
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-05T15:30:50.605014  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-05-05T15:30:50.605566  kern  :emerg : Code: 97e670be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-05T15:30:50.605909  <8>[   21.695913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-05T15:30:50.606229  + set +x

    2023-05-05T15:30:50.606532  <8>[   21.697601] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10208195_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6455213c20e61b2=
4482e863d
        failing since 24 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-05T15:30:50.561842  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-05T15:30:50.562366  kern  :alert : Mem abort info:

    2023-05-05T15:30:50.562701  kern  :alert :   ESR =3D 0x0000000096000007

    2023-05-05T15:30:50.563012  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-05T15:30:50.563313  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-05T15:30:50.563607  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-05T15:30:50.563897  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-05-05T15:30:50.564183  kern  :alert : Data abort info:

    2023-05-05T15:30:50.564461  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-05-05T15:30:50.564736  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645523665ed3fc6eb02e85e8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645523665ed3fc6=
eb02e85ef
        failing since 24 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-05T15:40:06.200304  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-05T15:40:06.200734  kern  :emerg : Code: 97fa7d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-05T15:40:06.201075  <8>[   21.829887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-05T15:40:06.201427  + set +x

    2023-05-05T15:40:06.201738  <8>[   21.831913] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10208380_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645523665ed3fc6=
eb02e85f0
        failing since 24 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-05T15:40:06.151919  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-05T15:40:06.152419  kern  :alert : Mem abort info:

    2023-05-05T15:40:06.152870  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-05T15:40:06.153403  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-05T15:40:06.153839  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-05T15:40:06.154156  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-05T15:40:06.154459  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-05T15:40:06.154753  kern  :alert : Data abort info:

    2023-05-05T15:40:06.155042  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-05T15:40:06.155325  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64552398ae47e3d28d2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552398ae47e3d28d2e8=
5e8
        failing since 0 day (last pass: next-20230209, first fail: next-202=
30504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645522253a285cb5e42e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645522253a285cb5e42e8=
604
        failing since 0 day (last pass: next-20230222, first fail: next-202=
30504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64552455b0bbab715e2e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552455b0bbab715e2e8=
5ee
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64552438e32d272cba2e8803

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64552438e32d272cba2e8=
804
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe    | clang-17 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645520506159b6ebd92e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230501072117+6875=
42413531-1~exp1~20230501072238.645))
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645520506159b6ebd92e8=
5e9
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64551703c1cae942d32e8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230505/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230505/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64551703c1cae942d32e8=
646
        failing since 7 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230426) =

 =20
