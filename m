Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D4560F330
	for <lists+linux-next@lfdr.de>; Thu, 27 Oct 2022 11:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbiJ0JHN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Oct 2022 05:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbiJ0JHA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2022 05:07:00 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698BD14DF03
        for <linux-next@vger.kernel.org>; Thu, 27 Oct 2022 02:06:49 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ez6so941915pjb.1
        for <linux-next@vger.kernel.org>; Thu, 27 Oct 2022 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u0AfPqZ5rl38Iz6pdisVrgwH1xlXH2fugtv3zFNtMuQ=;
        b=xiViSPIWQZkQn+6SP2D4FpkmbE5xZtcriTeq0f0HNCOTXuaWaYboXnyLA2Qkiidhra
         uL5c0w8mxnPBGDkrZe00av7LA2jmBLnkHIqrP7luYa1FpeBYyM0nFbCHH1obIvH2HAPS
         pi0R8+EvYJoiA75B6oAxifuOu1DWIZBANYihvAz0VGyvdWYbDX64y+nqqH44ncEkur91
         R6aH9JEYNSeOgOJBuH4Q74TxiAhxSwFnJoaTi67agGs6MYmLqBt3xUZtNJCEG5IUGUFi
         DQGMC5MkGNkBKRohC7RsopzdLvWviZ0MG+OecygDhoWaR/FwYRGZpo0KYq8uWu0g3uMq
         gimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0AfPqZ5rl38Iz6pdisVrgwH1xlXH2fugtv3zFNtMuQ=;
        b=s1+Cn74rcFn8W6Fs25W0RtLiuB0MnH/aC0IbvUhZQrd7A+OQyj3HC2mrCONvQgYGo4
         qaR+wQdXopHEG8IptBitHrO+y3W9MeRL16p+Mq1OhyR4SfbHffwRceeXijwuXYuQ89Gn
         jUQKQjii+udWuUFUraPGFz5O6nlyCzElQHGLNL2WO7NLPiFaZqsDZPLEVkGFRbLhMFd5
         OuMIUTEyLuL1szzfYuuXKZIsU676YSO0Iz1bHKyp3ffaAEM2BgH2te2pAEUJxwwZxw8s
         0Gv3UDnDNNSDFmZ4S0nwbrzy6KUzKOWWVzZnE7eeQ5aQy/B1aam8apL5jqLr29DXfLbE
         thrQ==
X-Gm-Message-State: ACrzQf0aZ+2swd/wyJ0cIdbpvf7LwFypxzlMI89NbXK4iULdJ8sz4u9W
        8lq6QbEQ84VHW3OmaDbgIoLUWkXjGedeb+Ld
X-Google-Smtp-Source: AMsMyM7stgff/+JqIbRxZ/podVT1Fl2VTm4PykN2UHzx9Ph+zrhrhJNiWcKoweslVCBEPDg3np/W3g==
X-Received: by 2002:a17:90a:64c3:b0:212:d67d:a034 with SMTP id i3-20020a17090a64c300b00212d67da034mr9083583pjm.55.1666861609163;
        Thu, 27 Oct 2022 02:06:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g4-20020a6544c4000000b00439f027789asm635521pgs.59.2022.10.27.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 02:06:48 -0700 (PDT)
Message-ID: <635a4a28.650a0220.ce9d8.0fd5@mx.google.com>
Date:   Thu, 27 Oct 2022 02:06:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20221027
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 93 runs, 5 regressions (next-20221027)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 93 runs, 5 regressions (next-20221027)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 3          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221027/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221027
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ecc4eeb2208ab537a3f3744984cd7f30ac971db8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/635a1686150e718533e7db99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221027/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221027/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635a1686150e718533e7d=
b9a
        failing since 104 days (last pass: next-20220705, first fail: next-=
20220714) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/635a1979aa4e104b8ce7db6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221027/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221027/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635a1979aa4e104b8ce7d=
b6f
        failing since 167 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/635a196ea362b0df06e7db51

  Results:     71 PASS, 21 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221027/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221027/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/635a196ea362b0df06e7db95
        failing since 9 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-27T05:38:13.591509  /lava-7739518/1/../bin/lava-test-case
    2022-10-27T05:38:13.603051  <8>[   25.095651] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/635a196ea362b0df06e7db96
        failing since 9 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-27T05:38:11.544864  <8>[   23.037206] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-10-27T05:38:12.562151  /lava-7739518/1/../bin/lava-test-case
    2022-10-27T05:38:12.573337  <8>[   24.065776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/635a196ea362b0df06e7db97
        failing since 9 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-27T05:38:10.497112  <8>[   21.989650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-10-27T05:38:11.533265  /lava-7739518/1/../bin/lava-test-case   =

 =20
