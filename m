Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C4E44304D
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 15:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhKBO0b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 10:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhKBO01 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 10:26:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C293C061205
        for <linux-next@vger.kernel.org>; Tue,  2 Nov 2021 07:23:53 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id s136so20286983pgs.4
        for <linux-next@vger.kernel.org>; Tue, 02 Nov 2021 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bLP0GZ7qKmzdEoB4Kwa9VdCVCA5n7rW4EYZQ1W3DYaU=;
        b=gwX2g7u9YF/BIEYDH5ide/+9kRap3aYd8/a/ydo6nRaZngxCW/b5a2Ah9oPGEhiUm/
         sFp++7KNuIPorf2a8n2RpgGwr1+Gs7SLZ84Q3U0hQaCLnz2WCZdGx45NWw/CiW39qMkJ
         y7HFUBdA/CiDNFryFmnY1pwO0JBgERiPMz7lBkY2owrGBWKvcP6K8yfJ+25KaHGACSmS
         v2ScTsJHsHViEXVaxjODGZmbVnH34WW8aQcSbg91/SgUDKuZUXxyuBHwfLZ1LwmdlQzS
         pKxmH4dOMfa2Va5il0qEFHiezC+OIKJ/ZcJnn/8rv6CmAZvmB2k0ZfAsLKZshQGKiYPS
         yN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bLP0GZ7qKmzdEoB4Kwa9VdCVCA5n7rW4EYZQ1W3DYaU=;
        b=6ZyvauT6CJBFQaVrG6c1jTGBCkqjuAxh74JWxkXJGrEb80CV8kQNnAYb6q4VIsyh5U
         q0DifeH+SxpSelYPBAGS3vHRmLG8ADMIWuRt0GOX6fjCLGnCiHKJwrI9v/GGUzJ1MYJp
         0vSjEpNmixBa28Wjy80TmVJtbMOkeEFeL9X8rOJlOtYRY9H4qJcjZZ+qo1OXNo98jaQL
         V8i3VJjpsdm01NDGOYH8+I1OgsT+xz5Lh33JYptw83FBfRNcUcUErC5JepqhUXPDDawA
         JhJjK5/OJ8TBP0q92rrHZxId98zRIRvAldyf4BDuXFV/lmr9l7dAnyriqTwa7yFIq48N
         gBKg==
X-Gm-Message-State: AOAM532sZKE3dltO8vBtml1lMvCZfEIsli5o61zwCjnkGA6vnSROoSZ3
        C/dpQELadakj04FmglIVC0JuipbG4PuFjGRW
X-Google-Smtp-Source: ABdhPJzUThmeifOlMBkSL7cn+g9ax3h8c33sHNTjauXxfwltQiZTpQgDVirsRnj1arp6Z77ZEvH6Mg==
X-Received: by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP id s5-20020a056a00194500b0044ca95535eamr36489359pfk.85.1635863032397;
        Tue, 02 Nov 2021 07:23:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v8sm17945669pfu.107.2021.11.02.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:23:52 -0700 (PDT)
Message-ID: <618149f8.1c69fb81.65cd.fed5@mx.google.com>
Date:   Tue, 02 Nov 2021 07:23:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211102
X-Kernelci-Report-Type: test
Subject: next/master baseline: 679 runs, 2 regressions (next-20211102)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 679 runs, 2 regressions (next-20211102)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig     =
      | 1          =

imx8mn-ddr4-evk | arm64 | lab-nxp      | gcc-10   | defconfig+CON..._64K_PA=
GES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211102/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211102
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9150de4aac1eb6e6441b2b086f6ca8132aaea040 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig     =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/618114480ffacbd81f335914

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211029101439+08e3a=
5ccd952-1~exp1~20211029222017.20)
  Plain log:   https://storage.kernelci.org//next/master/next-20211102/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211102/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618114490ffacbd81f335=
915
        failing since 5 days (last pass: next-20211026, first fail: next-20=
211027) =

 =



platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
imx8mn-ddr4-evk | arm64 | lab-nxp      | gcc-10   | defconfig+CON..._64K_PA=
GES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61810ef31f2da394ef3358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211102/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211102/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61810ef31f2da394ef335=
8e9
        new failure (last pass: next-20211026) =

 =20
