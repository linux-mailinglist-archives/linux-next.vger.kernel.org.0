Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA1A747BFE
	for <lists+linux-next@lfdr.de>; Wed,  5 Jul 2023 06:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjGEEKf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Jul 2023 00:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGEEKe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Jul 2023 00:10:34 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D264C10F5
        for <linux-next@vger.kernel.org>; Tue,  4 Jul 2023 21:10:30 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6682909acadso2903522b3a.3
        for <linux-next@vger.kernel.org>; Tue, 04 Jul 2023 21:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688530230; x=1691122230;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o2XL/edwp5tPBn/N9j9oJg1eqbp/khf1MTOHPKQ3cYI=;
        b=t/3L3BUxxtdT8IVCHZv3GCgfhCoPkCExSmxgVZDm7uEYwjpon2Q9hf6tAsvNpHYd99
         e6aJrTmfVabFOS1XdQ2+q+eQrksVKBq2Hdfoh1mRIvaoyC2XuNwFc4QQKMWs8RXac10h
         nI0SgdsHAtwsbzQshfrxkDeggfGP0p5fCphWmEPJEbvofBzf6RlDi6mKXNtvoxMafyr0
         YycRzQauLe8xGakGGOICSq1NZSufvlFhJHhoerXBiquS4xZdTowRit2YuvHLtZRNmXVb
         00fJcMbss5uQNY05AlwzJ0s4dQbdKY/Gqd9mRzgUR86vJXd5q/3kRmeomtMshcI+9uhv
         Ap9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688530230; x=1691122230;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2XL/edwp5tPBn/N9j9oJg1eqbp/khf1MTOHPKQ3cYI=;
        b=GHYKaLcAs3DKENiCQgk7iJqEVWqr6dN1v6ZcZ2bJSKAOXE8/yzdTUKFf5j2aUSfFQi
         FKcK1nFxl/3sE6VXVapI2eOW7/+Ry0vyWAfUtnS4E4PiK/QKrODmdxThWvWCPxfxFuy6
         SvEnuqWhhPD1VX3Mw662hiu9O1N/lYTdvRaLBq/lwbLyDlTI4eAJgEydyf2onyXEdXbw
         s5sZCIAQWQW2yC3s553GqVcbyyhNlgbsgE4cwiPZU0vxMr5fJ1hgTpe/V6R4Iu2/EVF0
         KThhkoE/X7kvo3mEA57DIZmPaHf+3xmcd9r8SEuBnd6l2keQvsE5P2aJRF4uIkGcQg0/
         RyCg==
X-Gm-Message-State: ABy/qLYNF08Bb/H5xBp0wUdBBXD224ivztBpYVLYSNDTEowRUwI9sraE
        8swxfBqey15+aQkhc7X2QgbhD/Ou9H8iRhMavox/jQ==
X-Google-Smtp-Source: APBJJlG+QO7Wsdek8aiVROA6m8mTjeFn/QWBooK/gT7cfAaHIQkaZweB0LOEKgqj2+rCAyzpQoRlrw==
X-Received: by 2002:a05:6a00:b92:b0:668:7e84:32e6 with SMTP id g18-20020a056a000b9200b006687e8432e6mr14437235pfj.29.1688530229444;
        Tue, 04 Jul 2023 21:10:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s19-20020aa78d53000000b00673e652985bsm9422229pfe.118.2023.07.04.21.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 21:10:28 -0700 (PDT)
Message-ID: <64a4ed34.a70a0220.53268.2dcc@mx.google.com>
Date:   Tue, 04 Jul 2023 21:10:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-11652-gcd77f0c9fecc
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 224 runs,
 18 regressions (v6.4-11652-gcd77f0c9fecc)
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

next/pending-fixes baseline: 224 runs, 18 regressions (v6.4-11652-gcd77f0c9=
fecc)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-11652-gcd77f0c9fecc/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-11652-gcd77f0c9fecc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cd77f0c9fecc8717adef3366486b599481457e0e =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b62ba96b79d616bb2ab3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a4b62ba96b79d616bb2=
ab4
        new failure (last pass: v6.4-11141-g4556f2dbce0d) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b9b9c6adf750b5bb2a87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-acer-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-acer-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a4b9b9c6adf750b5bb2=
a88
        new failure (last pass: v6.4-11141-g4556f2dbce0d) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b6ea511b38bb61bb2a80

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b6ea511b38bb61bb2a85
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:18:34.473608  + set +x

    2023-07-05T00:18:34.480501  <8>[    7.970960] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013426_1.4.2.3.1>

    2023-07-05T00:18:34.582425  =


    2023-07-05T00:18:34.683057  / # #export SHELL=3D/bin/sh

    2023-07-05T00:18:34.683300  =


    2023-07-05T00:18:34.783879  / # export SHELL=3D/bin/sh. /lava-11013426/=
environment

    2023-07-05T00:18:34.784122  =


    2023-07-05T00:18:34.884704  / # . /lava-11013426/environment/lava-11013=
426/bin/lava-test-runner /lava-11013426/1

    2023-07-05T00:18:34.885197  =


    2023-07-05T00:18:34.891181  / # /lava-11013426/bin/lava-test-runner /la=
va-11013426/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b9ed977dc81767bb2a76

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b9ed977dc81767bb2a7b
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:31:24.992197  <8>[    9.956923] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013695_1.4.2.3.1>

    2023-07-05T00:31:24.995622  + set +x

    2023-07-05T00:31:25.096997  #

    2023-07-05T00:31:25.097357  =


    2023-07-05T00:31:25.198050  / # #export SHELL=3D/bin/sh

    2023-07-05T00:31:25.198281  =


    2023-07-05T00:31:25.298779  / # export SHELL=3D/bin/sh. /lava-11013695/=
environment

    2023-07-05T00:31:25.298978  =


    2023-07-05T00:31:25.399450  / # . /lava-11013695/environment/lava-11013=
695/bin/lava-test-runner /lava-11013695/1

    2023-07-05T00:31:25.399792  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b5e24a4fb0cc1cbb2ab4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b5e24a4fb0cc1cbb2ab9
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:14:08.435396  + set<8>[   12.086007] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11013423_1.4.2.3.1>

    2023-07-05T00:14:08.435489   +x

    2023-07-05T00:14:08.539732  / # #

    2023-07-05T00:14:08.640341  export SHELL=3D/bin/sh

    2023-07-05T00:14:08.640529  #

    2023-07-05T00:14:08.741021  / # export SHELL=3D/bin/sh. /lava-11013423/=
environment

    2023-07-05T00:14:08.741243  =


    2023-07-05T00:14:08.841797  / # . /lava-11013423/environment/lava-11013=
423/bin/lava-test-runner /lava-11013423/1

    2023-07-05T00:14:08.842070  =


    2023-07-05T00:14:08.846712  / # /lava-11013423/bin/lava-test-runner /la=
va-11013423/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b982f3e2b7b610bb2a9e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b982f3e2b7b610bb2aa3
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:29:35.521648  + set<8>[   11.398273] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11013674_1.4.2.3.1>

    2023-07-05T00:29:35.521749   +x

    2023-07-05T00:29:35.626193  / # #

    2023-07-05T00:29:35.727028  export SHELL=3D/bin/sh

    2023-07-05T00:29:35.727704  #

    2023-07-05T00:29:35.829040  / # export SHELL=3D/bin/sh. /lava-11013674/=
environment

    2023-07-05T00:29:35.829726  =


    2023-07-05T00:29:35.931187  / # . /lava-11013674/environment/lava-11013=
674/bin/lava-test-runner /lava-11013674/1

    2023-07-05T00:29:35.932248  =


    2023-07-05T00:29:35.937236  / # /lava-11013674/bin/lava-test-runner /la=
va-11013674/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b5e6ab02103a7dbb2a81

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b5e7ab02103a7dbb2a86
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:14:11.740468  <8>[   10.766622] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013414_1.4.2.3.1>

    2023-07-05T00:14:11.743757  + set +x

    2023-07-05T00:14:11.845215  =


    2023-07-05T00:14:11.945793  / # #export SHELL=3D/bin/sh

    2023-07-05T00:14:11.946070  =


    2023-07-05T00:14:12.046651  / # export SHELL=3D/bin/sh. /lava-11013414/=
environment

    2023-07-05T00:14:12.046866  =


    2023-07-05T00:14:12.147403  / # . /lava-11013414/environment/lava-11013=
414/bin/lava-test-runner /lava-11013414/1

    2023-07-05T00:14:12.147741  =


    2023-07-05T00:14:12.152635  / # /lava-11013414/bin/lava-test-runner /la=
va-11013414/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b9d0c6adf750b5bb2a9c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b9d0c6adf750b5bb2aa1
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:30:51.620013  <8>[   11.279236] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013704_1.4.2.3.1>

    2023-07-05T00:30:51.622876  + set +x

    2023-07-05T00:30:51.724681  =


    2023-07-05T00:30:51.825391  / # #export SHELL=3D/bin/sh

    2023-07-05T00:30:51.825574  =


    2023-07-05T00:30:51.926202  / # export SHELL=3D/bin/sh. /lava-11013704/=
environment

    2023-07-05T00:30:51.927110  =


    2023-07-05T00:30:52.029062  / # . /lava-11013704/environment/lava-11013=
704/bin/lava-test-runner /lava-11013704/1

    2023-07-05T00:30:52.030334  =


    2023-07-05T00:30:52.035343  / # /lava-11013704/bin/lava-test-runner /la=
va-11013704/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b70fe5161acfdfbb2a9a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b70fe5161acfdfbb2a9f
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:19:13.392480  + set +x

    2023-07-05T00:19:13.399245  <8>[   11.201126] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013469_1.4.2.3.1>

    2023-07-05T00:19:13.503747  / # #

    2023-07-05T00:19:13.604390  export SHELL=3D/bin/sh

    2023-07-05T00:19:13.604580  #

    2023-07-05T00:19:13.705123  / # export SHELL=3D/bin/sh. /lava-11013469/=
environment

    2023-07-05T00:19:13.705323  =


    2023-07-05T00:19:13.805828  / # . /lava-11013469/environment/lava-11013=
469/bin/lava-test-runner /lava-11013469/1

    2023-07-05T00:19:13.806103  =


    2023-07-05T00:19:13.810785  / # /lava-11013469/bin/lava-test-runner /la=
va-11013469/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4bbbb820ca9dda9bb2a91

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4bbbb820ca9dda9bb2a96
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:39:16.133106  + set +x

    2023-07-05T00:39:16.139709  <8>[   11.037985] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013708_1.4.2.3.1>

    2023-07-05T00:39:16.244357  / # #

    2023-07-05T00:39:16.344925  export SHELL=3D/bin/sh

    2023-07-05T00:39:16.345100  #

    2023-07-05T00:39:16.445586  / # export SHELL=3D/bin/sh. /lava-11013708/=
environment

    2023-07-05T00:39:16.445761  =


    2023-07-05T00:39:16.546285  / # . /lava-11013708/environment/lava-11013=
708/bin/lava-test-runner /lava-11013708/1

    2023-07-05T00:39:16.546572  =


    2023-07-05T00:39:16.551188  / # /lava-11013708/bin/lava-test-runner /la=
va-11013708/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b6871a8e269445bb2b0f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b6871a8e269445bb2b14
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:16:53.014081  <8>[   10.485961] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013494_1.4.2.3.1>

    2023-07-05T00:16:53.017210  + set +x

    2023-07-05T00:16:53.124764  / # #

    2023-07-05T00:16:53.226779  export SHELL=3D/bin/sh

    2023-07-05T00:16:53.227485  #

    2023-07-05T00:16:53.328774  / # export SHELL=3D/bin/sh. /lava-11013494/=
environment

    2023-07-05T00:16:53.329530  =


    2023-07-05T00:16:53.431209  / # . /lava-11013494/environment/lava-11013=
494/bin/lava-test-runner /lava-11013494/1

    2023-07-05T00:16:53.432547  =


    2023-07-05T00:16:53.438222  / # /lava-11013494/bin/lava-test-runner /la=
va-11013494/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4ba5dce27663dfcbb2bac

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4ba5dce27663dfcbb2bb1
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:33:48.896396  + set +x

    2023-07-05T00:33:48.902508  <8>[   10.921624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11013659_1.4.2.3.1>

    2023-07-05T00:33:49.006537  / # #

    2023-07-05T00:33:49.107692  export SHELL=3D/bin/sh

    2023-07-05T00:33:49.108385  #

    2023-07-05T00:33:49.209731  / # export SHELL=3D/bin/sh. /lava-11013659/=
environment

    2023-07-05T00:33:49.209911  =


    2023-07-05T00:33:49.310413  / # . /lava-11013659/environment/lava-11013=
659/bin/lava-test-runner /lava-11013659/1

    2023-07-05T00:33:49.310650  =


    2023-07-05T00:33:49.315690  / # /lava-11013659/bin/lava-test-runner /la=
va-11013659/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b5e2ab02103a7dbb2a76

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b5e2ab02103a7dbb2a7b
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:14:09.736870  + set<8>[   11.543234] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11013427_1.4.2.3.1>

    2023-07-05T00:14:09.737403   +x

    2023-07-05T00:14:09.844676  / # #

    2023-07-05T00:14:09.946846  export SHELL=3D/bin/sh

    2023-07-05T00:14:09.947533  #

    2023-07-05T00:14:10.049051  / # export SHELL=3D/bin/sh. /lava-11013427/=
environment

    2023-07-05T00:14:10.049870  =


    2023-07-05T00:14:10.151427  / # . /lava-11013427/environment/lava-11013=
427/bin/lava-test-runner /lava-11013427/1

    2023-07-05T00:14:10.152565  =


    2023-07-05T00:14:10.157544  / # /lava-11013427/bin/lava-test-runner /la=
va-11013427/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b9909f35bcfd1dbb2acd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b9909f35bcfd1dbb2ad2
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:29:43.115580  + set<8>[   10.897852] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11013689_1.4.2.3.1>

    2023-07-05T00:29:43.115697   +x

    2023-07-05T00:29:43.219658  / # #

    2023-07-05T00:29:43.320296  export SHELL=3D/bin/sh

    2023-07-05T00:29:43.320524  #

    2023-07-05T00:29:43.421084  / # export SHELL=3D/bin/sh. /lava-11013689/=
environment

    2023-07-05T00:29:43.421321  =


    2023-07-05T00:29:43.521870  / # . /lava-11013689/environment/lava-11013=
689/bin/lava-test-runner /lava-11013689/1

    2023-07-05T00:29:43.522199  =


    2023-07-05T00:29:43.526751  / # /lava-11013689/bin/lava-test-runner /la=
va-11013689/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b5cb46fa2bf23cbb2aa5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b5cb46fa2bf23cbb2aaa
        failing since 98 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:13:59.286370  + set +x<8>[   11.701991] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11013418_1.4.2.3.1>

    2023-07-05T00:13:59.286462  =


    2023-07-05T00:13:59.390897  / # #

    2023-07-05T00:13:59.491549  export SHELL=3D/bin/sh

    2023-07-05T00:13:59.491747  #

    2023-07-05T00:13:59.592250  / # export SHELL=3D/bin/sh. /lava-11013418/=
environment

    2023-07-05T00:13:59.592497  =


    2023-07-05T00:13:59.693058  / # . /lava-11013418/environment/lava-11013=
418/bin/lava-test-runner /lava-11013418/1

    2023-07-05T00:13:59.693367  =


    2023-07-05T00:13:59.698343  / # /lava-11013418/bin/lava-test-runner /la=
va-11013418/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b98f9f35bcfd1dbb2ac2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a4b98f9f35bcfd1dbb2ac7
        failing since 98 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-07-05T00:29:54.605181  + set +x<8>[   11.496695] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 11013716_1.4.2.3.1>

    2023-07-05T00:29:54.605765  =


    2023-07-05T00:29:54.714161  / # #

    2023-07-05T00:29:54.816651  export SHELL=3D/bin/sh

    2023-07-05T00:29:54.817357  #

    2023-07-05T00:29:54.918618  / # export SHELL=3D/bin/sh. /lava-11013716/=
environment

    2023-07-05T00:29:54.919278  =


    2023-07-05T00:29:55.020567  / # . /lava-11013716/environment/lava-11013=
716/bin/lava-test-runner /lava-11013716/1

    2023-07-05T00:29:55.021103  =


    2023-07-05T00:29:55.025373  / # /lava-11013716/bin/lava-test-runner /la=
va-11013716/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b555b0fba5e7f9bb2bc9

  Results:     182 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-simple-dp-aux-probed: https://kernelci.org/test/c=
ase/id/64a4b555b0fba5e7f9bb2c10
        failing since 0 day (last pass: v6.4-8718-g6b8b1f7dba504, first fai=
l: v6.4-11141-g4556f2dbce0d)

    2023-07-05T00:11:48.434342  /lava-11013342/1/../bin/lava-test-case

    2023-07-05T00:11:48.444233  <8>[   24.100405] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_mips-malta              | mips   | lab-collabora | gcc-10   | malta_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64a4b40eced0b25bb3bb2a83

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-=
malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-11652-=
gcd77f0c9fecc/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-=
malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64a4b40eced0b25=
bb3bb2a8b
        new failure (last pass: v6.4-11141-g4556f2dbce0d)
        1 lines

    2023-07-05T00:06:14.617714  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 3972735c, epc =3D=3D 801ffaa8, ra =3D=
=3D 802022d0
    2023-07-05T00:06:14.617940  =


    2023-07-05T00:06:14.647700  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-07-05T00:06:14.647920  =

   =

 =20
