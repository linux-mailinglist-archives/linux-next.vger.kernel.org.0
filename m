Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 445F84F5DF3
	for <lists+linux-next@lfdr.de>; Wed,  6 Apr 2022 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiDFMev (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Apr 2022 08:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiDFMdq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Apr 2022 08:33:46 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7494856ED65
        for <linux-next@vger.kernel.org>; Wed,  6 Apr 2022 01:37:52 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id j8so1340987pll.11
        for <linux-next@vger.kernel.org>; Wed, 06 Apr 2022 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ln43QvioipthFryP0mj1hpUk/ZcSMUCXRRO28YWf7go=;
        b=bHAS0TSKrHwI0lcr0dw13SlIMJz/MOSzH0OJFes/6tSYE5WFl8B54aE7sSaGHJ1nf4
         GnE9F03CL6udyJ6j7XP10c+tdl1PUTYZxfFrhO8Q3+/bqiXWudoiFkVSxkq2i0RFgWNE
         qhND3i9Bsr9uaKswZpu00yeBX1BE/DzNTni/cEG7KeEStlK+QIJ6osQcC5DlJDvbkVon
         SeJQPFtCc7whMxyn057rjrPOByAER+E3xTntczhdOAw4ExYcahsd0qDS/E+XVpXggz4Y
         j0x9yCmHvEy1gmJSm6vLapukVj4F8t+gzndAHxAgxSOsaY2DsFBcXMa7C8pKedheKxbg
         Inag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ln43QvioipthFryP0mj1hpUk/ZcSMUCXRRO28YWf7go=;
        b=PyFsTpXcuz/jjOeKN/l5c3YdMfCEx5feTbQLzA/PysZJN9sPutvvAg6ksIDsUdJsFa
         ybl1NU7DWyGmYqgTIRmk+E9KppnLRth6JsBAmdHPfuuEB8g0xjtx5b+daVktpsigrwG1
         9cJYdMG1Yx84n3j0Gfi+sefs1txMyxw4SBBYq5FZl1t9iLUcwQzrWK0/WlkiHmbvyaCg
         4nGYgDjASOZvi/kCjwaH9Hr8JWc03CB8wY9gdQNy8j9/Btj65M++FbUNrtHyOKYmfY8P
         q46rvtS8LU2HNtwX0yHq0HC0TXQfnd56bhRmHiT8LVKdbeV9cUEsD1Vthl7G9CMoXcPA
         vlzQ==
X-Gm-Message-State: AOAM533Z406LpY183AbSXln++uU+uU1xhjNlJMB85p6QvPi1gxvmHxv+
        xb2BDfYyloerX39KFwh1e+Y3DW9sM5i1x7X6
X-Google-Smtp-Source: ABdhPJy1cQCEhYM6xrd96Zc2VagAe5h2kY7f8Ij+708/41akb36xOHIn/RWezutbY9igyzGg+zON8A==
X-Received: by 2002:a17:902:bf07:b0:14f:a3a7:97a0 with SMTP id bi7-20020a170902bf0700b0014fa3a797a0mr7571610plb.105.1649234271611;
        Wed, 06 Apr 2022 01:37:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g6-20020a056a001a0600b004f7bd56cc08sm18266941pfv.123.2022.04.06.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 01:37:51 -0700 (PDT)
Message-ID: <624d515f.1c69fb81.2e9b7.ffd9@mx.google.com>
Date:   Wed, 06 Apr 2022 01:37:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc1-239-gbd8224be6a15
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 213 runs,
 2 regressions (v5.18-rc1-239-gbd8224be6a15)
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

next/pending-fixes baseline: 213 runs, 2 regressions (v5.18-rc1-239-gbd8224=
be6a15)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
imx8mn-ddr4-evk  | arm64 | lab-baylibre  | gcc-10   | defconfig+ima        =
      | 1          =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc1-239-gbd8224be6a15/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc1-239-gbd8224be6a15
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bd8224be6a158a915d87018610a9baa01421b114 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
imx8mn-ddr4-evk  | arm64 | lab-baylibre  | gcc-10   | defconfig+ima        =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/624d16bfc4c1120812ae0695

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-2=
39-gbd8224be6a15/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-2=
39-gbd8224be6a15/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624d16bfc4c1120812ae0=
696
        new failure (last pass: v5.18-rc1-107-g56ad09fc9d717) =

 =



platform         | arch  | lab           | compiler | defconfig            =
      | regressions
-----------------+-------+---------------+----------+----------------------=
------+------------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chrom=
ebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624d0e9123fcc478caae067f

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-2=
39-gbd8224be6a15/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-2=
39-gbd8224be6a15/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/624d0e9123fcc478caae069a
        failing since 37 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-06T03:52:40.745596  /lava-6034500/1/../bin/lava-test-case
    2022-04-06T03:52:40.756579  <8>[   33.719151] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
