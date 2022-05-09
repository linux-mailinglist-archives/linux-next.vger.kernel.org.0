Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B8D51FD7B
	for <lists+linux-next@lfdr.de>; Mon,  9 May 2022 15:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbiEINF5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 May 2022 09:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbiEINF5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2022 09:05:57 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E2F2A3BD9
        for <linux-next@vger.kernel.org>; Mon,  9 May 2022 06:02:03 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso402673pjg.0
        for <linux-next@vger.kernel.org>; Mon, 09 May 2022 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EjbSH0v1zY72uN3/9QJo6sZKXAJxZ8alUDsoD3IyN5o=;
        b=ZUUTPgigSsYXLc+IBnxc/zZj033ddjj5ihQzn7QkM2euuL5gVYarO9FAse+W9BFw5h
         /uQHNcXeMUkyWBVPztYm002AWdWDW17c6bhK0Y5RiHa0L9aQ76flQZEnrW5APeU3lrJY
         jcCSIhDhzJX100JoaMuZ5boctriSQaCtgJ8nMpV5oWCCVPAnDRfZWLJPoZdMLbTOjpr5
         PvjIQb0+zoHh10t16DiEn7ioFNMfHuI/b9voMLUnLIdyCAuJeB1iIjRmJmcae7//mR1s
         Ir592QLPtR9GIEMmpMghoqzLbqOu9pyOiwwkNEQYbiQT2JYQ9PLwJKkNiA7cUuHDoZFm
         u4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EjbSH0v1zY72uN3/9QJo6sZKXAJxZ8alUDsoD3IyN5o=;
        b=WUfGJVKEE9Y9hkKHGY+XEpaPgKhMfieulBRGY9mHYGylZVPBek5rwAUWZVcn/I2ljc
         DVar/sAtIuy29EzGQq/wBuQoAWmde5ZnpDNbLOWmjeA2TVAM4mquXKqRjAaUqDP/N62X
         mRJXkNavtHUbLHNSHrB5A/ByAOCm9dD4oIJJfd3jb5wrpX4bm9jz8p8eKmZoyNEBa4RE
         X5q6AGW20ibfPe0dhCQ74KzOfvjbihbom+c+KeaI3KiaDOz5g/s8JqiIbxyBhNUIEDgU
         JOfznq34bbSe10u8BwU0Fwq1OMSyVBjB4RCWp1E9mcJul8l/S8ZpE8RjSPVkh23l83Vw
         wGTQ==
X-Gm-Message-State: AOAM533PxpKQ41dwM5Qn3tZ35pxX+gvkAixIQRCf8Gwoi2GchrI/qGKF
        siYJrw+Y7cDlOnDvCtFkldQ1vVModkopLLDZ
X-Google-Smtp-Source: ABdhPJwSAnVU0wdR0jDA8ge2h0j9tvgMM/zP01wxtvVo9L2aZ79hAgV2Ea6MrQyGbXSc/cenlgx6WQ==
X-Received: by 2002:a17:902:854c:b0:158:35ce:9739 with SMTP id d12-20020a170902854c00b0015835ce9739mr15825645plo.150.1652101322103;
        Mon, 09 May 2022 06:02:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f18-20020a63f112000000b003c14af50603sm8399604pgi.27.2022.05.09.06.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 06:02:01 -0700 (PDT)
Message-ID: <627910c9.1c69fb81.f4619.2f7c@mx.google.com>
Date:   Mon, 09 May 2022 06:02:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc6-166-ga42b168a3ce2
Subject: next/pending-fixes baseline: 396 runs,
 5 regressions (v5.18-rc6-166-ga42b168a3ce2)
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

next/pending-fixes baseline: 396 runs, 5 regressions (v5.18-rc6-166-ga42b16=
8a3ce2)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+crypto           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc6-166-ga42b168a3ce2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc6-166-ga42b168a3ce2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a42b168a3ce2c4923d405814c81ef015aa5e6515 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/6278d5b6a94824ad6f8f571d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6278d5b6a94824a=
d6f8f5725
        failing since 105 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-09T08:49:39.741237  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-05-09T08:49:39.860572  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-09T08:49:39.860824  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-09T08:49:39.860957  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-09T08:49:39.905512  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6278d77864246c8de98f5753

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6278d77864246c8de98f5=
754
        new failure (last pass: v5.18-rc5-278-ge8576d28ffc9) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6278d6e3a4df2048018f5719

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6278d6e3a4df2048018f5=
71a
        new failure (last pass: v5.18-rc5-278-ge8576d28ffc9) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6278e5a73f2012a56a8f575c

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6278e5a73f2012a56a8f577e
        failing since 70 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-05-09T09:57:33.762741  /lava-6306502/1/../bin/lava-test-case
    2022-05-09T09:57:33.773002  <8>[   33.850944] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                  | regressions
-----------------------------+-------+---------------+----------+----------=
------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+crypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/6278d9ba4682085a0f8f5724

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc6-1=
66-ga42b168a3ce2/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a=
64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6278d9ba4682085a0f8f5=
725
        new failure (last pass: v5.17-13070-gc7e54cdeb141) =

 =20
