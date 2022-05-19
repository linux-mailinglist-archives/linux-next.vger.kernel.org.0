Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DFA52D7E0
	for <lists+linux-next@lfdr.de>; Thu, 19 May 2022 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241098AbiESPhV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 May 2022 11:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241246AbiESPgn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2022 11:36:43 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FA555209
        for <linux-next@vger.kernel.org>; Thu, 19 May 2022 08:36:03 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 31so5391163pgp.8
        for <linux-next@vger.kernel.org>; Thu, 19 May 2022 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=z9e0Py1qVMgMQh2kZbVtLCHts/IbPMIHdwj5H3D5RI4=;
        b=sHwmRG4KS1QZvpcqdn7n1nTNRuYc4Kul2NIxlUM/TFpUMCeGcqj7I6cgFjU4QpqWl6
         EXugLcNGArCptRugY2PqeclcmnVQ1wyFKDP8uwMsiFo7R3HVkYoPYG4t7cMv6o5lGART
         jc/smcziCxKIDo620LBdahiSMtwqM6DSHVskv2nVOLhBjLtMpHK/Y1MfvzhxJRna/aqC
         rEzGDgV2nBVu54YtU6Fn8MQ+Wa/YzTHO8ed2Z019XXWsZMfRFz7p4RdCN8ujaxOh4UFS
         cZcIwWJBtVvl1Qn84RPmQT4Q66HjZ9RXVMBcZdXtqByAfbGuaBXY02w75niZXfdoZZpC
         EMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=z9e0Py1qVMgMQh2kZbVtLCHts/IbPMIHdwj5H3D5RI4=;
        b=hgixL1zy0ZSOJLYxPt7NOZhXXn/hLY0WuW9IbOEdTxzMYLwtGalEXJbVrYWtP3G50i
         01GhTBQ/jgSlcPKrU/qPlL8mHWqbCuiOGdOdNJyru+b7tLEb67V2oySghJOvFOgdZiEq
         g6tGgRAhbneao91B9g385ln22xfWVwwXzVRioOY2BYWKsNJa+B0yzvGsAG2O5wmU2Fva
         2vfQNG8mTKktKfBrTCIwt6YKE+KQra9xZXJazkjnpMJy2i5YfKYiw2mEuO8rHdTL881H
         ELmEHESa7/i/KzITihu7JUAws+sz74zVsQCW39tUvDuXVEAFq+WbO1XAJlkeFh8IAm4Q
         uHfA==
X-Gm-Message-State: AOAM530BVdC/gZdd4aGiq+Wl+Qzl0l2OS8aNe7Q8aWxxcQxjIdllCw1y
        ZiIXKsGfNv1oShtQowf5oBRpx68qD7fi5EBqV/o=
X-Google-Smtp-Source: ABdhPJxjyZuZZtzh29xg7sU0k+ZpMVrN5p5iSTQlSSumZMSlVp8KjCoZXVysvIh2wCAv2uazJXyLyQ==
X-Received: by 2002:a05:6a00:1307:b0:50d:b02e:11df with SMTP id j7-20020a056a00130700b0050db02e11dfmr5265812pfu.4.1652974563231;
        Thu, 19 May 2022 08:36:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u10-20020a62d44a000000b0050dc7628149sm4277653pfl.35.2022.05.19.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:36:03 -0700 (PDT)
Message-ID: <628663e3.1c69fb81.da05.a328@mx.google.com>
Date:   Thu, 19 May 2022 08:36:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-rc7-216-g98dca003a752b
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 279 runs,
 4 regressions (v5.18-rc7-216-g98dca003a752b)
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

next/pending-fixes baseline: 279 runs, 4 regressions (v5.18-rc7-216-g98dca0=
03a752b)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc7-216-g98dca003a752b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc7-216-g98dca003a752b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      98dca003a752b2ac43eda1619d6d35a6360cff1d =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/628629133fbc5414a8a39c2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabo=
ra/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabo=
ra/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628629133fbc5414a8a39=
c30
        new failure (last pass: v5.18-rc7-165-g2424086909d29) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62862bdc0eb2c5c3d6a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62862bdc0eb2c5c3d6a39=
bd3
        failing since 10 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62862c6ec41c04716ea39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62862c6ec41c04716ea39=
beb
        failing since 10 days (last pass: v5.18-rc5-278-ge8576d28ffc9, firs=
t fail: v5.18-rc6-166-ga42b168a3ce2) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62862d072a6420b1b9a39bdb

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc7-2=
16-g98dca003a752b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62862d072a6420b1b9a39c01
        failing since 80 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-19T11:41:46.773936  /lava-6421823/1/../bin/lava-test-case
    2022-05-19T11:41:46.785113  <8>[   35.280224] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
