Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB94329497F
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 10:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441102AbgJUIxR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 04:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441101AbgJUIxR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 04:53:17 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19699C0613CE
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 01:53:17 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 19so1068457pge.12
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yw0OGna3TikCnGoqg1uIzUyW5yfUR7cmva3EgFmSE64=;
        b=sa9SPMPNkbJi00kHjIFvPDQNlpSNgbU+ku2K75DIA7PkN9gmTIdcENP3GcEZVfPdEi
         wAUkxqvM6h7nAZK96J92DXzPKiUYOliYm3SD6f06oKuOTwf5NTqx65Mt7JZloC33A++F
         BuSsyAD6G/49mmv7IE6wbNTKFkMw6gB2gh0AW8Q96XtMF7MwMUtE3jQOwv6+WPV2tPAz
         /O5rNbhRyLthLrtox9qC2sYrlqYGIUrEpLh1Xkh7BFj1dYldaVWB6nogGzRbepxC+iM6
         0ksJkNCNL/chZ5+xvGhZ4J0oak0JS7omtuBnnfX5wUjP0XjUo9wWv6qruiKPkbl51kl3
         vipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yw0OGna3TikCnGoqg1uIzUyW5yfUR7cmva3EgFmSE64=;
        b=K5oSz5nuwAVuI2cKzLw288IT1SUAIpbXMwkoGO/oW69YdTfL9leswtliO7n+XoUcet
         hi9606echINOfLUYgRhOYLGBVjKSSBIQkhLuzDK9nwqjB9NJtHiQpli2h9p+z6/V5rkI
         1PpZWD+gUBmv7acjGiI9i1ZWDnSLWbwFm6c7hIvpoF/WueLMgP3ovudoJpWlVse2XrRI
         PxEWUkYapcg9I96qHjCsEkaoCaWg2MZoezeeKpMPeKuQZ07kJni9oCRHdXVldR8MI02M
         M7DVtHveOl05pXoOiS7w0uQwCpuOms6j4Yua0+uixrTz3QEX9CW006xdVRh+Bf9nVfEp
         t0kw==
X-Gm-Message-State: AOAM5315p6oHVmFaoB/xs4fQSSnCy1v5XD6O1/IsbxtjCPGndqLLBF70
        0fwnwK78y7fxOg6O85OCAWlB3itriTfIuw==
X-Google-Smtp-Source: ABdhPJyLYXiqkSC9pI8GO2nllYWya+PfAkfhtq+9JK0cXJq4elHWHCB1sQEeNb2rHYY1zJZtEGg6zA==
X-Received: by 2002:a05:6a00:1742:b029:155:dcd2:9155 with SMTP id j2-20020a056a001742b0290155dcd29155mr2450950pfc.78.1603270396261;
        Wed, 21 Oct 2020 01:53:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c127sm1471508pfc.115.2020.10.21.01.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 01:53:15 -0700 (PDT)
Message-ID: <5f8ff6fb.1c69fb81.3458e.3d50@mx.google.com>
Date:   Wed, 21 Oct 2020 01:53:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201021
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 220 runs, 2 regressions (next-20201021)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 220 runs, 2 regressions (next-20201021)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | results
----------------+------+---------------+----------+------------------------=
------+--------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_=
SMP=3Dn | 0/1    =

panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconfig    =
      | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201021/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201021
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5302568121ba345f5c22528aefd72d775f25221e =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | results
----------------+------+---------------+----------+------------------------=
------+--------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_=
SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8fc1c37a2b39aa284ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8fc1c37a2b39aa284ff=
3ea
      failing since 20 days (last pass: next-20200929, first fail: next-202=
00930)  =



platform        | arch | lab           | compiler | defconfig              =
      | results
----------------+------+---------------+----------+------------------------=
------+--------
panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconfig    =
      | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8fc2592e55d0148e4ff3f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201021/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201021/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8fc2592e55d0148e4ff=
3f8
      failing since 91 days (last pass: next-20200706, first fail: next-202=
00721)  =20
