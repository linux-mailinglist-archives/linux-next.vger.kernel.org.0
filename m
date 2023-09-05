Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F00B792815
	for <lists+linux-next@lfdr.de>; Tue,  5 Sep 2023 18:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236502AbjIEQDF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Sep 2023 12:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347897AbjIEEej (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Sep 2023 00:34:39 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7791B6
        for <linux-next@vger.kernel.org>; Mon,  4 Sep 2023 21:34:35 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-56a9c951aaaso837369a12.3
        for <linux-next@vger.kernel.org>; Mon, 04 Sep 2023 21:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1693888475; x=1694493275; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RJByLWF2wltBGLEQU+fNf8YSlebK29I8GMTS/dFNQ0M=;
        b=k/nLsXx3Eu8VRwRMo6R1+++Q+7m7Yv/kTS20ATum62RyJpIE/6MQ9Y/ITUTSa50AnU
         vScXVMBvSjbYGjsrryRLisU6Ooq7vXGpMslQfmdz0o2pZpWUgRibmHVqgKAqKU9qYi7i
         Xs4gGb8xi9BSpZ08SBmypBVLP/fA82p93PjmtCc8i0yRiu+vDu+cvZ62XguPF7fUssM0
         /FnKlMC+gb8OOVASVJnE759DQ2ktgvv8CRSasyUqFunrE0vAWrDBBuQl1TvTtjURvN1L
         O6Q6Px+yk/obyp23cOZ4dPBWWUirZHtew/JFr0lL7BSSTxk1bUlkjNJVoxP2GLL1uM55
         y+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693888475; x=1694493275;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJByLWF2wltBGLEQU+fNf8YSlebK29I8GMTS/dFNQ0M=;
        b=YRlptqXftFSt89WBdmlMSLOf1IsGICTvpQ+C+fAsCFG9M6QcmjjsWslW8hH5cfgqud
         xdt8BcMTTapEz8dtvdoQr2h5YWePZOM6dZlOO5697mjcXlZbDFZhr7OxAU0Ri+g91rzU
         p5FXtD8ow0AIcwrp7n9V/Tr4LVrYte/K/2O0DYUAI2tLeFCFLHaqULtxEdOvGGjN0xWT
         1KUS9XgHNQgS3aUoY8LgGpYqhpP0MwgEJMIX2FbI4A7DB1X/m5qgbOj5o+zcyRIA/AOq
         21o6oVLhJsJf8m3pNLlxrKpPoLsrHNqmIE/tn2t+33LFNxB+c2YfAeoZCdsd/LNOjMkK
         CMKw==
X-Gm-Message-State: AOJu0YyY9FCYc8ENlhzVJHAB9iL0pBSPAF4KFwhKmow0iWa1R3Lz2L5r
        lJraZ5QEh7a4H+cYXjFc74Zuqr1lP1SHIxz48Yg=
X-Google-Smtp-Source: AGHT+IGuDN5ta8zhW4+UAN3Wze/W3FmF7m4hvYCOjCdkqy3tBQzEMT3V/s9/WhpYv3aoHPRXMQr9lQ==
X-Received: by 2002:a17:902:ec8d:b0:1c2:1c9f:6bd8 with SMTP id x13-20020a170902ec8d00b001c21c9f6bd8mr12475309plg.27.1693888474927;
        Mon, 04 Sep 2023 21:34:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iz2-20020a170902ef8200b001bdc6e13665sm8243606plb.275.2023.09.04.21.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 21:34:34 -0700 (PDT)
Message-ID: <64f6afda.170a0220.18828.0d17@mx.google.com>
Date:   Mon, 04 Sep 2023 21:34:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-12059-g16fdf769151b
Subject: next/pending-fixes baseline: 60 runs,
 2 regressions (v6.5-12059-g16fdf769151b)
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

next/pending-fixes baseline: 60 runs, 2 regressions (v6.5-12059-g16fdf76915=
1b)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =

imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-12059-g16fdf769151b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-12059-g16fdf769151b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      16fdf769151bc97ad78abd022c6c9c8b9d6a3fb2 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64f67d5d2c9c5ec46c286d7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-12059-=
g16fdf769151b/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoco=
mm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-12059-=
g16fdf769151b/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innoco=
mm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f67d5d2c9c5ec46c286=
d7e
        new failure (last pass: v6.5-5353-gb22935905f9c) =

 =



platform                 | arch  | lab             | compiler | defconfig |=
 regressions
-------------------------+-------+-----------------+----------+-----------+=
------------
imx8mp-evk               | arm64 | lab-broonie     | gcc-10   | defconfig |=
 1          =


  Details:     https://kernelci.org/test/plan/id/64f67d776030634c11286e33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-12059-=
g16fdf769151b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-12059-=
g16fdf769151b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f67d776030634c11286e38
        new failure (last pass: v6.5-5353-gb22935905f9c)

    2023-09-05T00:59:23.964699  + set<8>[   28.456005] <LAVA_SIGNAL_ENDRUN =
0_dmesg 86926_1.5.2.4.1>
    2023-09-05T00:59:23.965329   +x
    2023-09-05T00:59:24.074570  / # #
    2023-09-05T00:59:25.240968  export SHELL=3D/bin/sh
    2023-09-05T00:59:25.247081  #
    2023-09-05T00:59:26.690429  / # export SHELL=3D/bin/sh. /lava-86926/env=
ironment
    2023-09-05T00:59:26.696506  =

    2023-09-05T00:59:29.308165  / # . /lava-86926/environment/lava-86926/bi=
n/lava-test-runner /lava-86926/1
    2023-09-05T00:59:29.314958  =

    2023-09-05T00:59:29.323311  / # /lava-86926/bin/lava-test-runner /lava-=
86926/1 =

    ... (12 line(s) more)  =

 =20
