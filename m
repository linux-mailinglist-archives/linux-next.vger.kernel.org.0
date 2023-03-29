Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8B46CD430
	for <lists+linux-next@lfdr.de>; Wed, 29 Mar 2023 10:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjC2IPV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Mar 2023 04:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjC2IO5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2023 04:14:57 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC524C07
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2023 01:14:42 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id iw3so14201024plb.6
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2023 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680077682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A9ICLOn6IKOqOCyjeM9qYLY6kon0mPSELyv14HAdHwc=;
        b=Pzfr471ClZZ71Kc/TUt4ykVAJP7dS1H1q7pleRKfdZO6MS04B6cUpPBWN6wXerO6iJ
         hjEX+/8hq8Z5kAD7br+7SnhIZ85uIa+rE6QnhS19FTMJfQpI+BPIpTmS+GYXKux//Lhw
         4cykmnGGU5G6DjLeNKzpez6pPr8klq9nNXGN9S65+KC/d1aXCdEPcsn+13GLH2tAa8S0
         QchGd9PNefdnls0tjMYjiTS3LtGzqwYER1ebTkhHCsGx98KjbLld1acDIVjh5YLyk68C
         VbGwGH87TarMAONRigxkVkznftCsNKgnuXroOl2RISxARaOffbp9A2jOk/2JkC8xH9xu
         J7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680077682;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9ICLOn6IKOqOCyjeM9qYLY6kon0mPSELyv14HAdHwc=;
        b=kPPaYf7vCbV+HXtOCktZESL/MQ1v9DUnEjI5s5ADs9vG1VPtZ8Q8wR43JuM7gxgKzY
         nC/SMPi4pmksOCMcvgIG4HQiotj901XKK3ANugQGf/nni8qcGhcC4Ic7ejWUW8nAaOPA
         tlN99lsWpkZ/4Fzh6c2IjAAJmtTjYVrozsqG+P4wneSM9ibrZBvqi9FmTyPKL3eo0RkU
         kJIwuh0u2Brgm9nPhxTz52uyHw5fBZe2w7n9zshNgmO67cXoSxNrhPAXs7OilZFVg4xO
         /RI/Q3mh+MbJ/uRO87vYzjaVSNdyOkzZxPz5ArpoOE7REO6X/ZPgaCQkSSq/jyf2nWgc
         HNGQ==
X-Gm-Message-State: AAQBX9fJqWCUAlNYGqhmCPosqzEYxrBju9ZplEX6G+aaBAXWwAgajb6i
        l18N8TKjXNfHnjAkX9YLpMWMvuOGZd+nxrd4dGA3MA==
X-Google-Smtp-Source: AKy350axrYKa5Kc8+2sk59GCtckcGDE8ZA8llIQOkAvF7f7zr34oAqdrSZ6cUxKGNPdv36pqfKjwaw==
X-Received: by 2002:a17:902:e30b:b0:1a1:7c2b:4aea with SMTP id q11-20020a170902e30b00b001a17c2b4aeamr13882970plc.0.1680077681831;
        Wed, 29 Mar 2023 01:14:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r13-20020a63e50d000000b004fb26a80875sm21096080pgh.22.2023.03.29.01.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:14:41 -0700 (PDT)
Message-ID: <6423f371.630a0220.a10bb.5d68@mx.google.com>
Date:   Wed, 29 Mar 2023 01:14:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230329
Subject: next/master baseline: 103 runs, 8 regressions (next-20230329)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 103 runs, 8 regressions (next-20230329)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230329/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230329
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      198925fae644b0099b66fac1d972721e6e563b17 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423bc83969c5ae7cd62f77e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-R72=
1T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6423bc83969c5ae7cd62f789
        failing since 7 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-29T04:20:15.619651  /lava-9802990/1/../bin/lava-test-case

    2023-03-29T04:20:15.636355  <8>[   13.863936] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423bce15077849bb262f776

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6423bce15077849bb262f781
        failing since 7 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-29T04:21:29.660715  <8>[   12.266627] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-driver-present RESULT=3Dpass>

    2023-03-29T04:21:30.694566  /lava-9803068/1/../bin/lava-test-case

    2023-03-29T04:21:30.712142  <8>[   13.317720] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | clang-13 | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423bc7a8a837c517262f7a0

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-14-db=
0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.battery-device-probed: https://kernelci.org/test/case/i=
d/6423bc7a8a837c517262f7ab
        failing since 7 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-29T04:19:52.845364  /lava-9803066/1/../bin/lava-test-case

    2023-03-29T04:19:52.866415  <8>[   13.613211] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dbattery-device-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423c29b756cc7f0f962f76e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423c29b756cc7f0f962f=
76f
        failing since 60 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423c06a2dec84767162f7d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6423c06a2dec84767162f=
7d9
        failing since 63 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6423c1d0210ee21dc662f7ac

  Results:     169 PASS, 16 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mt6315-regulator7-probed: https://kernelci.org/test/cas=
e/id/6423c1d0210ee21dc662f831
        new failure (last pass: next-20230324)

    2023-03-29T04:42:13.662885  /lava-9803333/1/../bin/lava-test-case

    2023-03-29T04:42:13.669543  <8>[    9.969270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt6315-regulator7-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mt6315-regulator6-probed: https://kernelci.org/test/cas=
e/id/6423c1d0210ee21dc662f832
        new failure (last pass: next-20230324)

    2023-03-29T04:42:12.640821  /lava-9803333/1/../bin/lava-test-case

    2023-03-29T04:42:12.647508  <8>[    8.946310] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt6315-regulator6-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6423bf7b149b99d75062f775

  Results:     177 PASS, 8 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230329/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-apmixedsys-probed: https://kernelci.org/test=
/case/id/6423bf7b149b99d75062f825
        failing since 7 days (last pass: next-20230316, first fail: next-20=
230321)

    2023-03-29T04:32:39.444956  /lava-9803261/1/../bin/lava-test-case

    2023-03-29T04:32:39.451094  <8>[    6.056640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-apmixedsys-probed RESULT=3Dfail>
   =

 =20
