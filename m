Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47F7478BDBA
	for <lists+linux-next@lfdr.de>; Tue, 29 Aug 2023 07:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbjH2FPE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Aug 2023 01:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235627AbjH2FOe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Aug 2023 01:14:34 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBED198
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 22:14:31 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a7aedc57ffso2853411b6e.2
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 22:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693286070; x=1693890870;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U5Ea/Jtkm+sF/BxoliRNEWpY5n9vV5Gee2nidahNvA8=;
        b=SfWjfRG+LTXUoOn2trC0s43dyOMW5s2GgEE1ViDj9YF4GHoLSvo/ATXlLdiB9L2Okh
         khYA6AwkNWUUcuHyZQNl0EK2CcM9lMx9haTboYuBafMcAzRKwbmMjkb36BE8qBaM/4UA
         SRi+WOA/2dmnN+MO86Y2r0JDg4CpGBzCaL/NrAMXYqCBM5vJUJT8BKfHlYelZv/ZQlM2
         xWW/3h+wA89o7kl3oLZD/OSUDVTs+5gmk74l6MZokOkbuK4iCst1dM+mOFE8jdEZT0an
         3QWANn5zhH7NyobiyK+7sDJDYq8s19Sex5/0/DFsqnEWlNoE7qVOf3rjD32GTqIAWBi3
         0X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693286070; x=1693890870;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5Ea/Jtkm+sF/BxoliRNEWpY5n9vV5Gee2nidahNvA8=;
        b=TpK09320XQNpN0/o/j2wV96ltJKRhiIksd9zIyIMSccSfNwEF4TAjHcdgHOIHXlbMz
         MruEXYECOmhZDE+jMWMCBy+A0U7b3rQAJurD1gY5gthihJmAoRohiFDjfT+9yAltnuwr
         2SBXsL90qwB25hSKtzeIpSZ43AxE0ehYOJp3eJ1Ec7GFcmTT+G8L/tYygFrIrGsYH0MG
         nlolfD5krpNERu5qBH8EoIEf7dS40f4zWHVY5BR92JUOnaqNgXHz5uLl8drb/JcCV/GG
         SW6S3Q+UX8dgwwmENfUsga4g/5T2I45Xqb7yPVTRLrN8AemALtkZQJ6m4aO2lNlI1j68
         2EUw==
X-Gm-Message-State: AOJu0YxQMdpqdHodNNWAe/UlFOGPoTXLmCIHf2E4jN8HYo6Q4AauerYO
        eIp5Vvecc9u6bHIEdm0io57Kp0/sCvStEUQK3rw=
X-Google-Smtp-Source: AGHT+IEgtk8PGljw0J6mf+rb6TO34Oe92QERc0F99mAKRvqEu9EVruuRv2rMpx06dEO7AdMEhE9swA==
X-Received: by 2002:a05:6808:20a1:b0:3a1:dd99:8158 with SMTP id s33-20020a05680820a100b003a1dd998158mr15000255oiw.6.1693286070548;
        Mon, 28 Aug 2023 22:14:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p20-20020a62ab14000000b0065da94fe917sm7532441pff.36.2023.08.28.22.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 22:14:29 -0700 (PDT)
Message-ID: <64ed7eb5.620a0220.6ab7d.c03b@mx.google.com>
Date:   Mon, 28 Aug 2023 22:14:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-1588-g1cf6f50b5d09
Subject: next/pending-fixes baseline: 63 runs,
 2 regressions (v6.5-1588-g1cf6f50b5d09)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 63 runs, 2 regressions (v6.5-1588-g1cf6f50b5d0=
9)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-1588-g1cf6f50b5d09/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-1588-g1cf6f50b5d09
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1cf6f50b5d09a22a4984f9bd5743c857079778f5 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 2        =
  =


  Details:     https://kernelci.org/test/plan/id/64ed4bed6ccf433cc828705a

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-1588-g=
1cf6f50b5d09/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-1588-g=
1cf6f50b5d09/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ed4bed6ccf433cc828705d
        new failure (last pass: v6.5-85-g63006762d709)

    2023-08-29T01:37:40.034035  / # #
    2023-08-29T01:37:40.136089  export SHELL=3D/bin/sh
    2023-08-29T01:37:40.136796  #
    2023-08-29T01:37:40.238281  / # export SHELL=3D/bin/sh. /lava-376837/en=
vironment
    2023-08-29T01:37:40.238995  =

    2023-08-29T01:37:40.340402  / # . /lava-376837/environment/lava-376837/=
bin/lava-test-runner /lava-376837/1
    2023-08-29T01:37:40.341534  =

    2023-08-29T01:37:40.360457  / # /lava-376837/bin/lava-test-runner /lava=
-376837/1
    2023-08-29T01:37:40.402681  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-29T01:37:40.415971  + cd /lava-376837/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64e=
d4bed6ccf433cc828706d
        new failure (last pass: v6.5-85-g63006762d709)

    2023-08-29T01:37:42.812942  /lava-376837/1/../bin/lava-test-case
    2023-08-29T01:37:42.813372  <8>[   17.577350] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-08-29T01:37:42.813667  /lava-376837/1/../bin/lava-test-case   =

 =20
