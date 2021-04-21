Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA9E3664A7
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 06:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhDUE5N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 00:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhDUE5N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 00:57:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8698C06174A
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 21:56:40 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id i190so27527682pfc.12
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 21:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WsS+UufYRjoS6wz7fWX+VXNkpc74DrOK7zWJ8WQOCys=;
        b=eh7gXfmVZOiQb0SOYSq4C564dQ7wO7+wqyMVgjpnSJASA9mOiU9gsBT8lyfFiOX6yv
         xb2Kwy/0Ai5vopN2NaG6jqYlVDaVHTORdlFz/9y8pI4SuGVwMOhCPmFryENTVh4bDBV0
         2ypXJwk0xVphM3dTAAHHAQE0ZH0kpCXJFTEBf1Zyc5vIYJyH1FnSs+zUzt+oq6FR2c/z
         9bbmMS8u6AqbkYrQNKN3nV5kj70mvncQI7DVmT2MilCFB/2vMsA1YAdwjUHeYcp48vJU
         k8E9rnXp4qBnUyUc1GfgupJQWJ7DMBx7QTKtnLVLmR7kcVd0jlI8weIu8FbkpleL81Zp
         LAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WsS+UufYRjoS6wz7fWX+VXNkpc74DrOK7zWJ8WQOCys=;
        b=ZNlT3uT/CrhwG2+Ol0Alc3+yxZCdcf6waKwP3Vf7N9NQcUlwa0e1dJMCKHZ4n+3JZV
         dj0oDQDJcLfUM5i7Dn/J3J0GWIXArlX2AK5AOYaqcl/gZxdIao5ANo91Fp331VTx6cDM
         7vsDNnsNdCMxZVkMVifA2CCawqURKXwbqDCZDJ8GKZexSLHCaVowixM1V4nU+O4LB2r+
         xNKMPfSdn1BH/Uxiv2B63Z+6nEiIpeer53DpyEQkN1G/a1fOUOnLEQEYVIB728mrOSmn
         fGuCYGF3oR9thHpl+HLi9QRPBDus0CCKnfyuXexZChh6EUCkDGxqSfg2q4Di9jQJ7z3M
         3+jw==
X-Gm-Message-State: AOAM532mo1clwa8SIyggtFBCHIjNtvopP4u8SnohjSkQ4C2yb1MTtVSQ
        gcpe7hJbsZkgRAYlVJFDWy1KdH136Wo6bcW2
X-Google-Smtp-Source: ABdhPJyr7DhZo31FAxYFAHEvY9H/XQmM5eDYtYHXKJy0MWAxhFXqwwht/GEk0wFH3Nk5sn7tDFMN5g==
X-Received: by 2002:a62:5ec7:0:b029:227:3253:3f62 with SMTP id s190-20020a625ec70000b029022732533f62mr27873664pfb.54.1618981000087;
        Tue, 20 Apr 2021 21:56:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a80sm553553pfa.97.2021.04.20.21.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 21:56:39 -0700 (PDT)
Message-ID: <607fb087.1c69fb81.ba9b5.2552@mx.google.com>
Date:   Tue, 20 Apr 2021 21:56:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc8-94-g1040b90b8c83
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 285 runs,
 6 regressions (v5.12-rc8-94-g1040b90b8c83)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 285 runs, 6 regressions (v5.12-rc8-94-g1040b90=
b8c83)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc8-94-g1040b90b8c83/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc8-94-g1040b90b8c83
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1040b90b8c834022954533bfa7a6a1a92cb6164b =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607fade1597566b5b39b7797

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607fade1597566b5b39b7=
798
        failing since 75 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607f77f3101ee06c019b77a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f77f3101ee06c019b7=
7a5
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607f77f4101ee06c019b77a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f77f4101ee06c019b7=
7a8
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607f77f0101ee06c019b7798

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f77f0101ee06c019b7=
799
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607f779998676f52549b77b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f779998676f52549b7=
7ba
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607f80749e0237d3f49b779f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-9=
4-g1040b90b8c83/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607f80749e0237d3f49b7=
7a0
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
