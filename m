Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40C743197B
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 14:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhJRMnQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 08:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJRMnO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 08:43:14 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E76C06161C
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 05:41:03 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q5so16044515pgr.7
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uwqZptdKbsW7t/U5hs9YMPK63OeIaOj0dtogfN7Ve28=;
        b=f4IJIfqDji/3B4ynKCWAQArnL/Zq8dyL1B7mwtvnacSKdUQWm+r+Ljz1/7OEA7fVTX
         SfnHvcUtgAEr8rsz5JFZD+aoUg3yXyUtsm2bQw833Ynk+aflg09Es/SmjOhq/Oqd8ciw
         YV/D2BgADSX6d9LNAkos8YPwm0nw2nvBj/kqxFCrM0DgXRsY9h6Tr2nRZzf8dotOcQ8d
         7rp7lZ+sUDorZQ1JmVkd4XOwlNMApVlmBRhk/Nrk0GHloHI2G2gUISyV8sREiDgXjv3J
         l4ainfOy8pSU495uD7Iv2fXALm5TYAeAAfsC+NDy4PnnYmQSB1LhUt6i+1WEBW8L5J2X
         VMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uwqZptdKbsW7t/U5hs9YMPK63OeIaOj0dtogfN7Ve28=;
        b=c+5yy1QfYsqbp07U7EXwErO0umPdc16hZBGsfjnF5u+6rHCxS6JMiouVa8ilsQGY6v
         ZnjtJ2qERJZpMraOM81QdO7Ka/94LOCTQJMW+/RMgh3id9UG7/DxLGc65ICE+GyZY/ks
         5z8sc+8dM9K6ZO53eOMk7xG42AjT9TSnM8n+jlBVvVE2kqtXaMC9pHWpJq2oEunYh8PE
         pMa6cSlr/uj5DGkx4tmaVF1qJUAysJMGBrIOBO4jKxbLZInvwyt+s8xSetE6XtCTdJeg
         yEYFtcmFYvGVdl4JqBEzchqYKEt6Rhri6NaDG30a8ZU5aRsw5j8DhhJ/Dy5s42B7XhMi
         U/KA==
X-Gm-Message-State: AOAM5310VNWsRFCNgUr385jO61nX9bZgo8XhXf0PDPNOrUGCoJmJly50
        2/dEtNvf4wezCfOJNTb2I3IfZcF2eq0fNP7/
X-Google-Smtp-Source: ABdhPJwvIr4j/8jNTeixXj9CbGm5C706u+EpB2bo9EUiOCY/oZ/cG8lcAG+egw6YDoSvtWE5+g72dQ==
X-Received: by 2002:a63:f30c:: with SMTP id l12mr23497858pgh.360.1634560861871;
        Mon, 18 Oct 2021 05:41:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i11sm3031572pgp.18.2021.10.18.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 05:41:01 -0700 (PDT)
Message-ID: <616d6b5d.1c69fb81.45b72.7716@mx.google.com>
Date:   Mon, 18 Oct 2021 05:41:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc5-534-g37d8e772a1db
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 159 runs,
 5 regressions (v5.15-rc5-534-g37d8e772a1db)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 159 runs, 5 regressions (v5.15-rc5-534-g37d8e7=
72a1db)

Regressions Summary
-------------------

platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig =
 | 1          =

beagle-xm            | arm  | lab-baylibre | gcc-8    | omap2plus_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
 | 1          =

qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc5-534-g37d8e772a1db/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc5-534-g37d8e772a1db
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      37d8e772a1dbcd0b837c35a45853716be7c4e891 =



Test Regressions
---------------- =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig =
 | 1          =


  Details:     https://kernelci.org/test/plan/id/616d3238088b63ebde335906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616d3238088b63ebde335=
907
        failing since 12 days (last pass: v5.15-rc3-397-g80b7383f5539, firs=
t fail: v5.15-rc4-194-g2923234d916d) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | omap2plus_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/616d2ec710911452c03358ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616d2ec710911452c0335=
8f0
        new failure (last pass: v5.15-rc5-210-gee0ce4e51d06) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/616d27cb257821c7b83358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616d27cb257821c7b8335=
8e9
        failing since 336 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/616d27d0257821c7b83358eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616d27d0257821c7b8335=
8ec
        failing since 336 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab          | compiler | defconfig          =
 | regressions
---------------------+------+--------------+----------+--------------------=
-+------------
qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
 | 1          =


  Details:     https://kernelci.org/test/plan/id/616d27c5172cb63ba73358e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-5=
34-g37d8e772a1db/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616d27c5172cb63ba7335=
8e8
        failing since 336 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
