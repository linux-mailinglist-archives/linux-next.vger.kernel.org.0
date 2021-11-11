Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C2D44D3C6
	for <lists+linux-next@lfdr.de>; Thu, 11 Nov 2021 10:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhKKJLC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Nov 2021 04:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbhKKJKn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2021 04:10:43 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4C4C061766
        for <linux-next@vger.kernel.org>; Thu, 11 Nov 2021 01:07:53 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id x64so5093769pfd.6
        for <linux-next@vger.kernel.org>; Thu, 11 Nov 2021 01:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BpXrBRVtwbnolksKGPFKldsEzZI/k/JDZMOE18Omngw=;
        b=dk/bPQ6+Z7DE2154dk5amEzBqbMrCD/Uh+DLqNH7bBotWW3l7dZMBox4f9Ausxg++R
         0jSchQ8GJzqWzb9kHcSuvn9VncpPJ4GVuz/a66tHJd6odXd//Ib7Zc2KKFjh5N8tVYfh
         QACyl0DlX7oYTb7H48TyNLW/cqGoXOvBlpXQy/vxi9Inh1oV/ZPXqBCTLVDkuyVCy6xO
         fo9aabBdoj/tfu7wty3XxfE8TLPq4Akboi1ntpIsgxY6GbY0IR6hl5EVmOL1JY+Qez3r
         y8kQ/b9z2DVJuDoyi1hg42o21BOBV2GCRmkB+l2ceXaNdl64SuWEnb13pNlDc354bgp0
         6rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BpXrBRVtwbnolksKGPFKldsEzZI/k/JDZMOE18Omngw=;
        b=bLMj0jIWLRJvWdjMbpPUXcWLQmTkpMIV/8Og9CoqJ8m+EkRmxhDxgp3723YKgtjH8U
         cnkQtVYhAkD//C+n0j1r8jMGTuMs6F1D5vO9h1P2RIEZqoMN9XGCCl/KaCLA+Mv0oLKb
         l89yDhlix7L3C7/5ZODE79QTpIhumt77xQbjYYktHyBsuTyNrpuAAhVKYAfvuBw5rUoc
         x2Ya5nd8AedobMvqQusXG+9CHW1lLGgP1JwCAjSthf8/RDM9ht8Z10J3UlpN+LRJ0PCD
         dlbd3r9Z7xslKz8K/xPXDHkWFgPtEKOsJHSlMgid4pf8IfrDev2AMDsEBi5k5wu0NzRa
         H0PQ==
X-Gm-Message-State: AOAM531CV7dndzpoG6jzL+O5OissJ+jCOccRTZ2sLd9VIQreqrdnNDWk
        N3CF5HKN61FOjkxJtnj9/2ZswsNfl7MJYk+nnfo=
X-Google-Smtp-Source: ABdhPJx9O1C/oN7FbBhJj/T9fA553D0UH69kdf2zPLPG3wpX6frGP76knpsaZ4JS8sxB8IMaKrmmlw==
X-Received: by 2002:a63:8148:: with SMTP id t69mr3626270pgd.17.1636621673261;
        Thu, 11 Nov 2021 01:07:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i10sm1857977pjd.3.2021.11.11.01.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 01:07:52 -0800 (PST)
Message-ID: <618cdd68.1c69fb81.36dcf.5b99@mx.google.com>
Date:   Thu, 11 Nov 2021 01:07:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211111
X-Kernelci-Report-Type: test
Subject: next/master baseline: 713 runs, 3 regressions (next-20211111)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 713 runs, 3 regressions (next-20211111)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-13 | multi_v7_=
defconfig           | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211111/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211111
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ad8be4fa6e8149ba6ea21fdf0089e8254437b3c8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-13 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/618ca9a7f0c876645e3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211105082911+21620=
0aff268-1~exp1~20211105203443.23)
  Plain log:   https://storage.kernelci.org//next/master/next-20211111/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211111/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618ca9a7f0c876645e335=
8dd
        failing since 14 days (last pass: next-20211026, first fail: next-2=
0211027) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618ca4c4f2692d227c33595b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618ca4c4f2692d227c335=
95c
        new failure (last pass: next-20211110) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/618ca4267f548dae4c3358ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618ca4267f548dae4c335=
8ed
        new failure (last pass: next-20211110) =

 =20
