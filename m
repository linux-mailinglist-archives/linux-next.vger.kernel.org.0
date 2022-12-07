Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A8B64524A
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 03:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiLGCxJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Dec 2022 21:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiLGCxI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2022 21:53:08 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C641A39C
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 18:53:06 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so206534pjd.5
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2022 18:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BhLdt8dHHCdDtvpSnm/vDWk37f+cXWAKSlLkhqFVYo4=;
        b=P//LyzHhaxNjSz9LZIWkcs3xnrN7Cwqd90y8l0ENGAXWW0GKSuMm+4wLmyO5+O0oha
         gZVrFXR4sEcTdEoxSHjnbjP5NN2WDSkQY8LRwvlALy+zRV28n9p73+qOyzyOKnEn2FEh
         BPQrHT2ONOSwWPYEZBDAwv9Wh2rgxh6e4XHcVpEp2iFn0Z3SolBpZFMRl0bnVHBGA7NQ
         vkptl2dNwJXBCbp1r8pwivl/TZG5jnrjIw5HlhFKEKCQlAqQEFrdrRiMbSa1JEJd8KeY
         Ke8FYVdh60sRpIUYaiOdWWquHXVtrq+3nSyNZHTWa5iLDND9J62Upk+LnYVmKa9dZoFr
         rfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhLdt8dHHCdDtvpSnm/vDWk37f+cXWAKSlLkhqFVYo4=;
        b=nYebYWO+x2+e5ntllu+yuqqgmgaQZoxswlSG+qhBae874JUEr1s1iJF6QU7egDHSsU
         Q9IaC1xjZuGsRZNRQ0+q1zejpAhSGmStQ+P5DCPqf9L2SYyfY6OdACodZgkf449IPRaP
         nki9BqpKivdQrpTduOKbW7shDvh9k/HtgR96v9bd2DV+IN36xuEzKp5LV/qKI8mj3MUr
         5TACAP8RAkqVFCh2KNV8vtt1j8LpwP8/RwlkDBtnoufjWuzlcdEA6bqhVAqdPhmBYHEu
         +b8WuMD6FqlxUBL2BHRh8VTvjTS989lJ6m3/J8o8YPrSD2fo/LBPraVaUPuDEctEQQ+Y
         Vp4Q==
X-Gm-Message-State: ANoB5pnNoI/NnirlCplLTq8TDCKyU5N464q1GumsDwHxy5QW75Qus3oh
        bmZJVjlRRH4GgXoWgyST2/Rql5PniiGF6VDhE3FL2A==
X-Google-Smtp-Source: AA0mqf6ISv7EIoBOrISP546zOa/3sy/9NpGeY2zQ2J12nsZ4/Z0yRfltwHJKjK71KEvBgqxw3eWXYg==
X-Received: by 2002:a17:90b:608:b0:219:932c:febe with SMTP id gb8-20020a17090b060800b00219932cfebemr23683049pjb.47.1670381585171;
        Tue, 06 Dec 2022 18:53:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h9-20020a63c009000000b0042988a04bfdsm10484070pgg.9.2022.12.06.18.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:53:04 -0800 (PST)
Message-ID: <63900010.630a0220.bab7d.476a@mx.google.com>
Date:   Tue, 06 Dec 2022 18:53:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-rc8-128-gc530a9add07c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 489 runs,
 10 regressions (v6.1-rc8-128-gc530a9add07c)
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

next/pending-fixes baseline: 489 runs, 10 regressions (v6.1-rc8-128-gc530a9=
add07c)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto           | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig         | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig         | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc8-128-gc530a9add07c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc8-128-gc530a9add07c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c530a9add07c3cb7081666ad32b455bc0169f0fa =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/638fc7dc61c80e41022abd28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/638fc7dc61c80e4=
1022abd30
        failing since 317 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-12-06T22:53:03.003007  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-12-06T22:53:03.003768  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-12-06T22:53:03.006223  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-12-06T22:53:03.052860  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/638fcc6045b74a521b2abd0d

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/638=
fcc6045b74a521b2abd20
        new failure (last pass: v6.1-rc8-110-g01ca8a2349c6)

    2022-12-06T23:12:16.445211  /lava-224612/1/../bin/lava-test-case
    2022-12-06T23:12:16.445581  <8>[   17.545971] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/638fd028df892f2d812abcff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638fd028df892f2d812ab=
d00
        failing since 123 days (last pass: v5.19-8283-ga8bc7f656e322, first=
 fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-10   | oxnas_v6_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/638fc8174f436a68822abd02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638fc8174f436a68822ab=
d03
        failing since 55 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig         | 1          =


  Details:     https://kernelci.org/test/plan/id/638fca335c92dcb46f2abd09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638fca335c92dcb46f2ab=
d0a
        new failure (last pass: v6.1-rc8-110-g01ca8a2349c6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 4          =


  Details:     https://kernelci.org/test/plan/id/638fcfd749512bd12a2abec3

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/638fcfd749512bd12a2abee5
        failing since 281 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-12-06T23:27:05.857712  /lava-8264642/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/638fcfd749512bd12a2abf08
        failing since 189 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-06T23:27:03.660724  /lava-8264642/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/638fcfd749512bd12a2abf09
        failing since 189 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-06T23:27:02.631977  /lava-8264642/1/../bin/lava-test-case
    2022-12-06T23:27:02.641660  <8>[   35.893925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/638fcfd749512bd12a2abf0a
        failing since 189 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-12-06T23:27:00.567327  <8>[   33.819604] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-12-06T23:27:00.933426  <4>[   34.185326] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-12-06T23:27:01.603902  /lava-8264642/1/../bin/lava-test-case
    2022-12-06T23:27:01.616476  <8>[   34.868778] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/638fcf248bd467af442abd50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc8-12=
8-gc530a9add07c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638fcf248bd467af442ab=
d51
        new failure (last pass: v6.1-rc8-110-g01ca8a2349c6) =

 =20
