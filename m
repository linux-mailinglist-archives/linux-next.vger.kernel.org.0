Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33AE7EBBE6
	for <lists+linux-next@lfdr.de>; Wed, 15 Nov 2023 04:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbjKODcY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Nov 2023 22:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbjKODcY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2023 22:32:24 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397E7C3
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 19:32:20 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc34c3420bso50030225ad.3
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 19:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700019139; x=1700623939; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cBUhGSteMV44Xy3ZuBx9sgpmwczTY4oy2w74y0AMAjo=;
        b=pu6rxSCVi+tF6bCyEw5AKDAXBltGuVREkieUkD4qBG5AjvlLTSz9VlBt1h3zSw/GfO
         H5VCb2lf0vYj80SIENgAQdMppKbFWnPEduu0AI6RnYVtuGkhWF9ebhnQb3xNUCUxB3wU
         aRjJ3/YlFywohHSnLl0e4Xn/oehcSxzVdEp0TDH+MrVoC78Q2L05yxmwjZERCjkz1MSQ
         Rdm9QfH5i92bZXs/iqLe8RONs0TabSon1x0b+0WuoCqWmocOtgN86u+71J53oElVtm/b
         zvh6G9AOpgap1gvJAXVMZzrUnWkjtCr2L24bNi3bOv6naAoRVg2yjUunAp982M1gGqUx
         RD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700019139; x=1700623939;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBUhGSteMV44Xy3ZuBx9sgpmwczTY4oy2w74y0AMAjo=;
        b=dh6W0gUvVb/+81G8d42ZTyOTrBo0CMZMJA/btsTrGxi2FT7sUW6oxLrxhlHQYc6Jiz
         wn99OJrwy6PXH3fmg5g38CFCoDg7zk0CIqwZ6Jj1fsZCaOC842qt2XDkjPWs7SkOVNg2
         YDHbQWkhKofKrPgKFGM7KgkXDbVbrszP3PvCQwbAuSMThzp6yLsy4AnjBXHwCq0mDNe/
         otih5Y01/ytgehVfg3894fy1f/eczk+aFWgKztMk/b+AV0kZfqYBVA8US/fFc6PuYQTG
         8wqVo9BPL9bBJc40BYPPYMjRulhMece1xp9gsKkqX3/izrOFLz8ZHJlz2dwMZQwv0+RY
         NoDw==
X-Gm-Message-State: AOJu0YxdL+JQriIvoHfma4DJeWycxJazYtIQ/5xl1QO7DNMrSz18q23B
        v1gQ9yaJr/8Y9JKcs5HP5klLbaSYWSsFtMeOloKrDw==
X-Google-Smtp-Source: AGHT+IFGHGOXLtWg5iG/Lc5jMVQE9lRw/ifJOn25NBQ+ddzEaSghEpMtDF5FkM8REp8bMbnsSRj0dg==
X-Received: by 2002:a17:902:ef94:b0:1cc:32ce:bd9 with SMTP id iz20-20020a170902ef9400b001cc32ce0bd9mr3925033plb.69.1700019139096;
        Tue, 14 Nov 2023 19:32:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z11-20020a1709027e8b00b001b9e9edbf43sm6624184pla.171.2023.11.14.19.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:32:18 -0800 (PST)
Message-ID: <65543bc2.170a0220.4c555.1d5a@mx.google.com>
Date:   Tue, 14 Nov 2023 19:32:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-127-gaea4a488542f
Subject: next/pending-fixes baseline: 108 runs,
 4 regressions (v6.7-rc1-127-gaea4a488542f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 108 runs, 4 regressions (v6.7-rc1-127-gaea4a48=
8542f)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
kontron-pitx-imx8m    | arm64 | lab-kontron  | gcc-10   | defconfig        =
  | 1          =

meson-gxl-s905d-p230  | arm64 | lab-baylibre | gcc-10   | defconfig        =
  | 1          =

sun7i-a20-cubieboard2 | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =

sun7i-a20-cubieboard2 | arm   | lab-clabbe   | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc1-127-gaea4a488542f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc1-127-gaea4a488542f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aea4a488542fb2f54a04350919955bc91a79bd8b =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
kontron-pitx-imx8m    | arm64 | lab-kontron  | gcc-10   | defconfig        =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/65540b6b93651b75767e4a75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65540b6b93651b75767e4=
a76
        new failure (last pass: v6.7-rc1-105-g3e62c2378662) =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre | gcc-10   | defconfig        =
  | 1          =


  Details:     https://kernelci.org/test/plan/id/65540c26d0d912a7187e4abc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905=
d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905=
d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65540c26d0d912a7187e4=
abd
        new failure (last pass: v6.7-rc1-105-g3e62c2378662) =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
sun7i-a20-cubieboard2 | arm   | lab-baylibre | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/65540b39dbea55f62c7e4a88

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a=
20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a=
20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65540b39dbea55f62c7e4a91
        new failure (last pass: v6.4-rc7-260-g7124fb0a8216)

    2023-11-15T00:04:44.497018  / # #
    2023-11-15T00:04:44.599690  export SHELL=3D/bin/sh
    2023-11-15T00:04:44.600084  #
    2023-11-15T00:04:44.700983  / # export SHELL=3D/bin/sh. /lava-3833969/e=
nvironment
    2023-11-15T00:04:44.702071  =

    2023-11-15T00:04:44.804057  / # . /lava-3833969/environment/lava-383396=
9/bin/lava-test-runner /lava-3833969/1
    2023-11-15T00:04:44.805615  =

    2023-11-15T00:04:44.821214  / # /lava-3833969/bin/lava-test-runner /lav=
a-3833969/1
    2023-11-15T00:04:44.942921  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-15T00:04:44.943938  + cd /lava-3833969/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform              | arch  | lab          | compiler | defconfig        =
  | regressions
----------------------+-------+--------------+----------+------------------=
--+------------
sun7i-a20-cubieboard2 | arm   | lab-clabbe   | gcc-10   | multi_v7_defconfi=
g | 1          =


  Details:     https://kernelci.org/test/plan/id/65540ae989e37d7bdd7e4a9b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-12=
7-gaea4a488542f/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20=
-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65540ae989e37d7bdd7e4aa4
        new failure (last pass: v6.4-rc7-260-g7124fb0a8216)

    2023-11-15T00:03:31.014000  + set +x[   19.893079] <LAVA_SIGNAL_ENDRUN =
0_dmesg 444016_1.5.2.4.1>
    2023-11-15T00:03:31.014304  =

    2023-11-15T00:03:31.122242  / # #
    2023-11-15T00:03:31.223859  export SHELL=3D/bin/sh
    2023-11-15T00:03:31.224405  #
    2023-11-15T00:03:31.325411  / # export SHELL=3D/bin/sh. /lava-444016/en=
vironment
    2023-11-15T00:03:31.325961  =

    2023-11-15T00:03:31.427012  / # . /lava-444016/environment/lava-444016/=
bin/lava-test-runner /lava-444016/1
    2023-11-15T00:03:31.427892  =

    2023-11-15T00:03:31.431304  / # /lava-444016/bin/lava-test-runner /lava=
-444016/1 =

    ... (12 line(s) more)  =

 =20
