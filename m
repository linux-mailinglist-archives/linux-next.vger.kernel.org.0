Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9763D355561
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 15:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344571AbhDFNkM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 09:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238827AbhDFNkL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 09:40:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3D4C06174A
        for <linux-next@vger.kernel.org>; Tue,  6 Apr 2021 06:40:01 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id bg21so4897377pjb.0
        for <linux-next@vger.kernel.org>; Tue, 06 Apr 2021 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8AA1NTxNDOTyKv+8dG6e+QZFsMQstwucZfPgvAZgnaM=;
        b=YRxPVldfi5tymfvXsHHfXSXCO+QyOT8R7hTiF/cVEHA197eAvWLMTlTT56/X9wHX/F
         vsV71RGOilt9m26xj61uFUj816gpNrc0m+xHRgfNKGGH1tpYhHbatmiXiu+Ia6Ba0kcS
         YXcAtbZaG+M+qvFd7FRCr3FXUoH2q0Tm5S0lzKuo7EltkYRRVzgVGs7/gsK46/fjGIZI
         7RCHMiXvT0iH1CgA4Ie0B5SjWZOBw07Zxs8pGn38CysAMU+9KCpiMSI/LzD8OZWRDUw5
         yDD2blznv+4KwkVzLwM/aC2P4QiLu9OkH5STllgudoAPe3bjR/y7K2HeHfc7RNWp95fM
         UV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8AA1NTxNDOTyKv+8dG6e+QZFsMQstwucZfPgvAZgnaM=;
        b=muIRZ3L27uXi8PKvAy0nxN8yomxjTU5hXesr+pTkMUjhrWEsaHGUDWY4ISmgFYdyTe
         0jPB7odQj3nLLiKaRGA7teu4E108tO9nHUUYs7F3afVa+Wp6eLjscdKUC8DYgqtIld72
         ccTX/MkmEmZQC9OXj5ANCFe57FcXL1JZNex0h3gqBiE/w/Vy+dzOVYIzYRl49FvUkiQH
         RoiUZAkBP8GGibJl8MvD6h+sbBl2QzJr0smJhWuo40neIlCsZHGMF7DKDA+sa9VmBn9i
         9MeX3txH62PjMrXoA5NAbDSEG8RZXCRHolhqIXxBW63Pb6Fqtb0R04mf8+Wa8Z2Hf7z9
         5qNg==
X-Gm-Message-State: AOAM532N7NeQ048elS80EzWQrI+MaDuDA/lBmRz0XCAR7NPor0nALMfz
        /vMyIpHwMhZ44uTZjUae538mzcKXWGwTWsK7
X-Google-Smtp-Source: ABdhPJw2uPavhO200OnMliqx5krqEXF1F+WKWItBwx/jj4exkYwn3DhdTUnyvYha43p/w56pYact9Q==
X-Received: by 2002:a17:902:9002:b029:e6:c95f:2a1d with SMTP id a2-20020a1709029002b02900e6c95f2a1dmr29072516plp.79.1617716401316;
        Tue, 06 Apr 2021 06:40:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16sm18514869pfc.139.2021.04.06.06.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:40:01 -0700 (PDT)
Message-ID: <606c64b1.1c69fb81.effb6.e8cc@mx.google.com>
Date:   Tue, 06 Apr 2021 06:40:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc6-279-gbfdbc2a91ef8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 232 runs,
 2 regressions (v5.12-rc6-279-gbfdbc2a91ef8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 232 runs, 2 regressions (v5.12-rc6-279-gbfdbc2=
a91ef8)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
   | regressions
-------------------+-------+-----------------+----------+------------------=
---+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defconf=
ig | 1          =

imx8mp-evk         | arm64 | lab-nxp         | gcc-8    | defconfig        =
   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc6-279-gbfdbc2a91ef8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc6-279-gbfdbc2a91ef8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bfdbc2a91ef8f4c5d3466dbb03735eea5744e52d =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
   | regressions
-------------------+-------+-----------------+----------+------------------=
---+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/606c2c667fbbdd4931dac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-2=
79-gbfdbc2a91ef8/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-2=
79-gbfdbc2a91ef8/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c2c667fbbdd4931dac=
6bd
        new failure (last pass: v5.12-rc5-292-g896505d11915b) =

 =



platform           | arch  | lab             | compiler | defconfig        =
   | regressions
-------------------+-------+-----------------+----------+------------------=
---+------------
imx8mp-evk         | arm64 | lab-nxp         | gcc-8    | defconfig        =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/606c2e4b8ec180dcf3dac6e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-2=
79-gbfdbc2a91ef8/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-2=
79-gbfdbc2a91ef8/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606c2e4b8ec180dcf3dac=
6e1
        failing since 13 days (last pass: v5.12-rc4-316-g8d59c115a79a, firs=
t fail: v5.12-rc4-389-ga27dcf51dcf16) =

 =20
