Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB2231E41F
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 02:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhBRBxd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Feb 2021 20:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhBRBxc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Feb 2021 20:53:32 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77E2C061574
        for <linux-next@vger.kernel.org>; Wed, 17 Feb 2021 17:52:52 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 189so215608pfy.6
        for <linux-next@vger.kernel.org>; Wed, 17 Feb 2021 17:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pCCOZ9/RZulpJnZVWRu3/wlUF78dLT5pK0Oq8cSWHWk=;
        b=fC7Qq4Uc4cK+rk0pJdlqUlpz/0IUb457OuatbZ9EsD0abdZLsDm87Eju14EzMzMSG5
         3suD39m6ODcqRh8SDUeaOc/wZ6ydDbteXon9YySfq70VzSFjlMaU3+fzPgwbcF5WXD6w
         VfqHsG9FMsU4E98KMNwPPK15IOFYxliwT4Sf1zyMrEaODt76x+BQwePEAuapPAIPxUA4
         wDKONli92aym82HkvPNNOXRm2w6ISMerg8G9toBzNWisS5kGvBSVG+CUxU5N3oJVSYQL
         mE5w9eswVNtYRr6JX+Y9rs1r3BvV+qU/XHya7TyY6JQkc4yWdHQlv/0mv2jbYCbMgjfr
         G3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pCCOZ9/RZulpJnZVWRu3/wlUF78dLT5pK0Oq8cSWHWk=;
        b=c6py97jhgjAsZkXkjWVaHVc+cI5xNJg7I/QXo08fEaDkV8y6DCrnJXJ5bpgjwKk5+o
         hbptFtFo906fJwqKwVH8RQJ3f4fmmDwjAxZRsKw6fuIKZ9oSz+tDDTEzmh86iwWFW+3s
         y56D905vZuOf6YoXSsi52ObWOGhtEuHIoCwvMeJrYib5U+5HtksqcPUkkTi9kOnXOuHX
         7QPLG02itXTBZNnki7ZZsbBr9/ScDhk3SjRJ0H180GqME8imuZH4jxnyxKDck1+gquNj
         2enysMBO7GnsZzW12lqkqTZRa4aoJuHc+mOvKUPRcjdNustiY6YdFarMlTCuIIwEqj+B
         7kNQ==
X-Gm-Message-State: AOAM5337Xplp93ogj/yVvaADbs5CHJa+z0bcbis6ZEYJ8QuFtO6le8Hc
        xlaZt0UqCmJtUZXFxQ3buk3P2kTPfCfWSg==
X-Google-Smtp-Source: ABdhPJy4K4Sjcj/Z+5hfFLHa0dKJbU6CBH6nzFfQvt2ihpFF0yheUjmgvEBowgkRVeZ2MrNO+NWpIQ==
X-Received: by 2002:a65:480c:: with SMTP id h12mr1939401pgs.169.1613613169633;
        Wed, 17 Feb 2021 17:52:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c6sm3446968pjd.21.2021.02.17.17.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 17:52:49 -0800 (PST)
Message-ID: <602dc871.1c69fb81.0dc5.848e@mx.google.com>
Date:   Wed, 17 Feb 2021 17:52:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-647-g6dc8678b08f1f
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 183 runs,
 5 regressions (v5.11-647-g6dc8678b08f1f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 183 runs, 5 regressions (v5.11-647-g6dc8678b08=
f1f)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =

am57xx-beagle-x15        | arm   | lab-linaro-lkft | gcc-8    | omap2plus_d=
efconfig          | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-647-g6dc8678b08f1f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-647-g6dc8678b08f1f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6dc8678b08f1f490e140a4dc68419f9782e64f3a =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602d9a5819e5c252a4addcbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-=
beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-=
beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d9a5819e5c252a4add=
cbf
        failing since 4 days (last pass: v5.11-rc7-121-gdfed2943da0a, first=
 fail: v5.11-rc7-192-g055e690de1b2) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15        | arm   | lab-linaro-lkft | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/602d99f31240865b6aaddcd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx=
-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx=
-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d99f31240865b6aadd=
cd3
        new failure (last pass: v5.11-629-gdcd372394d935) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602db01a773acb9af8addcf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602db01a773acb9af8add=
cf1
        failing since 13 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602d9810c61069b0cbaddcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d9810c61069b0cbadd=
cc2
        failing since 3 days (last pass: v5.11-rc7-192-g055e690de1b2, first=
 fail: v5.11-rc7-273-g095727507311) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/602d97f12833237b37addce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-647-g=
6dc8678b08f1f/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602d97f12833237b37add=
ce4
        failing since 6 days (last pass: v5.11-rc6-329-g3463a75620c7, first=
 fail: v5.11-rc7-180-g4a7073d1d81e) =

 =20
