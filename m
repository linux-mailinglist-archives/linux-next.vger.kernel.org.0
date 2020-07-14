Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FC821F826
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 19:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgGNR1g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 13:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNR1f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jul 2020 13:27:35 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AF1C061755
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2020 10:27:35 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id d4so7880495pgk.4
        for <linux-next@vger.kernel.org>; Tue, 14 Jul 2020 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pOeh7Mp9Vsl7eJV0rLJ2TvjRWW4kEp8Sgj9Dg9/xkFY=;
        b=d9OAHWcag4EITOUpKfuxqohMahb/5SgMjOD/v1WgfeXyNt/XS0RqlcO3VNRxBiOyTl
         EH2stqIoM2FbbSeX2oIXjLp0G33iOMaBv38PHVpr82UoWqEYHTDG3MfwV9F+08yBT7m6
         fRc5D62I4vWn26FmzPh4EnorBOBMTJWjjhe3i9pK9f+VTQCCBzbNzhJkVUD/fE+kCuJa
         fWDgVovJ4vlEiLdvjWYxi3ck7LRDqcNZVXqVLAdaEQ/WVXL8N2//0LSt1vshDH4cg+0T
         b3ZOpdQbXCthSGZNiBZhmuJ2YsJ0JVoqoLPsiBVXpL2Jwqk6aCE/vXlwkd8l6KnijSHT
         41LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pOeh7Mp9Vsl7eJV0rLJ2TvjRWW4kEp8Sgj9Dg9/xkFY=;
        b=L6BMssDcii1BBWG0kNFF1sV8sNPnX9XU+WajbsOd0nj9pLYkYHfi/UJIktMfZwlZyX
         tRCAqFSJQUvSGACVGoZMKxRve+R50IAkDJtb6uFmWdOckG6LzZr6Z1kIdB2IpLuD49jb
         pmto7EIb/2jmjEkMDbbieutwLC7VmwZbT7/+cgzHTiXxHZvOlrU9c42HFIm4Ck1ZCNLa
         jaY2x9Ygx+cUYjRVHNlNumOm9cNCq44V8Y30pNKZs01kQpFThMktTj/sy7LjosLy75b8
         S5DTUmT2qQo8WNeNkVRbagluF0tEAt3U8c/3MwOQaetbpo9WvMVL2IjH1GgI/vfsJ+z9
         svvw==
X-Gm-Message-State: AOAM531ETNvC4bkUSZYJcInb39nGcllZgNb3YgcvRRe2Pxi7UIW6s4q6
        FGFqRQbas5SnYkrz4i7+Qoc4NIBTkEk=
X-Google-Smtp-Source: ABdhPJz4bWuN2g5W4E8EdaOQ1bkJ+3Wof0GBReCTHgPQux3C4AUeDQ5oWEC2Luxh8lLYqBOBAEiQfg==
X-Received: by 2002:a63:5d54:: with SMTP id o20mr4134044pgm.253.1594747654948;
        Tue, 14 Jul 2020 10:27:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e20sm18046052pfl.212.2020.07.14.10.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:27:34 -0700 (PDT)
Message-ID: <5f0deb06.1c69fb81.4d994.bfb4@mx.google.com>
Date:   Tue, 14 Jul 2020 10:27:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200714
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 189 runs, 5 regressions (next-20200714)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 189 runs, 5 regressions (next-20200714)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
omap4-panda             | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 4/5    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =

vexpress-v2p-ca15-tc1   | arm   | lab-baylibre | gcc-8    | vexpress_defcon=
fig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-cip      | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200714/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200714
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5fb3d60423873c969058f16b94bca3ef304a68fb =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
omap4-panda             | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0db2e000f31b069f85bb3d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200714/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200714/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f0db2e000f31b0=
69f85bb41
      new failure (last pass: next-20200713)
      60 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0db20a032ab5e97885bb28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200714/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200714/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0db20a032ab5e97885b=
b29
      new failure (last pass: next-20200706) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0db34e552cb0568b85bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200714/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200714/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0db34e552cb0568b85b=
b20
      failing since 8 days (last pass: next-20200703, first fail: next-2020=
0706) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-baylibre | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0db324d2284280a485bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200714/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200714/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0db324d2284280=
a485bb1b
      failing since 38 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-cip      | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0db382aa9d37a2e585bb35

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200714/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200714/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0db382aa9d37a2=
e585bb38
      failing since 38 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
