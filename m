Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C29C746841
	for <lists+linux-next@lfdr.de>; Tue,  4 Jul 2023 06:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjGDEG0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Jul 2023 00:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjGDEGY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Jul 2023 00:06:24 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A818F
        for <linux-next@vger.kernel.org>; Mon,  3 Jul 2023 21:06:20 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so3755550a91.0
        for <linux-next@vger.kernel.org>; Mon, 03 Jul 2023 21:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688443579; x=1691035579;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cuMNI4pNplxrAvwKxJYGiNBzNTgokQQ8wdFEfk+KNG4=;
        b=ZpXh8FEeydzbYDxUhpzV/yAPd1BmS7N+nYRmjFp3uEZPA+RNbraL2FQSz1bbUjPZeG
         iV6lOJOsH30nvv4tHm/ZjbdliUdaSX745Ltnb9ddmOhYi4ItL75UQm5CW7PJDiY+kwtu
         Ou8iL4sevnWAftRK8jgJzy3c8XwAFKtao8BE44ZnbVC9Qi/dL5gnHbtqN/WKNv1t/ir6
         dubwDQISV40HnUf/b9cPImzKUYLpNbzlwduFa6R3f9gcvNx6XWJfPeGDKVo2SB9iRt24
         YSj9ZV3NW0dT5nhNKI7/V1aHQGYPgHmCq9JCcngU1o2DO1bP8dRrtJKCQtXwxHRriY4r
         xkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688443579; x=1691035579;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuMNI4pNplxrAvwKxJYGiNBzNTgokQQ8wdFEfk+KNG4=;
        b=lWT6fy+fHzxpnGXAsQyV2GF8azhXx7RZmehWAOyq3shqs0kaCv0H9zMh1/KohaLJFU
         SvNtVTqdlLTbnlHdiqGJ2KQAUt+ATTDssrIyyzLCvFrMGFVq3tcTCOaVUWJZqOkGzR92
         4XxWw6BeQ/kUDfkgH+K+Xq5DyknsJx9N/AMCtpYlXZH1dE5/qqi2lUW8fgSBmcvjDZRh
         5t7styAOoWtuA2BUa+VfKlRblWBBSALhiu96XuURbwT3dMQR5ZB2Uqnhy1/XKbBpzydZ
         SBMPh50SiyASAG+aRKV9ka/X7XaUkhjFek8VkEgIdEWmDVK3FWXDVxsjc/3vEblBkhmn
         eFFA==
X-Gm-Message-State: ABy/qLaSZyP2gmS0ohoK9sHeoQwwR+Oh2i3tTJdcSlBMDLmBqdlqlsKm
        z+yMpPIx6GJqFODmYfUhWxcq5URn7G0vjgDlEzPmbw==
X-Google-Smtp-Source: APBJJlHtduwCCQkQw7XceXdLf1eEmHES/S7uN+1ZHeF4NAIJ0BoLj77oQEEcYRPSWcnZNVxH7k+uZQ==
X-Received: by 2002:a17:90a:3d0d:b0:25b:ea12:a2f5 with SMTP id h13-20020a17090a3d0d00b0025bea12a2f5mr11146182pjc.35.1688443578500;
        Mon, 03 Jul 2023 21:06:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gm4-20020a17090b100400b0025023726fc4sm14553976pjb.26.2023.07.03.21.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 21:06:17 -0700 (PDT)
Message-ID: <64a39ab9.170a0220.69b77.cd3d@mx.google.com>
Date:   Mon, 03 Jul 2023 21:06:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-11141-g4556f2dbce0d
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 395 runs,
 67 regressions (v6.4-11141-g4556f2dbce0d)
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

next/pending-fixes baseline: 395 runs, 67 regressions (v6.4-11141-g4556f2db=
ce0d)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+crypto             | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-11141-g4556f2dbce0d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-11141-g4556f2dbce0d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4556f2dbce0d11dfd22f9527992f959c808a9fc6 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36444078302560cbb2a91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36444078302560cbb2=
a92
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3644abdd83b08dbbb2a7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3644abdd83b08dbbb2=
a7f
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35ea2878f809ed0bb2a7e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35ea2878f809ed0bb2a83
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:49:45.169042  <8>[   10.904431] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999575_1.4.2.3.1>

    2023-07-03T23:49:45.172455  + set +x

    2023-07-03T23:49:45.280045  / # #

    2023-07-03T23:49:45.382488  export SHELL=3D/bin/sh

    2023-07-03T23:49:45.383280  #

    2023-07-03T23:49:45.484846  / # export SHELL=3D/bin/sh. /lava-10999575/=
environment

    2023-07-03T23:49:45.485650  =


    2023-07-03T23:49:45.587357  / # . /lava-10999575/environment/lava-10999=
575/bin/lava-test-runner /lava-10999575/1

    2023-07-03T23:49:45.588695  =


    2023-07-03T23:49:45.594401  / # /lava-10999575/bin/lava-test-runner /la=
va-10999575/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36371d2d2639561bb2aaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36371d2d2639561bb2=
aab
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363c98f7d8e4f86bb2b26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363c98f7d8e4f86bb2b2b
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:11:39.392355  <8>[   10.927608] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999959_1.4.2.3.1>

    2023-07-04T00:11:39.395761  + set +x

    2023-07-04T00:11:39.500168  / # #

    2023-07-04T00:11:39.600731  export SHELL=3D/bin/sh

    2023-07-04T00:11:39.600959  #

    2023-07-04T00:11:39.701466  / # export SHELL=3D/bin/sh. /lava-10999959/=
environment

    2023-07-04T00:11:39.701651  =


    2023-07-04T00:11:39.802265  / # . /lava-10999959/environment/lava-10999=
959/bin/lava-test-runner /lava-10999959/1

    2023-07-04T00:11:39.802719  =


    2023-07-04T00:11:39.808219  / # /lava-10999959/bin/lava-test-runner /la=
va-10999959/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35e53b8a6e9f548bb2a81

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35e53b8a6e9f548bb2a86
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:48:23.166177  + set<8>[   11.138939] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10999585_1.4.2.3.1>

    2023-07-03T23:48:23.166255   +x

    2023-07-03T23:48:23.270248  / # #

    2023-07-03T23:48:23.370762  export SHELL=3D/bin/sh

    2023-07-03T23:48:23.370973  #

    2023-07-03T23:48:23.471468  / # export SHELL=3D/bin/sh. /lava-10999585/=
environment

    2023-07-03T23:48:23.471691  =


    2023-07-03T23:48:23.572201  / # . /lava-10999585/environment/lava-10999=
585/bin/lava-test-runner /lava-10999585/1

    2023-07-03T23:48:23.572496  =


    2023-07-03T23:48:23.577232  / # /lava-10999585/bin/lava-test-runner /la=
va-10999585/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36371d2d2639561bb2aad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36371d2d2639561bb2=
aae
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363dda7f9262702bb2a88

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363dda7f9262702bb2a8d
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:12:03.385387  + set<8>[   11.449782] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10999967_1.4.2.3.1>

    2023-07-04T00:12:03.385864   +x

    2023-07-04T00:12:03.493606  / # #

    2023-07-04T00:12:03.596099  export SHELL=3D/bin/sh

    2023-07-04T00:12:03.596852  #

    2023-07-04T00:12:03.698332  / # export SHELL=3D/bin/sh. /lava-10999967/=
environment

    2023-07-04T00:12:03.699090  =


    2023-07-04T00:12:03.800891  / # . /lava-10999967/environment/lava-10999=
967/bin/lava-test-runner /lava-10999967/1

    2023-07-04T00:12:03.802278  =


    2023-07-04T00:12:03.806932  / # /lava-10999967/bin/lava-test-runner /la=
va-10999967/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35e6ea8a710d187bb2ac2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35e6ea8a710d187bb2ac7
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:48:40.509346  <8>[   10.104975] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999630_1.4.2.3.1>

    2023-07-03T23:48:40.512638  + set +x

    2023-07-03T23:48:40.614246  =


    2023-07-03T23:48:40.714873  / # #export SHELL=3D/bin/sh

    2023-07-03T23:48:40.715091  =


    2023-07-03T23:48:40.815636  / # export SHELL=3D/bin/sh. /lava-10999630/=
environment

    2023-07-03T23:48:40.815887  =


    2023-07-03T23:48:40.916514  / # . /lava-10999630/environment/lava-10999=
630/bin/lava-test-runner /lava-10999630/1

    2023-07-03T23:48:40.916800  =


    2023-07-03T23:48:40.922173  / # /lava-10999630/bin/lava-test-runner /la=
va-10999630/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36369c9e64f308ebb2a8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36369c9e64f308ebb2=
a90
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363d0d0918da653bb2a97

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363d0d0918da653bb2a9c
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:12:15.153937  <8>[   11.178811] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999985_1.4.2.3.1>

    2023-07-04T00:12:15.157728  + set +x

    2023-07-04T00:12:15.258869  #

    2023-07-04T00:12:15.259105  =


    2023-07-04T00:12:15.359632  / # #export SHELL=3D/bin/sh

    2023-07-04T00:12:15.359824  =


    2023-07-04T00:12:15.460329  / # export SHELL=3D/bin/sh. /lava-10999985/=
environment

    2023-07-04T00:12:15.460505  =


    2023-07-04T00:12:15.560984  / # . /lava-10999985/environment/lava-10999=
985/bin/lava-test-runner /lava-10999985/1

    2023-07-04T00:12:15.561292  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3645abdd83b08dbbb2aa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3645abdd83b08dbbb2=
aa2
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3645da342c47fc6bb2a79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3645da342c47fc6bb2=
a7a
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3647f37ed1357dfbb2a83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3647f37ed1357dfbb2=
a84
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36342bda53aefbfbb2a93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36342bda53aefbfbb2=
a94
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35e773e84226963bb2aa0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35e773e84226963bb2aa5
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:48:58.678605  + set +x

    2023-07-03T23:48:58.685472  <8>[   10.970656] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999598_1.4.2.3.1>

    2023-07-03T23:48:58.789635  / # #

    2023-07-03T23:48:58.890296  export SHELL=3D/bin/sh

    2023-07-03T23:48:58.890517  #

    2023-07-03T23:48:58.991060  / # export SHELL=3D/bin/sh. /lava-10999598/=
environment

    2023-07-03T23:48:58.991298  =


    2023-07-03T23:48:59.091857  / # . /lava-10999598/environment/lava-10999=
598/bin/lava-test-runner /lava-10999598/1

    2023-07-03T23:48:59.092272  =


    2023-07-03T23:48:59.096962  / # /lava-10999598/bin/lava-test-runner /la=
va-10999598/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363b51fb3075cf1bb2b4c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363b51fb3075cf1bb2b51
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:11:25.458114  + set +x

    2023-07-04T00:11:25.464737  <8>[   10.625568] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999942_1.4.2.3.1>

    2023-07-04T00:11:25.569462  / # #

    2023-07-04T00:11:25.670105  export SHELL=3D/bin/sh

    2023-07-04T00:11:25.670316  #

    2023-07-04T00:11:25.770810  / # export SHELL=3D/bin/sh. /lava-10999942/=
environment

    2023-07-04T00:11:25.771019  =


    2023-07-04T00:11:25.871645  / # . /lava-10999942/environment/lava-10999=
942/bin/lava-test-runner /lava-10999942/1

    2023-07-04T00:11:25.872013  =


    2023-07-04T00:11:25.876736  / # /lava-10999942/bin/lava-test-runner /la=
va-10999942/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363bd8d93c8fdf7bb2a7b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363bd8d93c8fdf7bb2a80
        failing since 94 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-07-04T00:11:50.043095  + set +x

    2023-07-04T00:11:50.049167  <8>[   10.775334] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999849_1.4.2.3.1>

    2023-07-04T00:11:50.153646  / # #

    2023-07-04T00:11:50.254370  export SHELL=3D/bin/sh

    2023-07-04T00:11:50.254565  #

    2023-07-04T00:11:50.355094  / # export SHELL=3D/bin/sh. /lava-10999849/=
environment

    2023-07-04T00:11:50.355282  =


    2023-07-04T00:11:50.455802  / # . /lava-10999849/environment/lava-10999=
849/bin/lava-test-runner /lava-10999849/1

    2023-07-04T00:11:50.456080  =


    2023-07-04T00:11:50.460417  / # /lava-10999849/bin/lava-test-runner /la=
va-10999849/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35e4d7b1c24bb9fbb2aba

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35e4d7b1c24bb9fbb2abf
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:48:19.995859  <8>[   10.220990] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999615_1.4.2.3.1>

    2023-07-03T23:48:19.999273  + set +x

    2023-07-03T23:48:20.100587  /#

    2023-07-03T23:48:20.201427   # #export SHELL=3D/bin/sh

    2023-07-03T23:48:20.201584  =


    2023-07-03T23:48:20.302065  / # export SHELL=3D/bin/sh. /lava-10999615/=
environment

    2023-07-03T23:48:20.302416  =


    2023-07-03T23:48:20.403010  / # . /lava-10999615/environment/lava-10999=
615/bin/lava-test-runner /lava-10999615/1

    2023-07-03T23:48:20.403314  =


    2023-07-03T23:48:20.408147  / # /lava-10999615/bin/lava-test-runner /la=
va-10999615/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36357c3d56ccb81bb2aa5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a36357c3d56ccb81bb2aaa
        failing since 94 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-07-04T00:09:42.942439  + set +x

    2023-07-04T00:09:42.949262  <8>[   13.091326] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10999831_1.4.2.3.1>

    2023-07-04T00:09:43.053483  / # #

    2023-07-04T00:09:43.154141  export SHELL=3D/bin/sh

    2023-07-04T00:09:43.154323  #

    2023-07-04T00:09:43.254830  / # export SHELL=3D/bin/sh. /lava-10999831/=
environment

    2023-07-04T00:09:43.255046  =


    2023-07-04T00:09:43.355571  / # . /lava-10999831/environment/lava-10999=
831/bin/lava-test-runner /lava-10999831/1

    2023-07-04T00:09:43.355897  =


    2023-07-04T00:09:43.361697  / # /lava-10999831/bin/lava-test-runner /la=
va-10999831/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363b88f7d8e4f86bb2a75

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363b88f7d8e4f86bb2a7a
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:11:22.082619  + set<8>[   10.265389] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10999949_1.4.2.3.1>

    2023-07-04T00:11:22.082755   +x

    2023-07-04T00:11:22.184691  /#

    2023-07-04T00:11:22.285448   # #export SHELL=3D/bin/sh

    2023-07-04T00:11:22.285631  =


    2023-07-04T00:11:22.386112  / # export SHELL=3D/bin/sh. /lava-10999949/=
environment

    2023-07-04T00:11:22.386317  =


    2023-07-04T00:11:22.486860  / # . /lava-10999949/environment/lava-10999=
949/bin/lava-test-runner /lava-10999949/1

    2023-07-04T00:11:22.487204  =


    2023-07-04T00:11:22.492193  / # /lava-10999949/bin/lava-test-runner /la=
va-10999949/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35e6c3e84226963bb2a78

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35e6c3e84226963bb2a7d
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:48:38.039233  + set<8>[   10.798278] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10999594_1.4.2.3.1>

    2023-07-03T23:48:38.039356   +x

    2023-07-03T23:48:38.144269  / # #

    2023-07-03T23:48:38.245001  export SHELL=3D/bin/sh

    2023-07-03T23:48:38.245261  #

    2023-07-03T23:48:38.345789  / # export SHELL=3D/bin/sh. /lava-10999594/=
environment

    2023-07-03T23:48:38.346059  =


    2023-07-03T23:48:38.446645  / # . /lava-10999594/environment/lava-10999=
594/bin/lava-test-runner /lava-10999594/1

    2023-07-03T23:48:38.447035  =


    2023-07-03T23:48:38.451499  / # /lava-10999594/bin/lava-test-runner /la=
va-10999594/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3637cd2d2639561bb2abb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3637cd2d2639561bb2=
abc
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363d8e005cb945cbb2a77

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363d8e005cb945cbb2a7c
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:11:52.597935  + <8>[   11.297186] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10999961_1.4.2.3.1>

    2023-07-04T00:11:52.598017  set +x

    2023-07-04T00:11:52.702437  / # #

    2023-07-04T00:11:52.803075  export SHELL=3D/bin/sh

    2023-07-04T00:11:52.803273  #

    2023-07-04T00:11:52.903795  / # export SHELL=3D/bin/sh. /lava-10999961/=
environment

    2023-07-04T00:11:52.904017  =


    2023-07-04T00:11:53.004581  / # . /lava-10999961/environment/lava-10999=
961/bin/lava-test-runner /lava-10999961/1

    2023-07-04T00:11:53.004908  =


    2023-07-04T00:11:53.009789  / # /lava-10999961/bin/lava-test-runner /la=
va-10999961/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a362eb96512ef3f1bb2acb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am6=
25-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a362eb96512ef3f1bb2ad0
        failing since 68 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-07-04T00:07:46.062866  + set +x
    2023-07-04T00:07:46.066105  <8>[   14.095415] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3709084_1.5.2.4.1>
    2023-07-04T00:07:46.188249  / # #
    2023-07-04T00:07:46.291949  export SHELL=3D/bin/sh
    2023-07-04T00:07:46.293190  #
    2023-07-04T00:07:46.395625  / # export SHELL=3D/bin/sh. /lava-3709084/e=
nvironment
    2023-07-04T00:07:46.396598  =

    2023-07-04T00:07:46.498782  / # ./lava-3709084/bin/lava-test-runner /la=
va-3709084/1
    2023-07-04T00:07:46.500564   /lava-3709084/environment
    2023-07-04T00:07:46.541572  / # /lava-3709084/bin/lava-test-runner /lav=
a-3709084/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3650aaf91d68b5ebb2aab

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-sk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-sk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a3650aaf91d68b5ebb2ab0
        failing since 66 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-07-04T00:16:54.501776  + set +x
    2023-07-04T00:16:54.505287  <8>[    7.858773] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3709150_1.5.2.4.1>
    2023-07-04T00:16:54.615757  / # #
    2023-07-04T00:16:54.719682  export SHELL=3D/bin/sh
    2023-07-04T00:16:54.720916  #
    2023-07-04T00:16:54.823267  / # export SHELL=3D/bin/sh. /lava-3709150/e=
nvironment
    2023-07-04T00:16:54.824509  =

    2023-07-04T00:16:54.927057  / # . /lava-3709150/environment/lava-370915=
0/bin/lava-test-runner /lava-3709150/1
    2023-07-04T00:16:54.929245  =

    2023-07-04T00:16:54.973653  / # /lava-3709150/bin/lava-test-runner /lav=
a-3709150/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a366476528286a0cbb2a75

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a366476528286a0cbb2a7a
        failing since 68 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-07-04T00:22:21.357724  <8>[    7.790859] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3709191_1.5.2.4.1>
    2023-07-04T00:22:21.468620  / # #
    2023-07-04T00:22:21.572457  export SHELL=3D/bin/sh
    2023-07-04T00:22:21.573638  #
    2023-07-04T00:22:21.675938  / # export SHELL=3D/bin/sh. /lava-3709191/e=
nvironment
    2023-07-04T00:22:21.677238  =

    2023-07-04T00:22:21.779644  / # . /lava-3709191/environment/lava-370919=
1/bin/lava-test-runner /lava-3709191/1
    2023-07-04T00:22:21.781742  =

    2023-07-04T00:22:21.792824  / # /lava-3709191/bin/lava-test-runner /lav=
a-3709191/1
    2023-07-04T00:22:21.837628  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/64a3622d8c70ea4adabb2a93

  Results:     92 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
4a3622d8c70ea4adabb2ac9
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-04T00:04:41.810116  /lava-368608/1/../bin/lava-test-case
    2023-07-04T00:04:41.812491  <8>[   45.919319] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
4a3622d8c70ea4adabb2aca
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-04T00:04:42.831958  /lava-368608/1/../bin/lava-test-case
    2023-07-04T00:04:42.835127  <8>[   46.941407] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
4a3622d8c70ea4adabb2acb
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-04T00:04:43.895646  /lava-368608/1/../bin/lava-test-case
    2023-07-04T00:04:43.896143  <8>[   47.963346] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-07-04T00:04:43.896463  /lava-368608/1/../bin/lava-test-case
    2023-07-04T00:04:43.896709  <8>[   47.980985] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>
    2023-07-04T00:04:43.896945  /lava-368608/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64a36674bc242a0a70bb2a8a

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a36674bc242a0a70bb2a8d
        new failure (last pass: v6.4-10301-g9e106c7d604e)

    2023-07-04T00:23:09.107480  / # #
    2023-07-04T00:23:09.210154  export SHELL=3D/bin/sh
    2023-07-04T00:23:09.210932  #
    2023-07-04T00:23:09.312819  / # export SHELL=3D/bin/sh. /lava-368631/en=
vironment
    2023-07-04T00:23:09.313615  =

    2023-07-04T00:23:09.415572  / # . /lava-368631/environment/lava-368631/=
bin/lava-test-runner /lava-368631/1
    2023-07-04T00:23:09.416796  =

    2023-07-04T00:23:09.434367  / # /lava-368631/bin/lava-test-runner /lava=
-368631/1
    2023-07-04T00:23:09.489285  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-04T00:23:09.489775  + cd /lava-368631/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64a=
36674bc242a0a70bb2a9d
        new failure (last pass: v6.4-10301-g9e106c7d604e)

    2023-07-04T00:23:11.887178  /lava-368631/1/../bin/lava-test-case
    2023-07-04T00:23:11.887655  <8>[   17.919342] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-07-04T00:23:11.887990  /lava-368631/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/64a3622aaf019711e7bb2a9a

  Results:     100 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
4a3622aaf019711e7bb2ad7
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-04T00:04:41.198368  /lava-368607/1/../bin/lava-test-case
    2023-07-04T00:04:41.201658  <8>[   41.389517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
4a3622aaf019711e7bb2ad8
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-04T00:04:42.219927  /lava-368607/1/../bin/lava-test-case
    2023-07-04T00:04:42.223075  <8>[   42.411252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
4a3622aaf019711e7bb2ad9
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8)

    2023-07-04T00:04:43.282639  /lava-368607/1/../bin/lava-test-case
    2023-07-04T00:04:43.283178  <8>[   43.433100] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-07-04T00:04:43.283656  /lava-368607/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a35e58b8a6e9f548bb2a8f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a35e58b8a6e9f548bb2a94
        failing since 97 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-03T23:48:25.829138  + set<8>[   11.931914] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10999635_1.4.2.3.1>

    2023-07-03T23:48:25.829220   +x

    2023-07-03T23:48:25.933497  / # #

    2023-07-03T23:48:26.034241  export SHELL=3D/bin/sh

    2023-07-03T23:48:26.034461  #

    2023-07-03T23:48:26.134980  / # export SHELL=3D/bin/sh. /lava-10999635/=
environment

    2023-07-03T23:48:26.135249  =


    2023-07-03T23:48:26.235751  / # . /lava-10999635/environment/lava-10999=
635/bin/lava-test-runner /lava-10999635/1

    2023-07-03T23:48:26.236120  =


    2023-07-03T23:48:26.240354  / # /lava-10999635/bin/lava-test-runner /la=
va-10999635/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363c68f7d8e4f86bb2b10

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a363c68f7d8e4f86bb2b15
        failing since 97 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-04T00:11:47.471809  + set +x<8>[    9.184100] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10999944_1.4.2.3.1>

    2023-07-04T00:11:47.471895  =


    2023-07-04T00:11:47.576518  / # #

    2023-07-04T00:11:47.677261  export SHELL=3D/bin/sh

    2023-07-04T00:11:47.677489  #

    2023-07-04T00:11:47.778024  / # export SHELL=3D/bin/sh. /lava-10999944/=
environment

    2023-07-04T00:11:47.778253  =


    2023-07-04T00:11:47.878837  / # . /lava-10999944/environment/lava-10999=
944/bin/lava-test-runner /lava-10999944/1

    2023-07-04T00:11:47.879159  =


    2023-07-04T00:11:47.883404  / # /lava-10999944/bin/lava-test-runner /la=
va-10999944/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3647da9a76e4031bb2b38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3647da9a76e4031bb2=
b39
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363fa7b6faad25fbb2b04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a363fa7b6faad25fbb2=
b05
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3648137ed1357dfbb2a8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3648137ed1357dfbb2=
a8e
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363f9bf40236f12bb2a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a363f9bf40236f12bb2=
a7b
        failing since 134 days (last pass: v6.2-rc8-150-g30cd52e17d48, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a365ab15bd0efbfbbb2abe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a365ab15bd0efbfbbb2=
abf
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3650a6daa630910bb2a98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3650a6daa630910bb2=
a99
        failing since 146 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363d5d0918da653bb2adb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a363d5d0918da653bb2=
adc
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363f778b3ace5b3bb2a85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a363f778b3ace5b3bb2=
a86
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/64a363dbe005cb945cbb2a84

  Results:     165 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64a363dbe005cb9=
45cbb2b2f
        new failure (last pass: v6.4-8718-g6b8b1f7dba504)
        2 lines

    2023-07-04T00:11:40.898801  ss 0000000000000019

    2023-07-04T00:11:40.901825  kern  :alert : Mem abort info:

    2023-07-04T00:11:40.905056  kern  :alert :   ESR =3D 0x0000000096000006

    2023-07-04T00:11:40.912179  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-07-04T00:11:40.915106  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-07-04T00:11:40.915531  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-07-04T00:11:40.924688  kern  :alert<8>[   17.357948] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64a363dbe005cb9=
45cbb2b30
        new failure (last pass: v6.4-8718-g6b8b1f7dba504)
        13 lines

    2023-07-04T00:11:40.895648  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual addre<8>[   17.328143] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D13>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3641c2da23487efbb2a80

  Results:     182 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-simple-dp-aux-probed: https://kernelci.org/test/c=
ase/id/64a3641c2da23487efbb2aa1
        new failure (last pass: v6.4-8718-g6b8b1f7dba504)

    2023-07-04T00:12:53.457496  /lava-10999894/1/../bin/lava-test-case

    2023-07-04T00:12:53.463963  <8>[   24.079938] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3623f6845d0c1bbbb2aa5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a3623f6845d0c1bbbb2aaa
        failing since 152 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-04T00:04:55.850108  [   33.139943] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3709066_1.5.2.4.1>
    2023-07-04T00:04:55.954873  =

    2023-07-04T00:04:56.056404  / # #export SHELL=3D/bin/sh
    2023-07-04T00:04:56.056848  =

    2023-07-04T00:04:56.158360  / # export SHELL=3D/bin/sh. /lava-3709066/e=
nvironment
    2023-07-04T00:04:56.158924  =

    2023-07-04T00:04:56.260503  / # . /lava-3709066/environment/lava-370906=
6/bin/lava-test-runner /lava-3709066/1
    2023-07-04T00:04:56.261194  =

    2023-07-04T00:04:56.264755  / # /lava-3709066/bin/lava-test-runner /lav=
a-3709066/1
    2023-07-04T00:04:56.301126  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64a365106daa630910bb2a9d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a365106daa630910bb2aa2
        failing since 152 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-07-04T00:17:07.413387  [   30.485729] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3709151_1.5.2.4.1>
    2023-07-04T00:17:07.517872  =

    2023-07-04T00:17:07.619482  / # #export SHELL=3D/bin/sh
    2023-07-04T00:17:07.620032  =

    2023-07-04T00:17:07.721747  / # export SHELL=3D/bin/sh. /lava-3709151/e=
nvironment
    2023-07-04T00:17:07.722480  =

    2023-07-04T00:17:07.824367  / # . /lava-3709151/environment/lava-370915=
1/bin/lava-test-runner /lava-3709151/1
    2023-07-04T00:17:07.825332  =

    2023-07-04T00:17:07.828845  / # /lava-3709151/bin/lava-test-runner /lav=
a-3709151/1
    2023-07-04T00:17:07.864859  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3658870ea8dd2e3bb2a8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a3658870ea8dd2e3bb2a90
        failing since 152 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-04T00:19:01.187570  [   30.181036] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3709179_1.5.2.4.1>
    2023-07-04T00:19:01.292671  =

    2023-07-04T00:19:01.394862  / # #export SHELL=3D/bin/sh
    2023-07-04T00:19:01.395630  =

    2023-07-04T00:19:01.497511  / # export SHELL=3D/bin/sh. /lava-3709179/e=
nvironment
    2023-07-04T00:19:01.497899  =

    2023-07-04T00:19:01.599962  / # . /lava-3709179/environment/lava-370917=
9/bin/lava-test-runner /lava-3709179/1
    2023-07-04T00:19:01.601226  =

    2023-07-04T00:19:01.604429  / # /lava-3709179/bin/lava-test-runner /lav=
a-3709179/1
    2023-07-04T00:19:01.640479  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363da44ef7cddd1bb2a77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a363da44ef7cddd1bb2=
a78
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3687b795a868a7dbb2a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3687b795a868a7dbb2=
a96
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36cc8fffefafb0cbb2a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-p=
ine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-p=
ine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36cc8fffefafb0cbb2=
a7b
        failing since 4 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36e6c22a158b8ebbb2a90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine6=
4-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine6=
4-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36e6c22a158b8ebbb2=
a91
        failing since 0 day (last pass: v6.4-4072-ge8f5f1933319, first fail=
: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3702411ba8dce8ebb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3702411ba8dce8ebb2=
a76
        failing since 3 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3632ad576747c42bb2b1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3632ad576747c42bb2=
b1d
        failing since 4 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a364918f1e4749f1bb2aa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a364918f1e4749f1bb2=
aa9
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64a365e5d707293d16bb2a82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pi=
ne64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pi=
ne64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a365e5d707293d16bb2=
a83
        failing since 4 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3674d881c409292bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64=
-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64=
-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3674d881c409292bb2=
a76
        failing since 0 day (last pass: v6.4-4072-ge8f5f1933319, first fail=
: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a368ab57caf2d5a7bb2a9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a368ab57caf2d5a7bb2=
a9c
        failing since 3 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-8718-g6b8b1f7dba504) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a3642d04602ad3f8bb2ae8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a3642d04602ad3f8bb2=
ae9
        failing since 146 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36583a8c2d3d9f9bb2bbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-librete=
ch-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-librete=
ch-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36583a8c2d3d9f9bb2=
bbc
        failing since 5 days (last pass: v6.4-rc7-318-gd779731ecfed, first =
fail: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64a365fb727b125745bb2a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a365fb727b125745bb2=
a77
        failing since 4 days (last pass: v6.4-1651-gf52dd2890422, first fai=
l: v6.4-4938-g5c1c4e99720d8) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36674971ed5c748bb2ab0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/=
baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36674971ed5c748bb2=
ab1
        failing since 0 day (last pass: v6.4-8718-g6b8b1f7dba504, first fai=
l: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64a36329bda53aefbfbb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a36329bda53aefbfbb2=
a76
        new failure (last pass: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64a363cd5d41b39b26bb2ad4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11141-=
g4556f2dbce0d/arm64/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a363cd5d41b39b26bb2=
ad5
        failing since 3 days (last pass: v6.4-rc7-235-g8d8d57edb1481, first=
 fail: v6.4-8718-g6b8b1f7dba504) =

 =20
