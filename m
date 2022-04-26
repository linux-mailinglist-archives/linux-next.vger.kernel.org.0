Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23EB450F0E0
	for <lists+linux-next@lfdr.de>; Tue, 26 Apr 2022 08:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbiDZGYF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Apr 2022 02:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235274AbiDZGYF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Apr 2022 02:24:05 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A52111378A
        for <linux-next@vger.kernel.org>; Mon, 25 Apr 2022 23:20:58 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id p8so17049836pfh.8
        for <linux-next@vger.kernel.org>; Mon, 25 Apr 2022 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Fq1s+MyeXQZIqyRYtT+0WK6e74foRq0rJBKrJ5RnuaQ=;
        b=AMwjIlXoDRkIy5LQBH5i3iIzyiLY7XfsOGpYyOML1GAgEADtMh5bRjHG/GF1odFswK
         kuwZKkTIC9PpJyIRMz9yhdGmVJ6EqAjKnwTB8CLWIGfDFefcqHnuBOy1NU+iE+jPm9Sq
         ALaT5WpYmYBVr8vp7rVirY93rxiTpzGcYgTvz75uVgdfSEvVCzN/9XD/hQahEg9UgqER
         AMBfnbc7KS8tjMDCtr5SG6oAmUW2oollgS3gGiFPdQoW6kXA46D9MyFy/Li19LOJWeki
         wMsllKEkXAbVrMw/IiZnh7vv346E8852WYLYMrPWhx+agnFdPLvdEi602FvcsEFPMj4P
         SBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Fq1s+MyeXQZIqyRYtT+0WK6e74foRq0rJBKrJ5RnuaQ=;
        b=J8DmaILkUFEFA/lZPDaapYOiKwg8cMvkWjsx9URp573aWxWVjzZyz29/VxSlqRU+T1
         dnSzi8L/jP9LzX7DCpzYfc4dCVn/IH6G8ylsUdEA3XlLcUJoa8E2vW14nm2cO4HivXFj
         Tb7wYDBEnKW95kNLbCZxk70oq/JEm8pB8XRpY2chp12iljXE12anRzgRjhZeMuWj5fgP
         TUbg/57bPNGyHTqCTwxBBSQZtA8jJwTP6K+QQ4EQBQJPVAeiLvHSl78l34nC0AdXsFth
         OLqs7PlT4rsCagCy1+Z3KG0A+n4BtmXygl+0wqzv6jGUsG87dZxEHmT+Mr9s+Zt90nsf
         tDyw==
X-Gm-Message-State: AOAM530u3iTC2nncRfEJ7hWVI9DAJ+zjcbIta+tO9MtzM13PagwGxpET
        0ytbenkG2268VEDgIALcnnxX8q6qmDQDGhhbEng=
X-Google-Smtp-Source: ABdhPJzg4KhVNEO92zuVUoECC3jdUA7Gy2FPiMrXePqfhm3SrocODIxgBrDu8jQgPiLFtU8DaGDlRw==
X-Received: by 2002:a05:6a00:849:b0:50d:4069:60b with SMTP id q9-20020a056a00084900b0050d4069060bmr8667987pfk.76.1650954057789;
        Mon, 25 Apr 2022 23:20:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r29-20020a63441d000000b003a97e8f71e7sm11768187pga.88.2022.04.25.23.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 23:20:57 -0700 (PDT)
Message-ID: <62678f49.1c69fb81.4ba54.ccf0@mx.google.com>
Date:   Mon, 25 Apr 2022 23:20:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc4-305-g34e5025f24df
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 436 runs,
 4 regressions (v5.18-rc4-305-g34e5025f24df)
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

next/pending-fixes baseline: 436 runs, 4 regressions (v5.18-rc4-305-g34e502=
5f24df)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc4-305-g34e5025f24df/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc4-305-g34e5025f24df
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      34e5025f24dff5c012acd52202829323e8f67c82 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
asus-C523NA-A20057-coral | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6267734324d352ed08ff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6267734324d352ed08ff9=
45a
        new failure (last pass: v5.18-rc3-381-g1e9235a24947) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/626757427b5995ab7eff9468

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/626757427b5995a=
b7eff946c
        failing since 92 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-26T02:21:34.484503  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-26T02:21:34.484770  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-26T02:21:34.484962  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-26T02:21:34.528291  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62675d13ecc19602efff9471

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62675d13ecc19602efff9=
472
        new failure (last pass: v5.18-rc3-381-g1e9235a24947) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin         | arm64  | lab-collabora | gcc-10   | defconfig+ar=
m64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6267597ec03d67cc94ff94ef

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc4-3=
05-g34e5025f24df/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6267597ec03d67cc94ff954b
        failing since 57 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-26T02:31:02.796383  /lava-6178967/1/../bin/lava-test-case
    2022-04-26T02:31:02.806909  <8>[   35.005196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
