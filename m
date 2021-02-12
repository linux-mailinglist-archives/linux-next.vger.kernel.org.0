Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3E8319903
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 05:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbhBLESK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 23:18:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhBLESJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Feb 2021 23:18:09 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27512C061574
        for <linux-next@vger.kernel.org>; Thu, 11 Feb 2021 20:17:29 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id m6so5064273pfk.1
        for <linux-next@vger.kernel.org>; Thu, 11 Feb 2021 20:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=32ftiSaShlaqisO/BF0Ga08+5y7rWtv2iI9eyzurCz0=;
        b=UUJ8gZVs3Zr77HirJGHK1vckN1XXxJUROmZLv6FuEZDh8pqbVamjJNKJ6i/kyy50bu
         B3fgA1ldI7C8Iwmwx4cFzUYzh8E9nbklM5CyWo24y9a9iqIJ8fVylX2eV8tnNtNmo++A
         xcj7nEjWth8tJd09l0JBt/txwrCYNJxt/lT9UP++gbpAfrlz0TvZ9Jl6QWTsPlfX1WwO
         4s6CEUCNVPtFhhTMCUO151pAjT6MsVZxJGqAlGfw3miumN7NGzQtUxh5WS4nyvCy8VX2
         AokTYqvAPpMuRpJn3p2zE9vRCkRp4BiDgVaFep3R+jjLpTrsTct888/mmMFAO4JR3NgT
         oS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=32ftiSaShlaqisO/BF0Ga08+5y7rWtv2iI9eyzurCz0=;
        b=DILpNbS2bba4H6lpCQhFl6D9C1g+oeR/VHlcvDL0+2nDJj2FGOKzrV9N137g3NoMHM
         kXzsieUFHVsedPJNKyxPBYX695bKpvgvGjpoJpkZkGcNoRFMgVQP6LEzdwYD8Qj8ZeHq
         C9/u7xlNG0p1uDiKyaHy2udoDoIzPezccL88NNqkWRzW9KP/JxO+JZc4ZoquwM+F7EI9
         mtC5BbJOw4bRa5qv/YSY0M8g7miG8beZCgvPxcYYUBDrp7BWQElCJ59DyFgtgHgWnDwW
         zaGHQxjcPccFbVYJqpZWSouhgkn443AjOYWfy+B73oU0Rr79o+h6K7J4zDLzgYMRm6/Z
         B78Q==
X-Gm-Message-State: AOAM533WNld8Tual+NN91R0T96JHhaRstSFlJeK6ModbRpInDGh5eLRd
        WvwryaZ+81eR3h6rIaejjTqyvxy+EN7JbA==
X-Google-Smtp-Source: ABdhPJwSi4zs+XNvZptuDabzzVjwOhWzSPpN6ILLLIGg0n6izPoTjr71oo5GQpkzTm6eKwJTnnEO/A==
X-Received: by 2002:a63:eb05:: with SMTP id t5mr1345442pgh.389.1613103448128;
        Thu, 11 Feb 2021 20:17:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q188sm6969079pfb.8.2021.02.11.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 20:17:27 -0800 (PST)
Message-ID: <60260157.1c69fb81.20d04.099d@mx.google.com>
Date:   Thu, 11 Feb 2021 20:17:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc7-192-g055e690de1b2
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 193 runs,
 2 regressions (v5.11-rc7-192-g055e690de1b2)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 193 runs, 2 regressions (v5.11-rc7-192-g055e69=
0de1b2)

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
v5.11-rc7-192-g055e690de1b2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc7-192-g055e690de1b2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      055e690de1b26771bea4e1b9c08855551cfd14a2 =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
   | regressions
-------------------+-------+-----------------+----------+------------------=
---+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/6025c6f73f962236103abecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
92-g055e690de1b2/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
92-g055e690de1b2/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6025c6f73f962236103ab=
ed0
        new failure (last pass: v5.11-rc7-180-g4a7073d1d81e) =

 =



platform           | arch  | lab             | compiler | defconfig        =
   | regressions
-------------------+-------+-----------------+----------+------------------=
---+------------
imx8mp-evk         | arm64 | lab-nxp         | gcc-8    | defconfig        =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/6025cba0d3ce669ddb3abe67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
92-g055e690de1b2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
92-g055e690de1b2/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6025cba0d3ce669ddb3ab=
e68
        failing since 0 day (last pass: v5.11-rc6-329-g3463a75620c7, first =
fail: v5.11-rc7-180-g4a7073d1d81e) =

 =20
