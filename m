Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0949D231676
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 01:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgG1XyT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 19:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbgG1XyS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 19:54:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FCBC061794
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2020 16:54:18 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id e22so1083891pjt.3
        for <linux-next@vger.kernel.org>; Tue, 28 Jul 2020 16:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FU2aPg1R+Qj9j/aRgIzh6R+ovs/zcpihQESYJF9Ah70=;
        b=OvvuBGeNCehMJcTOPrZj6v2xbu3trutSnStlSKVQBf1nmoLJ85QMGx+BhNIWfu42qc
         J9uT2pyhjBm3lWHGKWUGLCXysgQKVXScposTUYO6iFTekt7zEFYyZ2pSFWaIRw9TSyfY
         gz7tgwjF4b2y4EL+Fugv0wTAdn3KPdPLTE3y9nMkfY5lIFxSMEY+RtuCOKvdqxKVYd/U
         HI/jrg6o54nSMlp3rMoYN8+LQNH1PIzwnM/Vx6J/U+ckNlXWRpcNWcujIqJ2HVyRLhXE
         W/pbHVopd2/Xak21NnHLe84XFmv+uazrdqptoM5xp3kLbc0ZC1ATlxfU2kLeQkMDhmJh
         hSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FU2aPg1R+Qj9j/aRgIzh6R+ovs/zcpihQESYJF9Ah70=;
        b=k/1ghN8yqNMK5siv/m1xskTivVliiqiagfgnTgVNEKdH2rRDvNXlWWbbfYh909cYpd
         kub7CQj17wpBr7Wmapkcm4p+KAKsL9z1cfHRl2FyP8ibxOfmbHhNl2JvHhC27rWUj/YO
         +4SSuHy7X/5Sxsrg8CD3b2LJLhvRlkISZqTfAs/QWs2xpYphqp4mqE3SlbqCRDPwEMcz
         iEv6FZGF7VJNe2z7zPvRBiECeRjKAMsjci0O7bQgCoa4EUEJSdd26KANRiklI9u8oGAG
         SppFv07pS7V7Sw5u+k1Yg+rvgwo3VNyRiNZMYirQ9TidEBNE7N3qUr4r1qWx5eKhyM6O
         ntgQ==
X-Gm-Message-State: AOAM53242SipSF7FKUIj6WNy3YyeMmbF02GEX7c4LoqPq+bP2hIxwR7k
        duT/A28xANc3KknXaySRnjUrPVN7b50=
X-Google-Smtp-Source: ABdhPJxFi7SJXVeLFUdaZC5VQ/b4mYGNApf6Tj3P0booa39LRc871oVBVbuizthOJTh1mOTBH0/CsQ==
X-Received: by 2002:a17:90a:dc06:: with SMTP id i6mr6596550pjv.161.1595980457453;
        Tue, 28 Jul 2020 16:54:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x9sm254824pjt.9.2020.07.28.16.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 16:54:16 -0700 (PDT)
Message-ID: <5f20baa8.1c69fb81.fc9e1.14d7@mx.google.com>
Date:   Tue, 28 Jul 2020 16:54:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-rc7-93-g49ee2b4bc7d6
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 277 runs,
 3 regressions (v5.8-rc7-93-g49ee2b4bc7d6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 277 runs, 3 regressions (v5.8-rc7-93-g49ee2b4b=
c7d6)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
 | results
------------------------+-------+--------------+----------+----------------=
-+--------
at91-sama5d4_xplained   | arm   | lab-baylibre | gcc-8    | sama5_defconfig=
 | 0/1    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
 | 4/5    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
 | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc7-93-g49ee2b4bc7d6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc7-93-g49ee2b4bc7d6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      49ee2b4bc7d6b8a72afdcdde6a682c5d1a28032d =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
 | results
------------------------+-------+--------------+----------+----------------=
-+--------
at91-sama5d4_xplained   | arm   | lab-baylibre | gcc-8    | sama5_defconfig=
 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f20650c4704b0300752c1be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-93=
-g49ee2b4bc7d6/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-93=
-g49ee2b4bc7d6/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f20650c4704b0300752c=
1bf
      failing since 84 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                | arch  | lab          | compiler | defconfig      =
 | results
------------------------+-------+--------------+----------+----------------=
-+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
 | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f205fdedaf6c7606952c1c8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-93=
-g49ee2b4bc7d6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-93=
-g49ee2b4bc7d6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f205fdedaf6c760=
6952c1cb
      failing since 1 day (last pass: v5.8-rc6-327-gb1263ee340f7, first fai=
l: v5.8-rc7-70-g8e4b9e8d6624)
      2 lines =



platform                | arch  | lab          | compiler | defconfig      =
 | results
------------------------+-------+--------------+----------+----------------=
-+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2060bed49ce7759d52c1bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-93=
-g49ee2b4bc7d6/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-93=
-g49ee2b4bc7d6/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2060bed49ce7759d52c=
1be
      failing since 7 days (last pass: v5.8-rc5-432-g6ded1a48da25, first fa=
il: v5.8-rc6-163-g19ae985ddbc8) =20
