Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A177A26C92D
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbgIPTEN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 15:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgIPRrx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 13:47:53 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965A4C002174
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 07:27:26 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id k8so721491pfk.2
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ww43g2FjsDKBj/At29kof11eKIZGPrmToQLU7rs/oJk=;
        b=2IN/ba914ZFbXNBjAKQfWqXEGYQQWVuif1mFhtRPX5UV9/g40AtuivRokST1V9yQ7u
         IKwVIkufxhnbp4BodxV9CzlNHfre16SNsVCMSAe0TLkKMnzhMtfu9kjCldm2XUFxgjYv
         aL+je16uNAYRrYnA7UQb7jBpXz1aC9PgHQ2pTm2TmBbUiSDg1i47dCRHxXMrjVyt8G6I
         hP0Zgl38qXuyI2UJLalU4ClKFE30r0So8Nr0VvSeD5psb6MJzzpkGBsgoeBFliDbujLv
         e8sWuXeghQIOvs0dAU1nHcGvBGJo/e6dOQ53BVL8HIPG91S1w4TGjzlE4YeaZDq58hY+
         Kh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ww43g2FjsDKBj/At29kof11eKIZGPrmToQLU7rs/oJk=;
        b=bNhd2i+mBmjWE0QwLnfWd5Kl846JaJXkfU4qy7bDVlR0z6NVXPoFKcwEQGYcE5kPW5
         gl0sVcWefpVTidtL/El0kuch3zyklaaJuYTJHHTFhE42BrK7tT2qyd9ZOwkwgSh+O9Oo
         qBY6M46R57NZ2q9ABFgfRax+UEAlt/SlmNdAhipFv51xzvQwyj2mRKDszF7J2/e2R4to
         QLdILODU4AR8TqcbhNBVRokl4sVRYbuuGA+PzaSqH/YWxgMqEdsj2YoITWbh2pzxQ0gA
         bOCHkYBEdqQGSP3MbM1U9TGkwx8TXkq2hD0jT3YioahM2jihJ6dgb/pWiGWlc+lvPcmx
         lWrw==
X-Gm-Message-State: AOAM531ulG4bDdyb9FqOTTVeZuqp3dH1aKXCJtzVLYD8XnW8uYglS8Je
        JhoZ9uTr2Mz/sYFuZKxInvOgJsii43+M0A==
X-Google-Smtp-Source: ABdhPJyzGV/I+bF2AlY56TFuVFjdHhh7ir8TpG2IgAyzj2dg3jXjYAeVuVe89kHoBA1gxTPtSCDWsg==
X-Received: by 2002:a63:5b0c:: with SMTP id p12mr18254969pgb.102.1600266443314;
        Wed, 16 Sep 2020 07:27:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s8sm2953027pjn.10.2020.09.16.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 07:27:22 -0700 (PDT)
Message-ID: <5f6220ca.1c69fb81.95002.6a8e@mx.google.com>
Date:   Wed, 16 Sep 2020 07:27:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc5-253-g8562c805780e
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 340 runs,
 5 regressions (v5.9-rc5-253-g8562c805780e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 340 runs, 5 regressions (v5.9-rc5-253-g8562c80=
5780e)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc5-253-g8562c805780e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc5-253-g8562c805780e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8562c805780e79133c8b4e03d52a91eaf4fe7214 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb7b39c8ad70e7bed973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb7b39c8ad70e7bed=
974
      failing since 134 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6212da90c3e41f0cbed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6212da90c3e41f0cbed=
944
      failing since 42 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f62167206e0216c9fbed974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-=
xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-=
xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f62167206e0216c9fbed=
975
      failing since 1 day (last pass: v5.9-rc4-284-g72e0a6a27fe8, first fai=
l: v5.9-rc5-238-gd77f530bdc3a)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f61ecd73ad1844c61bed954

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f61ecd73ad1844=
c61bed958
      failing since 42 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-16 10:45:37.513000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-16 10:45:37.519000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-16 10:45:37.524000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-16 10:45:37.530000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-16 10:45:37.536000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-16 10:45:37.542000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-16 10:45:37.547000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-16 10:45:37.553000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-16 10:45:37.559000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-16 10:45:37.565000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec56ffb224beb3bed966

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-25=
3-g8562c805780e/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec56ffb224beb3bed=
967
      failing since 42 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
