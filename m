Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E332F51BCBE
	for <lists+linux-next@lfdr.de>; Thu,  5 May 2022 12:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240693AbiEEKIo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 May 2022 06:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbiEEKIm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 May 2022 06:08:42 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1333FBE6
        for <linux-next@vger.kernel.org>; Thu,  5 May 2022 03:05:03 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id e5so3275034pgc.5
        for <linux-next@vger.kernel.org>; Thu, 05 May 2022 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=INSyTEhKFXiIK3VKe4ktv++HKOQufop7H8EVrhsaiCk=;
        b=Vb0pspOaL11lkokLBXB0TxlGv4YEA233dw6TvNY+P/DfJ9dwhllkCOyH5bCcRTGYKi
         4C7mEqOzkiBb9m8/QCzvXt0uO+10ozhCKDhLW4l1FKmCiUfw9eUJkCizVwzRl4vnYCYs
         m5s+bmg4ifL0pnH/je/SZbOEXcdCn1PAkRTK/VlYV5CY2psGKf+T3uP96P7W6lsB2yp8
         Zeqqe7CExUjzX3DlGJjzgjhDPpcnxtm2I1wWE6aDaUT2KacQGSrglCbMjNMI1zJ1QeSo
         8O6BDP15suKGfp8lpNNCYOfO3MKjX1Phjn63I4yDtHd+v9afq4gG3J77TvA67IOCt88h
         ThkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=INSyTEhKFXiIK3VKe4ktv++HKOQufop7H8EVrhsaiCk=;
        b=12eMUzmhOF4wyBsMScQJXjZb5bBejOVHChj76VmjouqpFJPPgwbFlymh14m2kb7IyS
         co6r+fvy5J8WXzIusl78x3BlrBSvmSangxWIxGmpX61k/yUhqODbCvc5k/jiHn6fZH+w
         8vx2UkChDVG8xDImGPRCj0Qwxq/26U9HK3XmOiyzOS6gmDhf/opx9i4O/hh+smI/BnxE
         x463JlVcmbfPahuZh0aMRs/P2KTbWdgYlYLb8ZmZX5Fq2PVs5YTiYhSrdfmbBaujEQXk
         T+2hvnydyB2ezL26pS35h1G0zDheEln9Twqey2Jgv2+DDdShW68HVnKnEMkdmppq26Du
         gD+g==
X-Gm-Message-State: AOAM532au2MurAz3A2Ykkpzherhn/rWDHXnSZWTT1+nktOpN20+QE+ts
        Uy67x6Evl2g8Fsc5KD3VjkLVxmJbq1eXQ/ta1C0=
X-Google-Smtp-Source: ABdhPJwbxsBrhOkkW6vr0jpRaBDy4pMTzETifNjh9kXLOLeqvWQdMFeHvOLnCKp0p+Hrj0sdlOchiA==
X-Received: by 2002:a63:2151:0:b0:3ab:938b:9c3d with SMTP id s17-20020a632151000000b003ab938b9c3dmr20877145pgm.463.1651745102603;
        Thu, 05 May 2022 03:05:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z7-20020a170902ccc700b0015e8d4eb2a3sm1081922ple.237.2022.05.05.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 03:05:02 -0700 (PDT)
Message-ID: <6273a14e.1c69fb81.87575.24f2@mx.google.com>
Date:   Thu, 05 May 2022 03:05:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc5-229-gb1ef3301b238
Subject: next/pending-fixes baseline: 409 runs,
 4 regressions (v5.18-rc5-229-gb1ef3301b238)
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

next/pending-fixes baseline: 409 runs, 4 regressions (v5.18-rc5-229-gb1ef33=
01b238)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =

imx8mn-ddr4-evk  | arm64 | lab-baylibre  | gcc-10   | defconfig            =
        | 1          =

jetson-tk1       | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc5-229-gb1ef3301b238/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc5-229-gb1ef3301b238
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b1ef3301b238fc8e99602117aa711e32b04c4f81 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
da850-lcdk       | arm   | lab-baylibre  | gcc-10   | davinci_all_defconfig=
        | 1          =


  Details:     https://kernelci.org/test/plan/id/627367dd65db0a54ce8f57cd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/627367dd65db0a5=
4ce8f57d5
        failing since 101 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-05T05:59:36.050867  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-05T05:59:36.051133  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-05T05:59:36.051302  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-05T05:59:36.092367  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mn-ddr4-evk  | arm64 | lab-baylibre  | gcc-10   | defconfig            =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/627367cec7094119dd8f571d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/627367cec7094119dd8f5=
71e
        new failure (last pass: v5.18-rc5-178-g63184bc90d435) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
jetson-tk1       | arm   | lab-baylibre  | gcc-10   | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62736d53ba980562358f5731

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62736d53ba980562358f5=
732
        failing since 5 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, firs=
t fail: v5.18-rc4-464-g425675974eb3) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62736d73c89f9be6488f574e

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-2=
29-gb1ef3301b238/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62736d73c89f9be6488f5770
        failing since 66 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-05T06:23:35.028619  /lava-6272054/1/../bin/lava-test-case
    2022-05-05T06:23:35.039591  <8>[   35.539406] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
