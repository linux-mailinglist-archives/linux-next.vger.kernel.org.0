Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012644CC8AE
	for <lists+linux-next@lfdr.de>; Thu,  3 Mar 2022 23:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiCCWTw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Mar 2022 17:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbiCCWTv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Mar 2022 17:19:51 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A0926F9
        for <linux-next@vger.kernel.org>; Thu,  3 Mar 2022 14:19:05 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id s11so5911095pfu.13
        for <linux-next@vger.kernel.org>; Thu, 03 Mar 2022 14:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CUK1wonxF3Hlmjn8F1MUF+lddFofuwq+jjBhkNSCR8w=;
        b=AWMs6+bcNWn0CEgHCltgQil6UCXmtPPqvkDuJhkIcxu48D//bG7oKqF0w8DwgIdu0x
         VryiJPhFbSx07cXoZoSVR8bYyruOyQgaRdwETqgcTOJpKfJIjjeUR+rC9S0lWh0se09s
         QvoYhh28OgXV/ci87ZSr9Q6/6gUILw6hMiYonh34lri8LX1pTbAWmW+W2dUdPS3jcO2s
         ToLvc5bEVOmssyYHdVQKbs/8N6H0poQNTePG/pKnag51IMxQJ8KBVwbqrHNhPN+jVvsi
         iz59A4oqJO54t2Ok7llPPzcDak28uZ4I1iP3OBQG0xTtqFTMghE3KNeNbD7oxFoGE7DM
         tl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CUK1wonxF3Hlmjn8F1MUF+lddFofuwq+jjBhkNSCR8w=;
        b=SAIe+agjLIPiArYlC7fCreLXHCRnd7xTtbayLgvvxklkiU8yfODXs29H0Zig/6M6Ep
         y2kZu04F9TTvMd1ocSYCI7woxHOcGVGh/+nJSMlLwBJJg42KjRZLCs+h7SVmW8cEFlnd
         CNu1y97SuZPvv8S2H5btQ6bQJQoL6EVpn5kS+N7O4DrfD3BtX4D00N1qM9RnBrJpD14O
         Hx8mtnU4P54TDvMiyMQPYsqWtSEIwd052FkH945UVPwrbpujWLhkDo8WMIF45OkySLZp
         pKi0OcIBuUfvu0Isd6jxXreW9Gbx13U8rclu4F8mS6HBN3tW3J3ZlX5/QT6Q0k+nrfNT
         NnkQ==
X-Gm-Message-State: AOAM533RGr5DInly+A7lBrRutQMrnU0RDlwmDkfaLMyIFIxPNTnJinbv
        DrWzlX+FcOCYA63RREs3WeMhCczhuMJxSYObWTo=
X-Google-Smtp-Source: ABdhPJwCZ1H4nHjP2zYX2gSmWvaaTPVxQs7SVvauu3squLoqsqLErtawKXw5fXwRV/CLFXFsKdbt2g==
X-Received: by 2002:a05:6a00:b84:b0:4e1:b113:d444 with SMTP id g4-20020a056a000b8400b004e1b113d444mr40338148pfj.12.1646345944745;
        Thu, 03 Mar 2022 14:19:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090ae50500b001bc4ec15949sm8879500pjy.2.2022.03.03.14.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 14:19:04 -0800 (PST)
Message-ID: <62213ed8.1c69fb81.59d20.912a@mx.google.com>
Date:   Thu, 03 Mar 2022 14:19:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc6-278-g34490bca674f
Subject: next/pending-fixes baseline: 244 runs,
 4 regressions (v5.17-rc6-278-g34490bca674f)
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

next/pending-fixes baseline: 244 runs, 4 regressions (v5.17-rc6-278-g34490b=
ca674f)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2711-rpi-4-b  | arm64 | lab-collabora | gcc-10   | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =

bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_K=
ERNEL=3Dy | 1          =

da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc6-278-g34490bca674f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc6-278-g34490bca674f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      34490bca674f1cc8aa755d4beb947c8c46b404b8 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2711-rpi-4-b  | arm64 | lab-collabora | gcc-10   | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622108210bdd8ca5c2c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622108210bdd8ca5c2c62=
96a
        new failure (last pass: v5.17-rc6-176-gb4e03e0dde48) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2_K=
ERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6221095efa48e621cfc6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6221095efa48e621cfc62=
96b
        failing since 14 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6221068aa39345cdc3c629a5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6221068aa39345c=
dc3c629a9
        failing since 38 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-03T18:18:29.455367  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-03T18:18:29.455598  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-03T18:18:29.455767  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-03T18:18:29.497017  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6221050e32b5ffdaddc62968

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-2=
78-g34490bca674f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6221050e32b5ffdaddc6298e
        failing since 3 days (last pass: v5.17-rc5-244-gd77a1b37f796, first=
 fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-03T18:12:17.191330  <8>[   32.877107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-03T18:12:18.220562  /lava-5810015/1/../bin/lava-test-case
    2022-03-03T18:12:18.231552  <8>[   33.918636] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
