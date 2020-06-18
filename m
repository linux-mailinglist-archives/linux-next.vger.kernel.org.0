Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7871FEBE5
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 09:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgFRHDV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 03:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgFRHDV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 03:03:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1CEC06174E
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 00:03:21 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id g12so2047389pll.10
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 00:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kEFXr5X01EunzOiMflA7QQCFKzyAFW6K2yRAjSaU+iM=;
        b=wYWUMZp4W2yczVBjKdajUROrdqKcTPcRysOqNQ9mkpHBJzvniIzhytWSAAMCduMnII
         vzUBAboVT285ITO4KC66GHWnaNR7PBMTYjYblBi2v1u8Ini8JF8BnONAuwXboYdqgmBk
         r7PFCPfdBZObDq0NHuzv3MjJeTemT7J0l0news+5Fn6b9HNw3VFa8z4cV51jtU2JsrAB
         kWqAavLsuncGgAmiLSskJ+a32w9U0peA55u23xEmfL5ZVDaxvEuSmHKOzjgrGO0CaHIX
         nkdQQMdREAXcwdm5sgjwI0DP9ar5sQNC0uwDuwXjCpkgucgVxib16NXHN5b0qOasdupw
         nQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kEFXr5X01EunzOiMflA7QQCFKzyAFW6K2yRAjSaU+iM=;
        b=eGU4Kfvui3ESfjh/DHBoQi3PO5RelRdITwpESHMK3IlK/64onDxHPDyqjntMlrS2zv
         qvT0V07Dn1UwdgKBJbgdtzrG2Qla3sO3Y9qTrNR4o7dHd22uuyF3q5LZOyBvrqX6Fppq
         pUsaR/SsqC3pzGxn6f9+MkisPp68g5rkzI3zsHkzLXJDYfWJc6eZtY+5FGz1WnKKQ7wh
         ekKtqABbtEA9a0v0hLK2WLQjWu/bH1erw0a3bbJVI/yWlTrHdOOaiF+dp224YTvLbObV
         oO7Uk2GNbtbt77zbqWtBh96sVdo5w1eeSNhWDY+e5NlhRlenYAtVELUSOSy4Ej6MqDFT
         l4zQ==
X-Gm-Message-State: AOAM530ULtp1MAoTRWo9/kWP1DLrd5A2dtjanDrhOzSHaWNMtpdksA/U
        MHUZFu+8IIQZWD8IWs1/6hhECZPHyiA=
X-Google-Smtp-Source: ABdhPJxTwYiaHn7xnB++foGijDVdOXp9Mt1aFTDR6XNz32w4ttsdYUwNG/muGs5l4LQYBHnjIDaugQ==
X-Received: by 2002:a17:90a:a109:: with SMTP id s9mr3064272pjp.156.1592463799518;
        Thu, 18 Jun 2020 00:03:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c9sm1858197pfp.100.2020.06.18.00.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 00:03:18 -0700 (PDT)
Message-ID: <5eeb11b6.1c69fb81.94738.6c85@mx.google.com>
Date:   Thu, 18 Jun 2020 00:03:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc1-339-g3b15f0074015
Subject: next/pending-fixes baseline: 202 runs,
 4 regressions (v5.8-rc1-339-g3b15f0074015)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 202 runs, 4 regressions (v5.8-rc1-339-g3b15f00=
74015)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 4/5    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/5    =

rk3288-veyron-jaq        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc1-339-g3b15f0074015/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc1-339-g3b15f0074015
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3b15f0074015252df0ae1608487acc6dff7d4965 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eeae0f534d3ac582b97bf22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-33=
9-g3b15f0074015/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-33=
9-g3b15f0074015/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eeae0f534d3ac58=
2b97bf25
      new failure (last pass: v5.8-rc1-231-gbf332658aac2)
      2 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5eeadc49d11a30704097bf13

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-33=
9-g3b15f0074015/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-va=
r-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-33=
9-g3b15f0074015/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-va=
r-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5eeadc49d11a307=
04097bf17
      new failure (last pass: v5.8-rc1-168-gd1a574997c4e)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5eea=
dc49d11a30704097bf18
      new failure (last pass: v5.8-rc1-168-gd1a574997c4e)
      57 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3288-veyron-jaq        | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeadfd89c0ab44cb197bf12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-33=
9-g3b15f0074015/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-33=
9-g3b15f0074015/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeadfd89c0ab44cb197b=
f13
      new failure (last pass: v5.8-rc1-168-gd1a574997c4e) =20
