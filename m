Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFBC1F6136
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 07:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFKFP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Jun 2020 01:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgFKFP2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2020 01:15:28 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14B0C03E96F
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2020 22:15:27 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id s88so1883979pjb.5
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2020 22:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nNYUFCDTA9KQkQliSGXlW+3TWsr6yzCL7KYJ1nAqWac=;
        b=mQBnsS1gpMMxPWgdKRSZqp8YNVX+Uzl8Du71nPWzMGO3oimml7LSD+gVO8OikkCj3J
         z2hWtCtecYIzZBRt+qwAwWUiOHJ/Xivpw4ANJuSbBEEIMppzc5GkAY/szxSdpdERf8GP
         S8NPsXmgTwn64nrsLE0YsBcAbC0sa++nViAh0YJJncW2wrbCVgy6kFLwv8lkUIImEF3c
         AGChmN0ti4xSC61KCO1Aalf417kgiiFL/T9OYQZko2BLbsu+bgrDAXnbdFDmQtYGFHKN
         GS6DDU+jwUw54ckdesS9QFVR7f59tYJta3rsgU+K992vIR2FDRJMF4fuEP+2WwAX4UTZ
         56+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nNYUFCDTA9KQkQliSGXlW+3TWsr6yzCL7KYJ1nAqWac=;
        b=ZQSMOkDC2+XOj1U/WQSa+sfE61HQeKgFdKzDkWFxf4UgnGoI0Yn2lQVzp2Lzc7wyiD
         j17oz3HR+MTJaxtW+NcsktHuPFFszf6tDVbgtSUrFeu0kb/h3EUm9xt5Th1d7TWrnsQE
         tlsT/q0CuoD3h+tzPb/U/4KM67GWtP32hZUGdJhIB6bEIcT/yGfj3T22ZKiCtwePCjYc
         rGvmqzHGEmi7Eigrzg3Y80ucPhNhD3dSCYf6SJncyxDK1AwRleBWOBNhVNvlrcIMREVB
         B8xWuKo/bbII3HwozB0QMZiLCBvqxvSjZ2KO5eno4rRFeaWJm9QxwMlQBVSaDDu7VevZ
         1gIw==
X-Gm-Message-State: AOAM530auTdT6YfsMiNJEVds5hjPyo8ZNsTNBd+IjjZxscs+E6K2E7BG
        zXZ6TYD1vUjmVdwUvQjCEQihanTMHas=
X-Google-Smtp-Source: ABdhPJzA/dt5AkF7zT2pLpGjP7HYDuPVOmb3Xb/DofxnLKbfIAbZ+L3Elf+qh9VaCz0hFdrNZ+/IyQ==
X-Received: by 2002:a17:90a:4f4b:: with SMTP id w11mr6480840pjl.11.1591852527007;
        Wed, 10 Jun 2020 22:15:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h7sm1417048pgh.31.2020.06.10.22.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 22:15:26 -0700 (PDT)
Message-ID: <5ee1bdee.1c69fb81.81266.50e4@mx.google.com>
Date:   Wed, 10 Jun 2020 22:15:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-14137-g60392f4b277d
Subject: next/pending-fixes baseline: 158 runs,
 1 regressions (v5.7-14137-g60392f4b277d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 158 runs, 1 regressions (v5.7-14137-g60392f4b2=
77d)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-14137-g60392f4b277d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-14137-g60392f4b277d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      60392f4b277dd983893bda2a86cf9cb6f0a5c1b8 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee18997258b42a32a97bf19

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14137-=
g60392f4b277d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14137-=
g60392f4b277d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee18997258b42a3=
2a97bf1c
      failing since 6 days (last pass: v5.7-4607-g4ce9138f1bd4, first fail:=
 v5.7-8671-g086779e58c68)
      2 lines =20
