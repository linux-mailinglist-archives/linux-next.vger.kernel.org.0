Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42BF4F1CAE
	for <lists+linux-next@lfdr.de>; Mon,  4 Apr 2022 23:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349150AbiDDV2c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Apr 2022 17:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379846AbiDDSRY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Apr 2022 14:17:24 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6240A3EA8F
        for <linux-next@vger.kernel.org>; Mon,  4 Apr 2022 11:15:28 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id h24so5395367pfo.6
        for <linux-next@vger.kernel.org>; Mon, 04 Apr 2022 11:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jW4ivyk/IhtGx/e/FAwF/L+eSzIBLSv36eJiuFEUNr4=;
        b=ilTDYmTOPIXRpGeeS2mhw0+7TsduJzz30fdvUsmRI2of2xxGHN0HhcRTZDFbLKagNq
         78dYZpfpH9vz7EeqKiEyoGw1XdoX9aLQwSCdBtLl7eRLWQaTXeHJK23AX/ttpq6dEg9B
         RQaWgXvjr6HzLAWaS8vjsw01Q9H0xGb54tlxJdURMdfi054t2oVrab3t9XCoGHk9HlWn
         Mr1stLyeu4LxzArTx/giLHsNqOiJveKoJ5J7XgHziUsyhYuKBP8Xho5ObX8Xdhj+4Y6E
         GXgqetKC4I+A6rJMuWcQO+9KZeyHVbjEXxoMrcvdV/48wZSNfySibKucnhHYuhSCr6RN
         niiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jW4ivyk/IhtGx/e/FAwF/L+eSzIBLSv36eJiuFEUNr4=;
        b=uCx8oUOFO822JLs1kunMDqbRox61ckS5PW/vkBPkVfLTLYg9hIAJnSxTlNNuepn1lT
         qiOSNJ3UjpSF8NlsU307vDMOVy5UrAuLY0E3kwtIfIENap02HCzb6Bqbdd0yRbUZ11qR
         0+ESvJ8rvnRcLBWbeDoJzN24dgolja/I5YrM2+p2Qb8F0K5MsSGIQNcBNhU9wJ1Iyiqb
         vFku37Ox/2JKakXhDBuWtN+1B/H1v1Fb4/ZWdXLB4HtUtTw7T7ONEMekefqkrw9cDVNY
         WjUP2mwkH3rKsAGWy4/Mg/CiKqMoqkaL49GwmFC6diSGfozdvvMTKs8HzX8WOjBDhZLi
         wHJw==
X-Gm-Message-State: AOAM532UGHGSHKsApULcSkD/Z7EKYogzcNk/uQxQFQd+CgNWKMC2y1YQ
        XYy8PB3mR2mH9z4D//4YlsG9jZJpHdvbsKeW8Zk=
X-Google-Smtp-Source: ABdhPJz2L5MOGlVZhP09Mp/S2JvdbghlWo2GvqaBlOlL5A/Q4Ic+BtcaOmX5PSznoLEd2/rhnVLlIA==
X-Received: by 2002:a63:ad45:0:b0:382:2459:5bc6 with SMTP id y5-20020a63ad45000000b0038224595bc6mr993947pgo.474.1649096127694;
        Mon, 04 Apr 2022 11:15:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090ae38700b001ca8947e73csm146638pjz.0.2022.04.04.11.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:15:27 -0700 (PDT)
Message-ID: <624b35bf.1c69fb81.b48e7.0a51@mx.google.com>
Date:   Mon, 04 Apr 2022 11:15:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220404
X-Kernelci-Report-Type: test
Subject: next/master baseline: 257 runs, 3 regressions (next-20220404)
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

next/master baseline: 257 runs, 3 regressions (next-20220404)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220404/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220404
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      696206280c5e5c028caf9fd259999cb72b1f6127 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624aeec2d4dcf59086ae068a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220402053242+23d08=
271a4b2-1~exp1~20220402053316.109)
  Plain log:   https://storage.kernelci.org//next/master/next-20220404/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220404/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624aeec2d4dcf59086ae0=
68b
        new failure (last pass: next-20220401) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624af1e14108064f1cae06ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220404/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220404/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624af1e14108064f1cae0=
6cb
        failing since 6 days (last pass: next-20220328, first fail: next-20=
220329) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624b0f5ea52dcbf214ae0684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624b0f5ea52dcbf214ae0=
685
        failing since 25 days (last pass: next-20220308, first fail: next-2=
0220309) =

 =20
