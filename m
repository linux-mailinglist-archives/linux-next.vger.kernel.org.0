Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA352719AA
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 05:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIUDtd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 23:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgIUDtd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Sep 2020 23:49:33 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1732BC061755
        for <linux-next@vger.kernel.org>; Sun, 20 Sep 2020 20:49:33 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id g29so7864511pgl.2
        for <linux-next@vger.kernel.org>; Sun, 20 Sep 2020 20:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WTankCVS1WmApy5CzH/KOWRyXXbA2p/0p6cyGnpdKWE=;
        b=0FkpSbs81GrjG5m4A0Tiu+E6sHcg2RBjryrmywq/aqhEUKDue/3taGR1uy2tA+OM5b
         sJvQk03cfdxZBRmTI2k3NtdRbsB73V2RRSQCUs+gUBmjdUfBYlDI6v3g8xt5xP7/aN2m
         KtnXRcT28cdH2Hi86BjCTqwukDevdOHlu7K1BOeB+g1jpyedWeekzpsQzRA+9bk3uYKY
         Ra73cpGNEd8sOTkl+TKAsrSa/kqT0MsxELWi5Bfnjuv7ykR2Fn5I22kRuQsJDZPNecO6
         NNyqm0IXngcpjksoUvsMYBdYC48v+IZ7YSYDV2GjwwSNOcab+9/zidfavpB4eCqgG/gH
         MIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WTankCVS1WmApy5CzH/KOWRyXXbA2p/0p6cyGnpdKWE=;
        b=Nc+zEAVSy4TW8imLhjOIpruNauwrHmOV4FWEahKrkRS3KYL5u0Zx4+EMsEl5szzqQ5
         d0yNioRAUS0TAgQkVB/KUDAxRexsF85DcRNXujYKxSUfTfd4V/lMA98dxl7w2WwfEb/y
         d1MCr8gMKspikdmthkXnhi/sDYdyaqkBqEQX5pepGGQgquMkkZIDQrHDCsi+Bg7IXGIh
         3MCa36eRhfvfP9lQ6Gy5zwrrPedfL8F3EenSzAsZbUQvVCSvKCKxnJz3hL/3L/GA9P9W
         +YZy5P5t+nUfX+3eA7UOWra9vBmghbbGWzxgEQBRyYumE1rYUc1GsYcOrCRA2DKNS57m
         Lj9w==
X-Gm-Message-State: AOAM5338jjQD9z7aNX+6J+LviJaAk40eOK+HC0/k8AuKPk8xs7DVUzcf
        qKfyM40OncyDtWuaqJzZ3MiMqYIDPiM6uA==
X-Google-Smtp-Source: ABdhPJxfGtFYZn9s8ftjuruVvMQ3Cx3ULcB/VbwQwmRj4DqJgpD6DGHeKzT+zKclcYHSom7eGjO0rw==
X-Received: by 2002:a17:902:b186:b029:d1:cc21:9a7d with SMTP id s6-20020a170902b186b02900d1cc219a7dmr30977997plr.8.1600660171950;
        Sun, 20 Sep 2020 20:49:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g23sm8816419pjz.51.2020.09.20.20.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 20:49:31 -0700 (PDT)
Message-ID: <5f6822cb.1c69fb81.e7ed7.4aa4@mx.google.com>
Date:   Sun, 20 Sep 2020 20:49:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.9-rc5-476-g3d0d0d2eb359
Subject: next/pending-fixes baseline: 317 runs,
 3 regressions (v5.9-rc5-476-g3d0d0d2eb359)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 317 runs, 3 regressions (v5.9-rc5-476-g3d0d0d2=
eb359)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc5-476-g3d0d0d2eb359/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc5-476-g3d0d0d2eb359
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3d0d0d2eb359e332fbe7962a5fa62e8c85961243 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f67ef71b56ce58ff2bf9de0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-47=
6-g3d0d0d2eb359/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-47=
6-g3d0d0d2eb359/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f67ef71b56ce58ff2bf9=
de1
      failing since 138 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f67ef5b1fb6ab1391bf9db3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-47=
6-g3d0d0d2eb359/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-47=
6-g3d0d0d2eb359/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f67ef5b1fb6ab1=
391bf9db9
      failing since 46 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-21 00:09:57.425000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-21 00:09:57.431000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-21 00:09:57.436000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-21 00:09:57.442000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-21 00:09:57.448000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-21 00:09:57.454000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-21 00:09:57.460000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-21 00:09:57.465000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-21 00:09:57.471000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-21 00:09:57.477000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f67ee65c3078acf3dbf9dc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-47=
6-g3d0d0d2eb359/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-47=
6-g3d0d0d2eb359/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f67ee65c3078acf3dbf9=
dc4
      failing since 46 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
