Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5AD73E016
	for <lists+linux-next@lfdr.de>; Mon, 26 Jun 2023 15:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjFZNFE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jun 2023 09:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFZNFD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 09:05:03 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E533598
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2023 06:05:02 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8054180acso7805605ad.1
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2023 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687784702; x=1690376702;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xM9MdZJmPrU4xkfmnkAc9XWK3TSC9o9T5NVSlmQmdtY=;
        b=LRphT6MMsOlOg2vxOIBywR1NUbNj/A88GcEilS7xPcEWv6Ej+7SE6xRxS0yW4e6xVJ
         xqSTvsN6UasEFO2HoIndoptmv3HLQ107pnUIyZpR5LyW+SmDaf/GL2uacYB4JRia1kaH
         rFv2m4xGo3PCPuDnUxoB719GLEl2LRbkEEZoY0uNw9Nt84P1sOv8qEWNT2FJ7/xojOH+
         UpmYYUZ8kOPFcfl9ul5/s4R6eyNW0oaTL9/7IpWjQ8e7iEYajjwE+CmYRP2TtXJ1z/xJ
         WL6/LkmbJe5xHqb/vfmcLwyjQ6Mdh4puk7Ww6PyiWa4YSIpuWUsj0tJAcOhMTt5Vq/PA
         Sexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687784702; x=1690376702;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xM9MdZJmPrU4xkfmnkAc9XWK3TSC9o9T5NVSlmQmdtY=;
        b=T2iIgT7k/jZflDrjH9fGJ+NKmvtVny18i2oOSSVfnOJl9uriySJphk/ouJGZ0SnMUC
         uPn540W1NNxBV8J3nqJwFsH0ENZO+sFuj/cWo5kvy7oxwnS8UkFfNg7M884k80yUd2fO
         WYmVwIZkiUGGdw/TlqYhgA19whrH562rcc7ujpCmTsuahJweO8ZAeEhG6xyQURwZT1yM
         JWIj2wC9x0eTETTWilbAX+/Yq4AC8IRByBGeirTpLTwZBYPbry9cWMekpW7MQAcH/iqN
         hQvWPCXagY+Z/GqY0OyoZDPZwzoPRHNTitAcpz+RiBPCcJkFd4AfKh0uWzEi+zfen5EI
         xogg==
X-Gm-Message-State: AC+VfDwJg9WLwI/0FDYuLf5+xvuFZZE9Gd7FJnKBLrPAtFY5VibgAq6V
        e8Qdf0md+xJB8G7o9QJVd7moWmsR20Kh6mGZIFNjyQ==
X-Google-Smtp-Source: ACHHUZ6Mkpvww8CQA0Xq2flEA6OCzlfMhOx2aiRgOcInAmwU1p74WPDf+yqR/zSnwNLt9rq3qzH7OQ==
X-Received: by 2002:a17:902:c10c:b0:1b5:4709:fa0e with SMTP id 12-20020a170902c10c00b001b54709fa0emr7046747pli.10.1687784701570;
        Mon, 26 Jun 2023 06:05:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jc10-20020a17090325ca00b00199203a4fa3sm3710216plb.203.2023.06.26.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:05:00 -0700 (PDT)
Message-ID: <64998cfc.170a0220.1a9fa.5b72@mx.google.com>
Date:   Mon, 26 Jun 2023 06:05:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230626
Subject: next/master baseline: 98 runs, 2 regressions (next-20230626)
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

next/master baseline: 98 runs, 2 regressions (next-20230626)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | clang-13 | cros://chro=
me...4-chromebook | 1          =

rk3328-rock64              | arm64 | lab-baylibre  | clang-13 | cros://chro=
me...avour.config | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230626/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230626
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      60e7c4a25da68cd826719b685babbd23e73b85b0 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora | clang-13 | cros://chro=
me...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6499598da4bcf20b8130614e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230626/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230626/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6499598da4bcf20b81306=
14f
        failing since 3 days (last pass: next-20230622, first fail: next-20=
230623) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3328-rock64              | arm64 | lab-baylibre  | clang-13 | cros://chro=
me...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/64995824ad3249ca5a30614a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230626/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230626/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64995824ad3249ca5a306151
        failing since 17 days (last pass: next-20221012, first fail: next-2=
0230609)

    2023-06-26T09:19:20.921675  [    5.105631] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3693426_1.5.2.4.1>
    2023-06-26T09:19:21.026607  =

    2023-06-26T09:19:21.128610  / # #export SHELL=3D/bin/sh
    2023-06-26T09:19:21.129225  =

    2023-06-26T09:19:21.230744  / # export SHELL=3D/bin/sh. /lava-3693426/e=
nvironment
    2023-06-26T09:19:21.231535  =

    2023-06-26T09:19:21.333480  / # . /lava-3693426/environment/lava-369342=
6/bin/lava-test-runner /lava-3693426/1
    2023-06-26T09:19:21.334146  =

    2023-06-26T09:19:21.337704  / # /lava-3693426/bin/lava-test-runner /lav=
a-3693426/1
    2023-06-26T09:19:21.396931  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =20
