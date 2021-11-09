Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A44144A853
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 09:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237274AbhKIIbu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 03:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236798AbhKIIbu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 03:31:50 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0575C061764
        for <linux-next@vger.kernel.org>; Tue,  9 Nov 2021 00:29:04 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id y1so19572359plk.10
        for <linux-next@vger.kernel.org>; Tue, 09 Nov 2021 00:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y3kXXl7VAYNf/2w9vgfK95fHu1SIHy92233TbWo65bY=;
        b=mUr8VCEprBJDtbr5XZhZnNd56/gGMQguRb8w4HPzyK6EjixpA7Vg8CHRN25ECiFq20
         9FqiFXSWkTofcv7XO/r/NzGXiaEfbUZ5TOYn+sxq5SBmrVA8eu8mevXVfAEKmMYqNvm3
         BaySeKEsQo0JY64OXSNB7UiGDl5nABvLhQCWlpmRgBd3la5K+MzfoIZ3n5H7I+royt69
         ylCD5ngxUaWyofTfZtfN6eHysUgSze7TkGxtq4rhd+Jnmz2gXKVh/BfWn7DNdZQ+drtM
         f+4KGBv+DZNawToTRK4rsOTZBaKrt1PqWTuMXqkD8lKt1m+oi/DeJEnFEpRqB+/mI5+O
         5XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y3kXXl7VAYNf/2w9vgfK95fHu1SIHy92233TbWo65bY=;
        b=Qt1uzMUPO7RlmfgThQxtVPR38oWMxNrqX0OF2LrW3L1BUql/1l1ItobRjUbeTHTvGS
         qNC/Q5vCl0o9mEEq832nO5mpPYXbdvDVBkbg92wgqJjoSXFJAiTH+8i2YKMvABLtEkqh
         8LA4PE4W2tYSDyo3wAJzKL4Ays8PBLb5BrStwK/jCy3mljDTcUjP47fr2MXfoUfhpiAn
         +kA14iq5EhPUyh3RS73DhDfKalp77kPJHQ8UCvVHlwonknjeqcxk3EDH23+Gowq/JNEV
         3cGJwjqo0BxfTj7w/vO2n8e/PgAe7eL8E/4qjEnH6MSCcuoX3h7bnASnqswVBsLyyCy9
         Yr1g==
X-Gm-Message-State: AOAM533pr/Ve+CfFPBsoDiyzPXXfcyEfcFCI9n0eSNFZhRUpW+6dIoeH
        4R5KGT8pU3vAvjezyoodwvAtoQ2PEAwQhWwB
X-Google-Smtp-Source: ABdhPJwwnOZgXuelGHdaThiU2jNyIZi8cDlCaVFbwtNalsBXl/6RZeW/Ep2+yK8Abv9Sv0l1x4mMSg==
X-Received: by 2002:a17:90b:11c1:: with SMTP id gv1mr5381751pjb.208.1636446544044;
        Tue, 09 Nov 2021 00:29:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s3sm19197915pfu.84.2021.11.09.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:29:03 -0800 (PST)
Message-ID: <618a314f.1c69fb81.5556f.9e66@mx.google.com>
Date:   Tue, 09 Nov 2021 00:29:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211109
X-Kernelci-Report-Type: test
Subject: next/master baseline: 728 runs, 3 regressions (next-20211109)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 728 runs, 3 regressions (next-20211109)

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

r8a774c0-ek874  | arm64 | lab-cip      | gcc-10   | defconfig+CON..._64K_PA=
GES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211109/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211109
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c8109c2ba35e9bfd8a55087ffb1f42cc0dcf71e6 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
beagle-xm       | arm   | lab-baylibre | clang-13 | multi_v7_defconfig     =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6189f5573bf53354b73358f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211109/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211109/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6189f5573bf53354b7335=
8f4
        failing since 12 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =



platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
imx8mn-ddr4-evk | arm64 | lab-nxp      | gcc-10   | defconfig+CON..._64K_PA=
GES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6189f5ac877a682ab33358f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6189f5ac877a682ab3335=
8f9
        new failure (last pass: next-20211108) =

 =



platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
r8a774c0-ek874  | arm64 | lab-cip      | gcc-10   | defconfig+CON..._64K_PA=
GES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6189f665119bbf7bd4335903

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211109/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6189f665119bbf7=
bd4335908
        new failure (last pass: next-20211108)
        1 lines

    2021-11-09T04:17:29.324967  kern  :emerg : Disabling IRQ #141
    2021-11-09T04:17:29.362862  <8>[  219.575130] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-09T04:17:29.363081  + set +x
    2021-11-09T04:17:29.363225  <8>[  219.585268] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 514200_1.5.2.4.1>   =

 =20
