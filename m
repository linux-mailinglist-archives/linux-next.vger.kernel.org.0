Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C46F50803A
	for <lists+linux-next@lfdr.de>; Wed, 20 Apr 2022 06:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354192AbiDTEnX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Apr 2022 00:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354151AbiDTEnW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Apr 2022 00:43:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FC51B7B7
        for <linux-next@vger.kernel.org>; Tue, 19 Apr 2022 21:40:36 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 2so826257pjw.2
        for <linux-next@vger.kernel.org>; Tue, 19 Apr 2022 21:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N9917nsViLGGTT2SG3E5jZEFf8ogYiwNMM2Ukup04Q0=;
        b=H/oPG6rEYITJ44ggvxNOhNajWi5fjmd5xSJOYciNH6frbq51QzLG6yEclh7DgVgqub
         DXDnIP5npyl27VshH0Bq9/GnTlZWoAumEJLudJISBSusNZqQTMg1er4evggcopfjsTLx
         ZQAkSHDpcDiCwUFB39fpeF9g7vxUtWpiwv3WFCoXBt5JWVFtoV/rqzzM1PT7CjTcRXv5
         4XdRoPk9la1iY4MqckFpit5SgEQGEom3RiR1JXq4B1TI70AiHSsTOMaJ5LTiXlbAom93
         hGxErvHcGOmeOB4CxQhYXSW5AN8nLIK2ppdZX/5Oiu7PvUhkyNzY7rSTNlVDgeg11qud
         mJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N9917nsViLGGTT2SG3E5jZEFf8ogYiwNMM2Ukup04Q0=;
        b=AwCN7yjTj/Ns2ItfefuWkPs9CFpEh0tQA+GLXVtL8PCHPU8G+jpzDP1U8Vt20qn18A
         l9n08gVCV0B6AteaVRXmJPfB66+uLeplWc9WroeiZrXEtmi0enAlomzhQ2W8NBhS7d3x
         z8EaJBkq7g40C842koyn463D8lhcletHR+iGOPCqzL/V1P2IS1eOtNVzF7f59msu1l4Q
         VW5ORyqkNp7X526Fqn1uMVubvc/te6K7gaxZ13tucAK3V3VGEQAELXPoveUaAywGJ7lg
         mYQOB54Ri0OlhVp+G18ZZKptvFcXjPUbbWbwZ7suXfbwBnTZ8PAf33LN7YZy6ESDY24c
         NZ/g==
X-Gm-Message-State: AOAM532t87BMPSuMSCDIyEwfsq0NfnnvP+S9DHsBvGQBeXaCqQt1+Xxk
        sV6O6RMfNGzpxLV/DT+khc9czvQ0RD1wF1vC
X-Google-Smtp-Source: ABdhPJyrWG7lQ/HfKiQv4V9lalndj7y40Z5Qzv5id23X9L2XGnb+dr3+pZb8d38LzacMI3UmznvCDg==
X-Received: by 2002:a17:90a:550e:b0:1cd:e722:8b82 with SMTP id b14-20020a17090a550e00b001cde7228b82mr2263461pji.223.1650429635026;
        Tue, 19 Apr 2022 21:40:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t15-20020a63b70f000000b00381510608e9sm17752364pgf.14.2022.04.19.21.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 21:40:34 -0700 (PDT)
Message-ID: <625f8ec2.1c69fb81.b1816.ae9d@mx.google.com>
Date:   Tue, 19 Apr 2022 21:40:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc3-274-g668a596978074
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 367 runs,
 7 regressions (v5.18-rc3-274-g668a596978074)
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

next/pending-fixes baseline: 367 runs, 7 regressions (v5.18-rc3-274-g668a59=
6978074)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig      | 1          =

meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc3-274-g668a596978074/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc3-274-g668a596978074
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      668a59697807412522822722d2010f7dc2904879 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/625f51a76f085ced56ae069b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/625f51a76f085ce=
d56ae06a3
        failing since 86 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-20T00:19:32.125684  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-20T00:19:32.125976  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-20T00:19:32.126150  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-20T00:19:32.165695  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625f78ccbe68480606ae0688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f78ccbe68480606ae0=
689
        new failure (last pass: v5.18-rc3-249-g4604e2bc18b6a) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625f67a5702ab6ae24ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f67a5702ab6ae24ae0=
67d
        failing since 65 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625f60279e03ac5d70ae069f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f60279e03ac5d70ae0=
6a0
        failing since 65 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625f67910b94fee0aaae069b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f67910b94fee0aaae0=
69c
        failing since 65 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625f60019e03ac5d70ae0696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625f60019e03ac5d70ae0=
697
        failing since 65 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/625f5774cd766eb60dae0680

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc3-2=
74-g668a596978074/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/625f5774cd766eb60dae06a2
        failing since 50 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-20T00:44:16.737194  /lava-6127901/1/../bin/lava-test-case
    2022-04-20T00:44:16.747409  <8>[   35.094006] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
