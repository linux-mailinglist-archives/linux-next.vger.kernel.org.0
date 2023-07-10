Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B18D74CADA
	for <lists+linux-next@lfdr.de>; Mon, 10 Jul 2023 05:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjGJDuX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Jul 2023 23:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGJDuV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Jul 2023 23:50:21 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AD8C3
        for <linux-next@vger.kernel.org>; Sun,  9 Jul 2023 20:50:17 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666e64e97e2so1941988b3a.1
        for <linux-next@vger.kernel.org>; Sun, 09 Jul 2023 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688961017; x=1691553017;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9EWiLnCPnxLx5If6r7NVI/smPomsQDAUTU3bN6Ozv34=;
        b=sGUH3eh6tiRciaYXlJTe5H/6lLk2meCqcCzdbln6g9n4H7ynWrgDnNz2FdXfAdXBN9
         /3zmYijeADs801n+edEcWD7Hb1plnfryWs/zshxjChHTmJTc29nGH+r4wBnZEEk+PPl7
         5ZOU29/ibc1WWBn86oFP6Jx6F+zK8IDrKAoragZobpEcgftGgSZoRBt8sKyg4BYr6WaD
         +kMVpPnasdNGEjWm9Jg7W1EDvxjOB1S7cnb51wQMaSTAAopWkF+17nkadtJY9EzMn7O9
         aE2WHR23sPXS3RKPhcHQKSxJl2dCnJ/XnQtRYWCRj/XavYROKDAVFbUXw9jVKKkGLsdM
         FJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688961017; x=1691553017;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EWiLnCPnxLx5If6r7NVI/smPomsQDAUTU3bN6Ozv34=;
        b=EwkL3LC7s77VW5xOK2gqSTtYefWkOJeDWHgJXomm+yBfJ+bAjEqryofrXEVAobNues
         QJEZLXFkL42itsfvzfV/6Uw4V2mxzp5BqwJ+VfJQXEbT0uL/x33aBBAWFCVkFsx1hSTN
         nSXWCKtGeM7/wchTacDU0jsoyQAe9DOOr+EvkKMBqXaG1vkPNVm9AKBcZtao6gcTbsLc
         TJ1XfvVYOJGkwTzurtLCN8Jtuh5nbu0eJAHNkB9wq6qbWvmCnDpXKBI+i9MVzJNnjbEV
         ZBnCBB1TUG5bxvkVPuYSPysmVcHukNPeUwN0Ccl9kIqKvHLqT6tzS8mvaxMJM5iHoQSm
         QTOA==
X-Gm-Message-State: ABy/qLbNQ5pXUzIbISYXhnLBJlJo7SzEFfbaBEeHg8K0czOq5uirqi7W
        n4YFLwUDQmgaHlpsjACarcDsvOaBjmUgYEiPhRAWtg==
X-Google-Smtp-Source: APBJJlF0hH78qvFwkCnoy0zoZxTmgqEmEcjAeR52/N07mg48bqVnJkW5ySXAAeHek9QV/Xg/2cdiGw==
X-Received: by 2002:a05:6a21:328a:b0:122:15e9:2c78 with SMTP id yt10-20020a056a21328a00b0012215e92c78mr11749268pzb.5.1688961016188;
        Sun, 09 Jul 2023 20:50:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d12-20020a63360c000000b00513cc8c9597sm6255835pga.10.2023.07.09.20.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:50:15 -0700 (PDT)
Message-ID: <64ab7ff7.630a0220.210d5.bbf9@mx.google.com>
Date:   Sun, 09 Jul 2023 20:50:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.5-rc1-146-g2654f2b00aa0
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 263 runs,
 23 regressions (v6.5-rc1-146-g2654f2b00aa0)
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

next/pending-fixes baseline: 263 runs, 23 regressions (v6.5-rc1-146-g2654f2=
b00aa0)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc1-146-g2654f2b00aa0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc1-146-g2654f2b00aa0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2654f2b00aa02e6a02f1012e265883eb8aca290d =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4858acc3981338bb2ab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ab4858acc3981338bb2=
ab7
        failing since 4 days (last pass: v6.4-11141-g4556f2dbce0d, first fa=
il: v6.4-11652-gcd77f0c9fecc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a613dbba79079bb2a9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ab4a613dbba79079bb2=
a9e
        new failure (last pass: v6.4-12115-gc3dae9b3ad97) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab483e832bd6b5e5bb2a8e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab483e832bd6b5e5bb2a93
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:52:53.872929  + set +x

    2023-07-09T23:52:53.879743  <8>[   10.409431] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051375_1.4.2.3.1>

    2023-07-09T23:52:53.981694  =


    2023-07-09T23:52:54.082294  / # #export SHELL=3D/bin/sh

    2023-07-09T23:52:54.082490  =


    2023-07-09T23:52:54.182995  / # export SHELL=3D/bin/sh. /lava-11051375/=
environment

    2023-07-09T23:52:54.183203  =


    2023-07-09T23:52:54.283827  / # . /lava-11051375/environment/lava-11051=
375/bin/lava-test-runner /lava-11051375/1

    2023-07-09T23:52:54.284152  =


    2023-07-09T23:52:54.289661  / # /lava-11051375/bin/lava-test-runner /la=
va-11051375/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a39e15b4cf85fbb2a8e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a39e15b4cf85fbb2a93
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:00:45.814331  + set +x

    2023-07-10T00:00:45.821066  <8>[   10.507215] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051465_1.4.2.3.1>

    2023-07-10T00:00:45.925012  / # #

    2023-07-10T00:00:46.025597  export SHELL=3D/bin/sh

    2023-07-10T00:00:46.025756  #

    2023-07-10T00:00:46.126301  / # export SHELL=3D/bin/sh. /lava-11051465/=
environment

    2023-07-10T00:00:46.126478  =


    2023-07-10T00:00:46.226988  / # . /lava-11051465/environment/lava-11051=
465/bin/lava-test-runner /lava-11051465/1

    2023-07-10T00:00:46.227246  =


    2023-07-10T00:00:46.233491  / # /lava-11051465/bin/lava-test-runner /la=
va-11051465/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4831547eb0f6b7bb2a75

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4831547eb0f6b7bb2a7a
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:52:12.091494  + set<8>[   11.756311] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11051389_1.4.2.3.1>

    2023-07-09T23:52:12.092117   +x

    2023-07-09T23:52:12.201181  / # #

    2023-07-09T23:52:12.303926  export SHELL=3D/bin/sh

    2023-07-09T23:52:12.304822  #

    2023-07-09T23:52:12.406501  / # export SHELL=3D/bin/sh. /lava-11051389/=
environment

    2023-07-09T23:52:12.407357  =


    2023-07-09T23:52:12.509085  / # . /lava-11051389/environment/lava-11051=
389/bin/lava-test-runner /lava-11051389/1

    2023-07-09T23:52:12.510648  =


    2023-07-09T23:52:12.514762  / # /lava-11051389/bin/lava-test-runner /la=
va-11051389/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a4de9c170a52abb2aaf

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a4de9c170a52abb2ab4
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:00:52.679815  + set<8>[    8.893540] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11051518_1.4.2.3.1>

    2023-07-10T00:00:52.679891   +x

    2023-07-10T00:00:52.783971  / # #

    2023-07-10T00:00:52.884593  export SHELL=3D/bin/sh

    2023-07-10T00:00:52.884814  #

    2023-07-10T00:00:52.985332  / # export SHELL=3D/bin/sh. /lava-11051518/=
environment

    2023-07-10T00:00:52.985474  =


    2023-07-10T00:00:53.085968  / # . /lava-11051518/environment/lava-11051=
518/bin/lava-test-runner /lava-11051518/1

    2023-07-10T00:00:53.086200  =


    2023-07-10T00:00:53.090844  / # /lava-11051518/bin/lava-test-runner /la=
va-11051518/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab484247e7c8dd0abb2a8a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab484247e7c8dd0abb2a8f
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:52:26.521914  <8>[    7.777422] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051414_1.4.2.3.1>

    2023-07-09T23:52:26.525357  + set +x

    2023-07-09T23:52:26.633553  / # #

    2023-07-09T23:52:26.735029  export SHELL=3D/bin/sh

    2023-07-09T23:52:26.735471  #

    2023-07-09T23:52:26.836453  / # export SHELL=3D/bin/sh. /lava-11051414/=
environment

    2023-07-09T23:52:26.837115  =


    2023-07-09T23:52:26.938463  / # . /lava-11051414/environment/lava-11051=
414/bin/lava-test-runner /lava-11051414/1

    2023-07-09T23:52:26.939845  =


    2023-07-09T23:52:26.945073  / # /lava-11051414/bin/lava-test-runner /la=
va-11051414/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a39aed7bbb849bb2a76

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a39aed7bbb849bb2a7b
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:00:41.740454  <8>[   10.862413] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051461_1.4.2.3.1>

    2023-07-10T00:00:41.743742  + set +x

    2023-07-10T00:00:41.845198  =


    2023-07-10T00:00:41.945744  / # #export SHELL=3D/bin/sh

    2023-07-10T00:00:41.945894  =


    2023-07-10T00:00:42.046412  / # export SHELL=3D/bin/sh. /lava-11051461/=
environment

    2023-07-10T00:00:42.046564  =


    2023-07-10T00:00:42.147026  / # . /lava-11051461/environment/lava-11051=
461/bin/lava-test-runner /lava-11051461/1

    2023-07-10T00:00:42.147251  =


    2023-07-10T00:00:42.152148  / # /lava-11051461/bin/lava-test-runner /la=
va-11051461/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4831a09deecdb5bb2a9f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4831a09deecdb5bb2aa4
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:52:08.923470  + set +x

    2023-07-09T23:52:08.929977  <8>[   10.169297] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051400_1.4.2.3.1>

    2023-07-09T23:52:09.037072  / # #

    2023-07-09T23:52:09.139320  export SHELL=3D/bin/sh

    2023-07-09T23:52:09.140134  #

    2023-07-09T23:52:09.241526  / # export SHELL=3D/bin/sh. /lava-11051400/=
environment

    2023-07-09T23:52:09.242255  =


    2023-07-09T23:52:09.343728  / # . /lava-11051400/environment/lava-11051=
400/bin/lava-test-runner /lava-11051400/1

    2023-07-09T23:52:09.345135  =


    2023-07-09T23:52:09.350299  / # /lava-11051400/bin/lava-test-runner /la=
va-11051400/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a3ae9c170a52abb2a83

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a3ae9c170a52abb2a88
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:00:42.316851  + set +x

    2023-07-10T00:00:42.323246  <8>[   10.263936] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051473_1.4.2.3.1>

    2023-07-10T00:00:42.329979  <6>[   10.271506] sh (158) used greatest st=
ack depth: 13304 bytes left

    2023-07-10T00:00:42.435759  / # #

    2023-07-10T00:00:42.536837  export SHELL=3D/bin/sh

    2023-07-10T00:00:42.537548  #

    2023-07-10T00:00:42.639248  / # export SHELL=3D/bin/sh. /lava-11051473/=
environment

    2023-07-10T00:00:42.639813  =


    2023-07-10T00:00:42.740940  / # . /lava-11051473/environment/lava-11051=
473/bin/lava-test-runner /lava-11051473/1

    2023-07-10T00:00:42.741875  =

 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab481cc4164bcc2fbb2a9d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab481cc4164bcc2fbb2aa2
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:51:40.963147  <8>[    8.032318] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051364_1.4.2.3.1>

    2023-07-09T23:51:40.966717  + set +x

    2023-07-09T23:51:41.068007  #

    2023-07-09T23:51:41.068354  =


    2023-07-09T23:51:41.169356  / # #export SHELL=3D/bin/sh

    2023-07-09T23:51:41.169567  =


    2023-07-09T23:51:41.270211  / # export SHELL=3D/bin/sh. /lava-11051364/=
environment

    2023-07-09T23:51:41.270408  =


    2023-07-09T23:51:41.370982  / # . /lava-11051364/environment/lava-11051=
364/bin/lava-test-runner /lava-11051364/1

    2023-07-09T23:51:41.371254  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a39aed7bbb849bb2a81

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a39aed7bbb849bb2a86
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:00:43.039951  <8>[   10.084382] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11051517_1.4.2.3.1>

    2023-07-10T00:00:43.042754  + set +x

    2023-07-10T00:00:43.144022  #

    2023-07-10T00:00:43.244845  / # #export SHELL=3D/bin/sh

    2023-07-10T00:00:43.245046  =


    2023-07-10T00:00:43.345668  / # export SHELL=3D/bin/sh. /lava-11051517/=
environment

    2023-07-10T00:00:43.345887  =


    2023-07-10T00:00:43.446439  / # . /lava-11051517/environment/lava-11051=
517/bin/lava-test-runner /lava-11051517/1

    2023-07-10T00:00:43.446783  =


    2023-07-10T00:00:43.451291  / # /lava-11051517/bin/lava-test-runner /la=
va-11051517/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4830a09deecdb5bb2a91

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4830a09deecdb5bb2a96
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:52:07.953790  + set<8>[   11.399963] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11051381_1.4.2.3.1>

    2023-07-09T23:52:07.954259   +x

    2023-07-09T23:52:08.061913  / # #

    2023-07-09T23:52:08.164067  export SHELL=3D/bin/sh

    2023-07-09T23:52:08.164734  #

    2023-07-09T23:52:08.266161  / # export SHELL=3D/bin/sh. /lava-11051381/=
environment

    2023-07-09T23:52:08.266832  =


    2023-07-09T23:52:08.368293  / # . /lava-11051381/environment/lava-11051=
381/bin/lava-test-runner /lava-11051381/1

    2023-07-09T23:52:08.369456  =


    2023-07-09T23:52:08.374781  / # /lava-11051381/bin/lava-test-runner /la=
va-11051381/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a5c2e04c997eabb2a9c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a5c2e04c997eabb2aa1
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:01:16.939104  + set<8>[   11.296990] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11051479_1.4.2.3.1>

    2023-07-10T00:01:16.939575   +x

    2023-07-10T00:01:17.047818  / # #

    2023-07-10T00:01:17.150200  export SHELL=3D/bin/sh

    2023-07-10T00:01:17.150984  #

    2023-07-10T00:01:17.252441  / # export SHELL=3D/bin/sh. /lava-11051479/=
environment

    2023-07-10T00:01:17.253173  =


    2023-07-10T00:01:17.354697  / # . /lava-11051479/environment/lava-11051=
479/bin/lava-test-runner /lava-11051479/1

    2023-07-10T00:01:17.355990  =


    2023-07-10T00:01:17.361133  / # /lava-11051479/bin/lava-test-runner /la=
va-11051479/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4f232696ecbf7bbb2a9e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4f232696ecbf7bbb2aa3
        failing since 74 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-07-10T00:21:43.762528  <8>[    7.921562] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3717852_1.5.2.4.1>
    2023-07-10T00:21:43.872191  / # #
    2023-07-10T00:21:43.975999  export SHELL=3D/bin/sh
    2023-07-10T00:21:43.977166  #
    2023-07-10T00:21:44.079385  / # export SHELL=3D/bin/sh. /lava-3717852/e=
nvironment
    2023-07-10T00:21:44.080550  =

    2023-07-10T00:21:44.183067  / # . /lava-3717852/environment/lava-371785=
2/bin/lava-test-runner /lava-3717852/1
    2023-07-10T00:21:44.185105  =

    2023-07-10T00:21:44.233528  / # /lava-3717852/bin/lava-test-runner /lav=
a-3717852/1
    2023-07-10T00:21:44.238935  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab481ca09deecdb5bb2a76

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab481ca09deecdb5bb2a7b
        failing since 103 days (last pass: v6.3-rc3-550-g902f54bbd6c7, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-09T23:51:54.347742  + set +x<8>[   11.374387] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11051370_1.4.2.3.1>

    2023-07-09T23:51:54.347834  =


    2023-07-09T23:51:54.452227  / # #

    2023-07-09T23:51:54.552835  export SHELL=3D/bin/sh

    2023-07-09T23:51:54.553064  #

    2023-07-09T23:51:54.653576  / # export SHELL=3D/bin/sh. /lava-11051370/=
environment

    2023-07-09T23:51:54.653762  =


    2023-07-09T23:51:54.754338  / # . /lava-11051370/environment/lava-11051=
370/bin/lava-test-runner /lava-11051370/1

    2023-07-09T23:51:54.754616  =


    2023-07-09T23:51:54.759870  / # /lava-11051370/bin/lava-test-runner /la=
va-11051370/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4a39e9c170a52abb2a75

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab4a39e9c170a52abb2a7a
        failing since 103 days (last pass: v6.3-rc3-370-g8269040171a02, fir=
st fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-10T00:00:49.325200  + <8>[   12.166431] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11051469_1.4.2.3.1>

    2023-07-10T00:00:49.325286  set +x

    2023-07-10T00:00:49.429194  / # #

    2023-07-10T00:00:49.529785  export SHELL=3D/bin/sh

    2023-07-10T00:00:49.529951  #

    2023-07-10T00:00:49.630440  / # export SHELL=3D/bin/sh. /lava-11051469/=
environment

    2023-07-10T00:00:49.630611  =


    2023-07-10T00:00:49.731162  / # . /lava-11051469/environment/lava-11051=
469/bin/lava-test-runner /lava-11051469/1

    2023-07-10T00:00:49.731476  =


    2023-07-10T00:00:49.735937  / # /lava-11051469/bin/lava-test-runner /la=
va-11051469/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4c41b7b8b2e99ebb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ab4c41b7b8b2e99ebb2=
a76
        new failure (last pass: v6.4-11652-gcd77f0c9fecc) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4c3e1220e24229bb2a79

  Results:     182 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-simple-dp-aux-probed: https://kernelci.org/test/c=
ase/id/64ab4c3e1220e24229bb2ac0
        failing since 5 days (last pass: v6.4-8718-g6b8b1f7dba504, first fa=
il: v6.4-11141-g4556f2dbce0d)

    2023-07-10T00:09:14.066739  <8>[   23.046225] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-driver-present RESULT=3Dpass>

    2023-07-10T00:09:15.079370  /lava-11051592/1/../bin/lava-test-case

    2023-07-10T00:09:15.089098  <8>[   24.069812] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab48ac9ab4852006bb2a96

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ab48ac9ab4852006bb2a9b
        failing since 158 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-09T23:54:01.527292  [   29.698800] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3717778_1.5.2.4.1>
    2023-07-09T23:54:01.631875  =

    2023-07-09T23:54:01.733593  / # #export SHELL=3D/bin/sh
    2023-07-09T23:54:01.734246  =

    2023-07-09T23:54:01.836075  / # export SHELL=3D/bin/sh. /lava-3717778/e=
nvironment
    2023-07-09T23:54:01.836469  =

    2023-07-09T23:54:01.937839  / # . /lava-3717778/environment/lava-371777=
8/bin/lava-test-runner /lava-3717778/1
    2023-07-09T23:54:01.938662  =

    2023-07-09T23:54:01.942088  / # /lava-3717778/bin/lava-test-runner /lav=
a-3717778/1
    2023-07-09T23:54:01.978314  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab4d1a9262a2f502bb2ace

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ab4d1a9262a2f502bb2=
acf
        failing since 11 days (last pass: v6.4-rc7-318-gd779731ecfed, first=
 fail: v6.4-4072-ge8f5f1933319) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab51179037edbf40bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ab51179037edbf40bb2=
a76
        failing since 12 days (last pass: v6.4-rc7-318-gd779731ecfed, first=
 fail: v6.4-1651-gf52dd2890422) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64ab5016d785e5f3d8bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-14=
6-g2654f2b00aa0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ab5016d785e5f3d8bb2=
a76
        new failure (last pass: v6.4-12294-g066a64c121be) =

 =20
