Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3763422EA04
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 12:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgG0K2t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 06:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgG0K2t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 06:28:49 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5840C061794
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2020 03:28:47 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w17so7772753ply.11
        for <linux-next@vger.kernel.org>; Mon, 27 Jul 2020 03:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vry7m05aEvxzytfo0wfd/3wM8fV0s+dX7tFz1osl/4A=;
        b=TfM5QJSkjqrm+iM67O41aYHF/uLLRt1vIjsKaJaLZ5Sr6srBXK/EcCQstooYj4wFOP
         kxFsH6M3yJvzPtMM0gI1l1hw9xLFafdNrbE57jfSKq5D7QoWjJpVcZModvbqkyz0tJfn
         oDy9VW2S9kcxKYB5eTqfupQBU9NuZaYthdIezMnBROV+BntazQd9vA1vdIG3bbbqKnHz
         xH/stE4s6+xJxLOV/cTXZHa9iblQP8KwmGQVStSyWhIa/bp7/I5cwb6VcaMbd116ZQB+
         ngAgMEL8AZGNYs04lE1VyTGLevRoVpBU3Y7SrAkxpxxTjaCmpE5IYp810dIXeAlWm21u
         U/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vry7m05aEvxzytfo0wfd/3wM8fV0s+dX7tFz1osl/4A=;
        b=tFQpTUk8d+bLyZg7a2WZIom5j6qHidJWISgFjWaAILxh4cqh+aopbYdGMbL3stSYaI
         Pmyo6vDlBRk1+HNhhbuSF3Dl6+GTCZ6WSs3f1BPFEfcpAi55/3kLInrfOQYOJcuapdyH
         LP4KWyl0vrqVzQsCNngT600E0Gzv+ddwJMeNYSeobt33zYNgBMADsHj5IivZT/yiXgax
         ok4ONsBtpNPuMB7HCDxrg0FopntOiLD+fUEOaVWpmln3j3sQajo5W20W4pV8bxz09OHT
         igF/p0Kwd4h8vwZ9jTI111WsKyt42TEk37G5rHnMRq0Oo+Fx2AZyzYFN01+n7vzVzp7Y
         iQ9A==
X-Gm-Message-State: AOAM530Ajo96E2saq5tD/a1Uti6NFOQeyi3Qvta5VdnZAPCN76vPSStu
        pz14XbjxLuXU19iTxyAdIJDnIKKhIeg=
X-Google-Smtp-Source: ABdhPJxAlynMrz/kq+CbrGqcrZmo1KgY3jVXqmnq1wU30qLoUcYY/jYLuVQOwvMnVfKd1SkTlVnmeg==
X-Received: by 2002:a17:90a:c212:: with SMTP id e18mr15290774pjt.118.1595845726969;
        Mon, 27 Jul 2020 03:28:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a30sm7480312pfr.29.2020.07.27.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 03:28:46 -0700 (PDT)
Message-ID: <5f1eac5e.1c69fb81.e476b.b2fe@mx.google.com>
Date:   Mon, 27 Jul 2020 03:28:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc7-70-g8e4b9e8d6624
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 331 runs,
 5 regressions (v5.8-rc7-70-g8e4b9e8d6624)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 331 runs, 5 regressions (v5.8-rc7-70-g8e4b9e8d=
6624)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g    | 0/1    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
     | 4/5    =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 3/5    =

sun50i-a64-bananapi-m64  | arm64 | lab-clabbe   | gcc-8    | defconfig     =
     | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc7-70-g8e4b9e8d6624/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc7-70-g8e4b9e8d6624
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8e4b9e8d66247170509b77c741b3acaaac50d64d =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e7109ca04fd68ba85bb28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e7109ca04fd68ba85b=
b29
      failing since 82 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig     =
     | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1e57b4398713892785bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1e57b439871389=
2785bb1b
      new failure (last pass: v5.8-rc6-327-gb1263ee340f7)
      2 lines =



platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1e79ad4d72b765ee85bb47

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var=
-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var=
-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1e79ad4d72b76=
5ee85bb4b
      new failure (last pass: v5.8-rc6-327-gb1263ee340f7)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f1e=
79ad4d72b765ee85bb4c
      new failure (last pass: v5.8-rc6-327-gb1263ee340f7)
      57 lines =



platform                 | arch  | lab          | compiler | defconfig     =
     | results
-------------------------+-------+--------------+----------+---------------=
-----+--------
sun50i-a64-bananapi-m64  | arm64 | lab-clabbe   | gcc-8    | defconfig     =
     | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1e585bc8d064464b85bb87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-70=
-g8e4b9e8d6624/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1e585bc8d064464b85b=
b88
      failing since 6 days (last pass: v5.8-rc5-432-g6ded1a48da25, first fa=
il: v5.8-rc6-163-g19ae985ddbc8) =20
