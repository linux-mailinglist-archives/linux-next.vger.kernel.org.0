Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819CF7ACF25
	for <lists+linux-next@lfdr.de>; Mon, 25 Sep 2023 06:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjIYEcB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Sep 2023 00:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjIYEcA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Sep 2023 00:32:00 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A6EDF
        for <linux-next@vger.kernel.org>; Sun, 24 Sep 2023 21:31:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c60f1a2652so9236135ad.0
        for <linux-next@vger.kernel.org>; Sun, 24 Sep 2023 21:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695616312; x=1696221112; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/d+ntPgZwpZmVvYlb6k2RWcOOapCIaR7Ogoex8224DY=;
        b=irlI6XAcoaffgbZFMugG34zLgisnZHB/Y7uS6GS32wGyipSZdY32wDlOMIf1z/liHw
         bqteD6BU52Jcrhk7FRSJzUcRtNZu5Ovu3olUTVqUibqMzByxTir1vEPSKZy9z4VH/4wl
         pSdROuaftA5WI7MfcdyJBTHvUOnSf4EHDSh479gp2m1vIcJjNmiJm83kFy2ECce7Az24
         5RyBF4oHrRLt3lhToCcNfBsDrHpmhLZ4R+8gXLqaI4EdZ5RPIWqgOV8ffmxxq3IlkBCV
         xPUOwTjpEuLC/tiTAhOwfjrlKd9XmuTpqLYJxLiQEa2RyDPFqWiGjXLnegbAOaR5bFkB
         U+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695616312; x=1696221112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/d+ntPgZwpZmVvYlb6k2RWcOOapCIaR7Ogoex8224DY=;
        b=Qh5ONpAbz9sW3R37XOgn4ElXLGC0d4GZiMxWISdvV9fwVTf9A9T9mcepZoXACdlnQm
         uvFTunonvyicrPHyIE8wf8CBB0vLvRhpiIGOZa4jnZc0o7Yr5rEXS+vWsgPtDt+92Wgn
         fSxoctN6hgcLZZa/4RmJpIXCrwP7sLfyppY+4EvVCMAOThcgswGpihwfrY7LI0R1WbPO
         N5dhjoPnftOP4b+U2cFuNkbxRYY+6NUOg4nf7YWLiOY6dUlpbz0vxS/E69bDtu4zNSns
         WpqXQp7sEovr6kgC0aO78y6KuNPp8hJMmic33v5ixAlAOkA6ihvHR31se/fng2/jW3AW
         dnFQ==
X-Gm-Message-State: AOJu0YxuhspCVFAtyvma01/MMdyfV7V5MvBKE2tZE5t7hW4lTiSqW3XV
        vM4HU1vamqnL00xb5niAMzYj4OvIUZw91XI1PqPsMQ==
X-Google-Smtp-Source: AGHT+IGxxCyNXXW9og+2IMm8kFoBusg0TgY0vW9yE/0isjBF3lnlzIv2lyj+FSweRl2OnxDQQDVdRA==
X-Received: by 2002:a17:903:230b:b0:1c0:bcbc:d66 with SMTP id d11-20020a170903230b00b001c0bcbc0d66mr8743060plh.7.1695616312491;
        Sun, 24 Sep 2023 21:31:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o3-20020a170902d4c300b001b8622c1ad2sm7634763plg.130.2023.09.24.21.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 21:31:51 -0700 (PDT)
Message-ID: <65110d37.170a0220.97792.363f@mx.google.com>
Date:   Sun, 24 Sep 2023 21:31:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-217-geba2d8a9dfc5
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 45 runs,
 2 regressions (v6.6-rc3-217-geba2d8a9dfc5)
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

next/pending-fixes baseline: 45 runs, 2 regressions (v6.6-rc3-217-geba2d8a9=
dfc5)

Regressions Summary
-------------------

platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
imx8mp-evk         | arm64 | lab-broonie | gcc-10   | defconfig | 1        =
  =

kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc3-217-geba2d8a9dfc5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc3-217-geba2d8a9dfc5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      eba2d8a9dfc51f4f4c72ff31e43064a502807453 =



Test Regressions
---------------- =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
imx8mp-evk         | arm64 | lab-broonie | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/6510debce0158edcd48a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-21=
7-geba2d8a9dfc5/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-21=
7-geba2d8a9dfc5/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6510debce0158edcd48a0a4b
        failing since 20 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-25T01:13:14.517943  + set<8>[   27.594771] <LAVA_SIGNAL_ENDRUN =
0_dmesg 129732_1.5.2.4.1>
    2023-09-25T01:13:14.518344   +x
    2023-09-25T01:13:14.627493  #
    2023-09-25T01:13:15.793657  / # #export SHELL=3D/bin/sh
    2023-09-25T01:13:15.799777  =

    2023-09-25T01:13:17.298585  / # export SHELL=3D/bin/sh. /lava-129732/en=
vironment
    2023-09-25T01:13:17.304590  =

    2023-09-25T01:13:20.027192  / # . /lava-129732/environment/lava-129732/=
bin/lava-test-runner /lava-129732/1
    2023-09-25T01:13:20.033820  =

    2023-09-25T01:13:20.037903  / # /lava-129732/bin/lava-test-runner /lava=
-129732/1 =

    ... (12 line(s) more)  =

 =



platform           | arch  | lab         | compiler | defconfig | regressio=
ns
-------------------+-------+-------------+----------+-----------+----------=
--
kontron-pitx-imx8m | arm64 | lab-kontron | gcc-10   | defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/6510de22123a100b4d8a0aa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-21=
7-geba2d8a9dfc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc3-21=
7-geba2d8a9dfc5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6510de22123a100b4d8a0=
aa3
        new failure (last pass: v6.6-rc2-432-g1785a80001120) =

 =20
