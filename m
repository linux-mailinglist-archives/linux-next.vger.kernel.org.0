Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9482519621
	for <lists+linux-next@lfdr.de>; Wed,  4 May 2022 05:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbiEDDtM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 May 2022 23:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344414AbiEDDs7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2022 23:48:59 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0604362F6
        for <linux-next@vger.kernel.org>; Tue,  3 May 2022 20:45:25 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d17so365116plg.0
        for <linux-next@vger.kernel.org>; Tue, 03 May 2022 20:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZpkHfYSRxYSO2FF4bHKDC45NyjmryWHHOkPD7CCYZWM=;
        b=31Pcpla/fkMioBT7y4JhaQJiGLPe/3fIlysYc2zUK2s60NqSaC63VRgG0WVd/TR6Po
         AHmlQrhM4pivgNWXn+2dANRnsvu+yJqex2MjQS8Tx1f3CSXfmU+qGBx+HepdGULiuu5v
         v4/tW3yf3kxcN5ChQppjaplhrs9I+/co03RM6sv+K39YPDYT3KB1vhXsRnzylFSpqdLj
         s5TvJefw+OlUGlmNIcmGpQLMIIUO5vcfTKbajaFB95CeSEYKUVBhmm+uwkx1KuoE99Ub
         LtUDmiJVjp0slUplucgPksF0t6wTFjwoJ1GSLMwMATInIVM6wuiPT5ipJEebMc2vuoUo
         qEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZpkHfYSRxYSO2FF4bHKDC45NyjmryWHHOkPD7CCYZWM=;
        b=MBpE54+RtUl9mZDmG/5PtAMoTGq0xfAq0i0KaotFwkbeTQ09iLNaBTV/NbIOfcvplt
         a+ch5oiNvjZBAbUHCBXnL8dQm3s2Ekb+qFEEYsy+2k7D1dwq1/Y3WLlU8OL7Vfp7nR6l
         ArX0rqQxcompMIRwhAcynxQesqA45B9CSn6lNSPvFVZmBdcwaBeBrbayIr4jL5MKbyGQ
         4d5570snjbxqv56LEhf1yE0tphep0s29euo1Y6XAv2j4v3abwnXptgkgVS8Ibj3AodSc
         2HFNaRMU4yTqEGy0tu9Yx6TqN0ccbMel8qEzjFYH+zlr7Bh1KAA68gYXitFu0R4s12cu
         l7PQ==
X-Gm-Message-State: AOAM531GTfC45nswk+Mewn0NovOv9WPU45RFen3ZqbOD2p16Wx/UYX1V
        l09GIAr2QEJCGmi2hxHmSBxKwsA+pUbq/sJM2gI=
X-Google-Smtp-Source: ABdhPJz9QJUyEmRJd2v99Ndv6u1sa3nZ19VSBnue456wlhVUFo9DBUy8RUp7NuJcGFYb0R4y55LgcQ==
X-Received: by 2002:a17:90a:7c04:b0:1d7:d7e6:2916 with SMTP id v4-20020a17090a7c0400b001d7d7e62916mr8311916pjf.25.1651635924401;
        Tue, 03 May 2022 20:45:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n5-20020aa79045000000b0050dc7628143sm7048962pfo.29.2022.05.03.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 20:45:24 -0700 (PDT)
Message-ID: <6271f6d4.1c69fb81.285d9.231d@mx.google.com>
Date:   Tue, 03 May 2022 20:45:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.18-rc5-178-g63184bc90d435
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 291 runs,
 1 regressions (v5.18-rc5-178-g63184bc90d435)
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

next/pending-fixes baseline: 291 runs, 1 regressions (v5.18-rc5-178-g63184b=
c90d435)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig             | regre=
ssions
-----------+------+--------------+----------+-----------------------+------=
------
da850-lcdk | arm  | lab-baylibre | gcc-10   | davinci_all_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc5-178-g63184bc90d435/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc5-178-g63184bc90d435
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      63184bc90d4357141567ba3f119f9d35173c5c3f =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig             | regre=
ssions
-----------+------+--------------+----------+-----------------------+------=
------
da850-lcdk | arm  | lab-baylibre | gcc-10   | davinci_all_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/6271beda83cb7b0bc4dc7b6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-1=
78-g63184bc90d435/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc5-1=
78-g63184bc90d435/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220428.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6271beda83cb7b0=
bc4dc7b70
        failing since 100 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-03T23:46:13.663994  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-03T23:46:13.664292  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-03T23:46:13.664469  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-03T23:46:13.707053  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =20
