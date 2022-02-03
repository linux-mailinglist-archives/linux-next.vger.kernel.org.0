Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2020F4A7F21
	for <lists+linux-next@lfdr.de>; Thu,  3 Feb 2022 06:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbiBCFjK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Feb 2022 00:39:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236594AbiBCFjJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Feb 2022 00:39:09 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF0FC061714
        for <linux-next@vger.kernel.org>; Wed,  2 Feb 2022 21:39:09 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p12-20020a17090a2d8c00b001b833dec394so1885185pjd.0
        for <linux-next@vger.kernel.org>; Wed, 02 Feb 2022 21:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6ITuWZH/Hzimck7FRn28aS+KlzZEWmE1d5zsq3HJaag=;
        b=GjWEmtbxZvn5bOhwG2myK9MdwTAvqNwSf/MVO4EYmoj5R2HrYdXl5ua76lMtLqcy42
         WF4Sr9P3vZ1vYMB4YZj0FrkaeJaiO2r3dKqQb8y1Ven0ORa43vV+a9M2acrSNty9kEFm
         LnVTcyYj/sOdVtwjoL53rpVhIwI7FS8EV/NBrt5gpAUFAUaP7KLcM7HDOy5QWZULZDCG
         WeTFafs6zCtye7/+s5BsQ8txN+7ufsJzq0W8BMU7mpxWKoo8ViKxCPdlWw616nL7q7y+
         UIqjhh0qzB7FnhLOzRGcpQWDRwggi1CkWz/njDbzucS3yL8O82VUiL3P82zYPI61UuBH
         mCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6ITuWZH/Hzimck7FRn28aS+KlzZEWmE1d5zsq3HJaag=;
        b=zdpUKyZFBLRjnnnrT79uhYmYyVjUJ0VEij/XZhLAcwiDF6qKi8Tbp3miWGYra2l5oi
         NKCbaN4LYuIfcVlE8zoqN4GSUfNi7Zd5AMJflOn/xhFWhEWs3QRuWb2v1YrcxIA6TqFe
         SRC9F7YjBhGmvHiwAI0vN0bsSmt3CRJCYutdBq+qEjBt/XHOJVvWqmmIt9k4z13zMDIe
         Ma1hx26mQSdNHOFpQtAzMhYyPYt3xfMDe1goq6ker/B8WN01ABRc7vZTF+RQHxEzt24Q
         yftJLHWyivyvFLa/H4Borxc47JZP4jidK3gVckdADUT8nGyOB5zI79tnd3in71ONWBZ4
         xoNw==
X-Gm-Message-State: AOAM532p+LVBMdwMcCdE/l83UWcWUl2yIbeoly+1Y9EvkVJPAZkAyF93
        mss+iWDR2KKoXJuH6NPxQcOiBwo0Dh4AS0OE
X-Google-Smtp-Source: ABdhPJw0ck9G+pAa58Qu+kqKO8m8LH51dml517h5LyukU1fHqguJA1vwlFTphKK/RevJRrdnbA6CyA==
X-Received: by 2002:a17:90b:3ec4:: with SMTP id rm4mr7707787pjb.102.1643866748615;
        Wed, 02 Feb 2022 21:39:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g17sm9199618pfj.148.2022.02.02.21.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 21:39:08 -0800 (PST)
Message-ID: <61fb6a7c.1c69fb81.7a1fa.77b4@mx.google.com>
Date:   Wed, 02 Feb 2022 21:39:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-rc2-341-g1c6ffcd3a088
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 528 runs,
 2 regressions (v5.17-rc2-341-g1c6ffcd3a088)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 528 runs, 2 regressions (v5.17-rc2-341-g1c6ffc=
d3a088)

Regressions Summary
-------------------

platform                | arch  | lab        | compiler | defconfig        =
            | regressions
------------------------+-------+------------+----------+------------------=
------------+------------
imx6ul-14x14-evk        | arm   | lab-nxp    | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc2-341-g1c6ffcd3a088/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc2-341-g1c6ffcd3a088
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1c6ffcd3a088399439aa77d33ee6d08e0f44c75e =



Test Regressions
---------------- =



platform                | arch  | lab        | compiler | defconfig        =
            | regressions
------------------------+-------+------------+----------+------------------=
------------+------------
imx6ul-14x14-evk        | arm   | lab-nxp    | gcc-10   | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb343a5e32c5aaf35d6f47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-3=
41-g1c6ffcd3a088/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-3=
41-g1c6ffcd3a088/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb343a5e32c5aaf35d6=
f48
        failing since 13 days (last pass: v5.16-7998-gbeebf0a29205, first f=
ail: v5.16-11408-ga51e80162547) =

 =



platform                | arch  | lab        | compiler | defconfig        =
            | regressions
------------------------+-------+------------+----------+------------------=
------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe | gcc-10   | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61fb314df7dc9357f05d6f13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-3=
41-g1c6ffcd3a088/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-3=
41-g1c6ffcd3a088/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61fb314df7dc9357f05d6=
f14
        new failure (last pass: v5.17-rc1-212-g930c0caea669) =

 =20
