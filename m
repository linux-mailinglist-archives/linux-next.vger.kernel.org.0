Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A081749714
	for <lists+linux-next@lfdr.de>; Thu,  6 Jul 2023 10:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbjGFIGf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Jul 2023 04:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjGFIGf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jul 2023 04:06:35 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB98124
        for <linux-next@vger.kernel.org>; Thu,  6 Jul 2023 01:06:32 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1b3da531a56so481526fac.1
        for <linux-next@vger.kernel.org>; Thu, 06 Jul 2023 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1688630791; x=1691222791;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fBIGabBS0BEorftI5OZwucNic5JmMo0X1EiFUMedlM4=;
        b=aGA1Yl7n5gtNTiRCmWjFe6xyHIZbK0KWW3D4E76DSx/pk6Q6Pxh0s09SF2Hn0xZgHy
         GvLLafsjhS8ZgK0wfLVlzejKvCXAGvvL+3l0snd2QA2QjMN9/pFFHoI4/9vp6arne1WT
         vC+gxKVqRxW96AF6DtX2shy1U8F9SkCZOvFLAtPnqB8d74BJZvoKFJNC020MoLO0We5l
         Jofl3pLwcK/uhbvZysZnxkF58RnF8ZBCzKdfF6Y7/Pz17dSc76TC7+LZgOo9szVP+cCB
         HtZvy9+Aq8osExNNfLmqFgRz/aQdN/kqTe+ctR6Qd3DOYtOo+ykB9ZLEVtjfRK1bZwpr
         aG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688630791; x=1691222791;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBIGabBS0BEorftI5OZwucNic5JmMo0X1EiFUMedlM4=;
        b=UYo8Y0grMQobaJ7cvcvALm54vj/9BRLj7AF3oYkg0rRt6dmdK5MOI4Jg4NQt21k/dO
         lZqj2HundA8SLUY1TmMj4igDGI0Md4Rs2MpN2qCFwaYvbwUv4Jbn5uFn2x4YHsEjtVNI
         zCQALR9En7pH/PxZcav4Va4jlJyWqQrm8IMDWjBfPOWrApL3U32ac37JqxMEOcSS7xnz
         HK89orI5lUE/YDJ48i1K4v51+sdBysQT6peMyoAA9QrzbimadPXDd7tSL4+k1xd6pZ77
         CILUN2al2P4XF/b5P5Tyxky/UwFMs24rhP45cEJHyBiRd3c3vVCbvtnxLwbsS2cyi580
         lWXg==
X-Gm-Message-State: ABy/qLZZGq1zEm0Mj8AFb98apcuSg/J469ZJa1ZRrNKSLDpBnIlf19nN
        F+nuokH5t9Yaydr3TEAeJycwxnkLg54I8gntg6xrNw==
X-Google-Smtp-Source: APBJJlG9GT5P6B59/nqtq9q93K7DSXMEC+4c6l6t3CbyllWw/YiGTJ3sk67oRdPf9WDYX44HXsoc4g==
X-Received: by 2002:a05:6870:7389:b0:18e:b6d5:7451 with SMTP id z9-20020a056870738900b0018eb6d57451mr1798930oam.13.1688630790662;
        Thu, 06 Jul 2023 01:06:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z92-20020a17090a6d6500b00263dccf96a3sm813164pjj.54.2023.07.06.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:06:29 -0700 (PDT)
Message-ID: <64a67605.170a0220.896cc.1a76@mx.google.com>
Date:   Thu, 06 Jul 2023 01:06:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230706
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
Subject: next/master baseline: 270 runs, 21 regressions (next-20230706)
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

next/master baseline: 270 runs, 21 regressions (next-20230706)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230706/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230706
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c36ac601a98fb148147640bae219108ee81566f8 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6410aa6d5f04413bb2a96

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-chromebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-chromebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a6410aa6d5f04413bb2=
a97
        failing since 0 day (last pass: next-20230704, first fail: next-202=
30705) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a639c857e605bd3bbb2a9c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a639c857e605bd3bbb2aa1
        failing since 99 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-07-06T03:49:06.450229  <8>[   10.128433] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11026118_1.4.2.3.1>

    2023-07-06T03:49:06.453083  + set +x

    2023-07-06T03:49:06.554719  =


    2023-07-06T03:49:06.655244  / # #export SHELL=3D/bin/sh

    2023-07-06T03:49:06.655492  =


    2023-07-06T03:49:06.755997  / # export SHELL=3D/bin/sh. /lava-11026118/=
environment

    2023-07-06T03:49:06.756179  =


    2023-07-06T03:49:06.856657  / # . /lava-11026118/environment/lava-11026=
118/bin/lava-test-runner /lava-11026118/1

    2023-07-06T03:49:06.856929  =


    2023-07-06T03:49:06.861433  / # /lava-11026118/bin/lava-test-runner /la=
va-11026118/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a641849b698f717abb2a75

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a641849b698f717abb2a7a
        failing since 99 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-07-06T04:22:16.524645  + set +x

    2023-07-06T04:22:16.531565  <8>[   10.834588] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11026555_1.4.2.3.1>

    2023-07-06T04:22:16.636153  / # #

    2023-07-06T04:22:16.736900  export SHELL=3D/bin/sh

    2023-07-06T04:22:16.737115  #

    2023-07-06T04:22:16.837648  / # export SHELL=3D/bin/sh. /lava-11026555/=
environment

    2023-07-06T04:22:16.837865  =


    2023-07-06T04:22:16.938403  / # . /lava-11026555/environment/lava-11026=
555/bin/lava-test-runner /lava-11026555/1

    2023-07-06T04:22:16.938725  =


    2023-07-06T04:22:16.943706  / # /lava-11026555/bin/lava-test-runner /la=
va-11026555/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a639b0838714ffc9bb2a82

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a639b0838714ffc9bb2a87
        failing since 99 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-07-06T03:48:53.378993  <8>[    9.888123] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11026146_1.4.2.3.1>

    2023-07-06T03:48:53.382504  + set +x

    2023-07-06T03:48:53.487843  =


    2023-07-06T03:48:53.589684  / # #export SHELL=3D/bin/sh

    2023-07-06T03:48:53.590290  =


    2023-07-06T03:48:53.691780  / # export SHELL=3D/bin/sh. /lava-11026146/=
environment

    2023-07-06T03:48:53.692391  =


    2023-07-06T03:48:53.793935  / # . /lava-11026146/environment/lava-11026=
146/bin/lava-test-runner /lava-11026146/1

    2023-07-06T03:48:53.794970  =


    2023-07-06T03:48:53.800199  / # /lava-11026146/bin/lava-test-runner /la=
va-11026146/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a640e969d5d5e1a1bb2b8d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a640e969d5d5e1a1bb2b92
        failing since 99 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-07-06T04:19:32.281260  <8>[   11.201180] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11026580_1.4.2.3.1>

    2023-07-06T04:19:32.284931  + set +x

    2023-07-06T04:19:32.389588  #

    2023-07-06T04:19:32.390504  =


    2023-07-06T04:19:32.492174  / # #export SHELL=3D/bin/sh

    2023-07-06T04:19:32.492827  =


    2023-07-06T04:19:32.594202  / # export SHELL=3D/bin/sh. /lava-11026580/=
environment

    2023-07-06T04:19:32.594886  =


    2023-07-06T04:19:32.696293  / # . /lava-11026580/environment/lava-11026=
580/bin/lava-test-runner /lava-11026580/1

    2023-07-06T04:19:32.696748  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6399e47775e709dbb2ac3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6399e47775e709dbb2ac8
        failing since 99 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-07-06T03:48:38.804452  + set +x

    2023-07-06T03:48:38.810703  <8>[   10.713737] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11026091_1.4.2.3.1>

    2023-07-06T03:48:38.915357  / # #

    2023-07-06T03:48:39.015948  export SHELL=3D/bin/sh

    2023-07-06T03:48:39.016149  #

    2023-07-06T03:48:39.116731  / # export SHELL=3D/bin/sh. /lava-11026091/=
environment

    2023-07-06T03:48:39.116919  =


    2023-07-06T03:48:39.217388  / # . /lava-11026091/environment/lava-11026=
091/bin/lava-test-runner /lava-11026091/1

    2023-07-06T03:48:39.217635  =


    2023-07-06T03:48:39.221859  / # /lava-11026091/bin/lava-test-runner /la=
va-11026091/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64a641ae1292041363bb2a79

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a641ae1292041363bb2a7e
        failing since 99 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-07-06T04:22:51.412419  + set +x

    2023-07-06T04:22:51.418490  <8>[    8.283092] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11026558_1.4.2.3.1>

    2023-07-06T04:22:51.526349  / # #

    2023-07-06T04:22:51.628156  export SHELL=3D/bin/sh

    2023-07-06T04:22:51.628494  #

    2023-07-06T04:22:51.729265  / # export SHELL=3D/bin/sh. /lava-11026558/=
environment

    2023-07-06T04:22:51.729765  =


    2023-07-06T04:22:51.830786  / # . /lava-11026558/environment/lava-11026=
558/bin/lava-test-runner /lava-11026558/1

    2023-07-06T04:22:51.832043  =


    2023-07-06T04:22:51.836500  / # /lava-11026558/bin/lava-test-runner /la=
va-11026558/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6399347775e709dbb2a8f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6399347775e709dbb2a94
        failing since 12 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-06T03:48:24.234777  + <8>[   12.106191] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11026095_1.4.2.3.1>

    2023-07-06T03:48:24.234869  set +x

    2023-07-06T03:48:24.338903  / # #

    2023-07-06T03:48:24.439517  export SHELL=3D/bin/sh

    2023-07-06T03:48:24.439728  #

    2023-07-06T03:48:24.540275  / # export SHELL=3D/bin/sh. /lava-11026095/=
environment

    2023-07-06T03:48:24.540520  =


    2023-07-06T03:48:24.641091  / # . /lava-11026095/environment/lava-11026=
095/bin/lava-test-runner /lava-11026095/1

    2023-07-06T03:48:24.641411  =


    2023-07-06T03:48:24.645956  / # /lava-11026095/bin/lava-test-runner /la=
va-11026095/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6400b62c8f6bc66bb2a9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a6400b62c8f6bc66bb2=
a9f
        failing since 295 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a64050ea4a005bdbbb2a8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a64050ea4a005bdbbb2=
a90
        failing since 295 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a63ffd62c8f6bc66bb2a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a63ffd62c8f6bc66bb2=
a85
        failing since 295 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6400cbb2b3e239abb2a88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a6400cbb2b3e239abb2=
a89
        failing since 293 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a64077ea4a005bdbbb2a9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a64077ea4a005bdbbb2=
aa0
        failing since 293 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a63ffce487846201bb2a8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a63ffce487846201bb2=
a8b
        failing since 293 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6400962c8f6bc66bb2a99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a6400962c8f6bc66bb2=
a9a
        failing since 293 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a64012854393a5f6bb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a64012854393a5f6bb2=
a76
        failing since 293 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a63ffbe487846201bb2a84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a63ffbe487846201bb2=
a85
        failing since 293 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6400abb2b3e239abb2a83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a6400abb2b3e239abb2=
a84
        failing since 295 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6404f4dfba6217bbb2a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a6404f4dfba6217bbb2=
a76
        failing since 295 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64a63ffc62c8f6bc66bb2a7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64a63ffc62c8f6bc66bb2=
a7f
        failing since 295 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | clang-13 | cros://c=
hrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/64a6400662c8f6bc66bb2a8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230706/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230706/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64a6400662c8f6bc66bb2a90
        failing since 26 days (last pass: next-20221012, first fail: next-2=
0230609)

    2023-07-06T04:15:45.857383  [    5.017303] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3713811_1.5.2.4.1>
    2023-07-06T04:15:45.964334  =

    2023-07-06T04:15:46.065997  / # #export SHELL=3D/bin/sh
    2023-07-06T04:15:46.066731  =

    2023-07-06T04:15:46.168501  / # export SHELL=3D/bin/sh. /lava-3713811/e=
nvironment
    2023-07-06T04:15:46.168930  =

    2023-07-06T04:15:46.270391  / # . /lava-3713811/environment/lava-371381=
1/bin/lava-test-runner /lava-3713811/1
    2023-07-06T04:15:46.271690  =

    2023-07-06T04:15:46.274041  / # /lava-3713811/bin/lava-test-runner /lav=
a-3713811/1
    2023-07-06T04:15:46.330439  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =20
