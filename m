Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6ED74B1D42
	for <lists+linux-next@lfdr.de>; Fri, 11 Feb 2022 05:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240140AbiBKEJE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Feb 2022 23:09:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiBKEJE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2022 23:09:04 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B5295
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 20:09:03 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id m7so7053382pjk.0
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 20:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yP59R1CnzzS55yXPcnb4xjLwDFon7y6YRElQ4KVPZVo=;
        b=ZrKZ+dllJxGERgnfxgEGowIP4/ATUhHGA5wH+nX1OWH3ITjXn+13vzebmolmZU5Jqe
         w/Ux+pFvELdZd0Dq9Itms9pnmpzhjB63q1/DWQdWJ/YEr2jeMAajunJ7r+5hn7jS8/tr
         o2xqGiAdHAOKv2qYxOYgsr1u3OaVBBTHZrPqRM2wngk5vxnXGU1800QtGhDnXXVN8dEE
         KubpjD3WmfWeWak5cvjSX+v18E4IVlyBOktJn0TmSJWsRmbOyWd71woJnhL31i4hqdV7
         mUCATq6jzbmSISSmpZRz6fUWbiadzaKrNxah4EfXZQiWh1qlY4qSLmVPrNk9Aq33/Vf4
         n9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yP59R1CnzzS55yXPcnb4xjLwDFon7y6YRElQ4KVPZVo=;
        b=uIK0WzvZ3vmzBrWsHNFy9AJcivJMx25WG9g7KQwFpOzaqLWUERBVoWFSqd/J4pDWEL
         /mbzJ8sprv9d0GQ2x1GgvRxnQTJW91kckgiuAABP9f2SzurxQFhmv565LE3TDWk2mJ46
         GzzS5cj+/r5J+eFXi5KIb5IMBJIpwRGvzwQ0yRDZs5qhOSmBNgz6JgpWUOUJlYZk3O7c
         fUT+f3GQuH4FGpUekz4j70qTwOlfUF+3jkkRLZU6M7seYbafWSSMp1vxqRDCtYkfGHG+
         FBfXBFGOPp8+Ww2cWO0oiJ+OIU2NyZANX3D2qf9VrZpnv21yAYpe3SHkBykvyPj5P2Km
         1cAA==
X-Gm-Message-State: AOAM530NystRK3/k/TW3xgb5t7hbyXpGrbQ9SvbZzOvH7XZ0bZ5zoN0N
        d7ivi0zh5BQeE4mPdnMj39QZsxs/HlDIk360I6s=
X-Google-Smtp-Source: ABdhPJylgOEJuvYCSsQefA33Wodhgmeamrkd/61N3mp2rH5/9T64C6Ixgh3bjb9ZuI9BM49MMy3mnw==
X-Received: by 2002:a17:90b:33cc:: with SMTP id lk12mr744227pjb.186.1644552543101;
        Thu, 10 Feb 2022 20:09:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i10sm18594064pgm.30.2022.02.10.20.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 20:09:02 -0800 (PST)
Message-ID: <6205e15e.1c69fb81.3d14a.f6a5@mx.google.com>
Date:   Thu, 10 Feb 2022 20:09:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc3-394-gc849047c2473
Subject: next/pending-fixes baseline: 301 runs,
 3 regressions (v5.17-rc3-394-gc849047c2473)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 301 runs, 3 regressions (v5.17-rc3-394-gc84904=
7c2473)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
             | regressions
-------------------------+--------+---------------+----------+-------------=
-------------+------------
am57xx-beagle-x15        | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
config+debug | 1          =

da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig    | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu  | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc3-394-gc849047c2473/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc3-394-gc849047c2473
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c849047c2473f78306791b27ec7c3e0ed552727d =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
             | regressions
-------------------------+--------+---------------+----------+-------------=
-------------+------------
am57xx-beagle-x15        | arm    | lab-baylibre  | gcc-10   | multi_v7_def=
config+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/6205af2505c35f685fc62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
94-gc849047c2473/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
94-gc849047c2473/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6205af2505c35f685fc62=
986
        new failure (last pass: v5.17-rc3-356-gdfd7907f4e4f) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
             | regressions
-------------------------+--------+---------------+----------+-------------=
-------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6205ab3b2171759ed3c6296c

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
94-gc849047c2473/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
94-gc849047c2473/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6205ab3b2171759=
ed3c62970
        failing since 18 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-11T00:17:56.274245  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-11T00:17:56.394895  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-11T00:17:56.395198  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-11T00:17:56.395385  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-11T00:17:56.438839  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
             | regressions
-------------------------+--------+---------------+----------+-------------=
-------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+amdgpu  | 1          =


  Details:     https://kernelci.org/test/plan/id/6205a716b369c2e70ac6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
94-gc849047c2473/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-3=
94-gc849047c2473/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6205a716b369c2e70ac62=
96d
        new failure (last pass: v5.17-rc3-225-g8b6f2853101d) =

 =20
