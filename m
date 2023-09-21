Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487697A911B
	for <lists+linux-next@lfdr.de>; Thu, 21 Sep 2023 04:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjIUCzW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Sep 2023 22:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjIUCzV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Sep 2023 22:55:21 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9491E4
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 19:55:15 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso105758b3a.2
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 19:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695264915; x=1695869715; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i1kqngRJ6mUAtlJsNtkbez4aM5ssVy8XL+W9uvKxyUg=;
        b=aR2HBM8l5MsCF/xGTyk1Qhy1LNlfcvezf+jLlw3AxQMJptk4YT8VPeSWXoJLRAfBGx
         LYJKLzb0MR/0O43evLTTDvjd6Vt3KEGCVavwAC00vtK48BRk6F3RZ3/hhOKDyrD0bAQC
         aE2NTkGuVkVaDsBtI/iexdrhMk66tKso23TJlKzmPKvmcbkKUl1+Er6L18b4ZlsZmmIu
         P0YQmuXpBF7oLG1ij80giD3QOvwIWpRDT0v+akrMBGs2RhZr6bS2Db7vBTdlKFDOWBMc
         ERA3O9V+ad6IS0URSKXEUrobwPfyBfsjQsKEHW1tsFU1xm2Q/lNRdqh/ZciQpqUiAqnM
         F7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695264915; x=1695869715;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1kqngRJ6mUAtlJsNtkbez4aM5ssVy8XL+W9uvKxyUg=;
        b=El4mK8JWoHsMfyeSyDh7iI9r5EnaRxxmJcTKUO310lZqxNuYW5QVO92Nocb/wkXBix
         NjOZhWdjEbHrTmLGHNsbv9tCTnUkvVjqV3oxWLELQQ4moFrlg3fLNjupk17L8YUC51X8
         t0mEgQYLHPInIRzxpwVg6SsL+b9fMg8xg4IJjXDg0VOXrST0RS2YVf30sREnTxckUvLu
         3+Is/nxmvBhwJaLwiyQ3RxJduaprb6z5X9nLyXvqrORgWJoMbEHrAjJEDkiANn9TPyR8
         2d1O8tjlZjGHkMcL7LPnqFkfPV4vvEQvrg7ee1n6sl6/olruhwM/dHST7jp75OnBGe6x
         b/9w==
X-Gm-Message-State: AOJu0Yz4Z9Q319xBfC6LL1q9akf1wEPzqoSvA8sUYTzBvTezA+6UMncm
        yIHVLI9X7zhbfoYYr1RrK76m0H24N100LXAoDd2XAQ==
X-Google-Smtp-Source: AGHT+IEy9VXsMQRc6ZX4j1e7vCkyCeAn8+6UibMyEvT/eSflqyuhxu3Knz8M+YBbGQK70tAgGoVl7A==
X-Received: by 2002:a05:6a00:1950:b0:68f:a5ff:3f3a with SMTP id s16-20020a056a00195000b0068fa5ff3f3amr4617592pfk.11.1695264914831;
        Wed, 20 Sep 2023 19:55:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x3-20020a056a00270300b00653fe2d527esm213697pfv.32.2023.09.20.19.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 19:55:14 -0700 (PDT)
Message-ID: <650bb092.050a0220.99009.1781@mx.google.com>
Date:   Wed, 20 Sep 2023 19:55:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-432-g1785a80001120
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 49 runs,
 1 regressions (v6.6-rc2-432-g1785a80001120)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 49 runs, 1 regressions (v6.6-rc2-432-g1785a800=
01120)

Regressions Summary
-------------------

platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc2-432-g1785a80001120/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc2-432-g1785a80001120
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1785a80001120a6d3c04ded80f1f06c116d684e4 =



Test Regressions
---------------- =



platform   | arch  | lab         | compiler | defconfig | regressions
-----------+-------+-------------+----------+-----------+------------
imx8mp-evk | arm64 | lab-broonie | gcc-10   | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/650b7daa13771bbaff8a0a46

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-43=
2-g1785a80001120/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc2-43=
2-g1785a80001120/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650b7daa13771bbaff8a0a4f
        failing since 15 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-09-20T23:17:45.021700  + set<8>[   29.043016] <LAVA_SIGNAL_ENDRUN =
0_dmesg 121433_1.5.2.4.1>
    2023-09-20T23:17:45.022272   +x
    2023-09-20T23:17:45.130551  / # #
    2023-09-20T23:17:46.296535  export SHELL=3D/bin/sh
    2023-09-20T23:17:46.302688  #
    2023-09-20T23:17:47.801728  / # export SHELL=3D/bin/sh. /lava-121433/en=
vironment
    2023-09-20T23:17:47.807841  =

    2023-09-20T23:17:50.531188  / # . /lava-121433/environment/lava-121433/=
bin/lava-test-runner /lava-121433/1
    2023-09-20T23:17:50.537869  =

    2023-09-20T23:17:50.540830  / # /lava-121433/bin/lava-test-runner /lava=
-121433/1 =

    ... (12 line(s) more)  =

 =20
