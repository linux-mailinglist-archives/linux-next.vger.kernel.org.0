Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7286944BDA5
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 10:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhKJJSj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Nov 2021 04:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhKJJSj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Nov 2021 04:18:39 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E16C061764
        for <linux-next@vger.kernel.org>; Wed, 10 Nov 2021 01:15:52 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n23so1712745pgh.8
        for <linux-next@vger.kernel.org>; Wed, 10 Nov 2021 01:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Apki7qwDOvaKC59DAIjXpM8oslxgNcCqlkb3u2W1RCc=;
        b=fJZO0TRmbzhRmVPx6njLhNmcDTMlhRCCAnYH786/SK9Ozh2d3SvcViM0H2QStWSb9q
         zYedNUH9WnlF+BAU1G7jXNoDFyUVVCATsYb8wnbcnCjTWO14jccddy3ONLVHNAxCUbdo
         u35DeLiMBIsNTZymB9RVAmUgPJJwy9brnSmP5x+UfjFxLd4cB2DV0F0C36xexgx0rWhB
         dslvvQcevAyaMSmXWbzDW9ejstKPNL1+dcWhVq56tC35SHXT8AatQIv6iuePILNTz/xh
         MZNCZb4cUaeN6pjYCnz3y704mS2ylEj/OqLRUzR9cder+st2+eDlxjet8Y/g+7WXKRyO
         TFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Apki7qwDOvaKC59DAIjXpM8oslxgNcCqlkb3u2W1RCc=;
        b=NKCBL3FkbjIfCZuwzCxmJ/FCvzPKO636BsuH6lzQbPjwBXHkXkxXtQUQHL2g2Rk+mv
         C2Vr+CsylWZifUtW8NovJLAV9uX6gxmY8RrGB87M5eYXgQQTqhgBbaomyw/m6EkgUKxv
         U4MItcKC+L8lvS5wfvw+1MLsjyXZs/OvvEU9drAQe1SKaGVsya1N8W0ZIuk4+5UbGfNT
         Xdfgu/J0dspITwcSY8l+1NNNL740oEJWALFaDYggSPfsjIQSpRkCJLdKX6cPT6GeLe6J
         zpEALJFgvY6saLOAUBRL0R8XoQxXtyHxxzgNG9fJgZgb1yBU0bv9sRL3RyPqYC/09TE6
         mbOw==
X-Gm-Message-State: AOAM531qRqdA/HqU/e3omAbSbcMBtDUEpNwCzbQhrG4+poiO25vTOtWE
        BzXmptzOwPuoVbGbG6ODJ/SFTiaDEcZTkZZU
X-Google-Smtp-Source: ABdhPJwVChAb2uxy7kOhAcbBAcD4KDzIu3lQ01VII17/l4nYroUOteFn+/dBOAOJAMJAFSb1r6c99Q==
X-Received: by 2002:a62:e908:0:b0:49f:c633:51ec with SMTP id j8-20020a62e908000000b0049fc63351ecmr27138166pfh.1.1636535751577;
        Wed, 10 Nov 2021 01:15:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 130sm22058539pfu.170.2021.11.10.01.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 01:15:51 -0800 (PST)
Message-ID: <618b8dc7.1c69fb81.de5c6.3f6d@mx.google.com>
Date:   Wed, 10 Nov 2021 01:15:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211110
X-Kernelci-Report-Type: test
Subject: next/master baseline: 870 runs, 4 regressions (next-20211110)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 870 runs, 4 regressions (next-20211110)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | clang-13 | multi_v7_def=
config           | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =

r8a774c0-ek874           | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211110/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211110
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      73e5c18006f5e1f7d35d1e996609eaff6536ae5e =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/618b53e16b3fb761bc3358eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211110/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211110/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b53e16b3fb761bc335=
8ec
        failing since 13 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618b59c60f0b6879ea3358eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b59c60f0b6879ea335=
8ec
        new failure (last pass: next-20211109) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/618b60ae40000d1ddf3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211110/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211110/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618b60ae40000d1ddf335=
8dd
        new failure (last pass: next-20211109) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774c0-ek874           | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618b572694b744ebc33358ec

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/618b572694b744e=
bc33358f1
        failing since 1 day (last pass: next-20211108, first fail: next-202=
11109)
        1 lines

    2021-11-10T05:22:17.983371  kern  :emerg : Disabling IRQ #141
    2021-11-10T05:22:18.022323  <8>[  218.475541] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-10T05:22:18.022502  + set +x
    2021-11-10T05:22:18.022614  <8>[  218.485635] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 515585_1.5.2.4.1>   =

 =20
