Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CFB26F661
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 08:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgIRG6a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 02:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgIRG6a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2020 02:58:30 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D50DC06174A
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 23:58:30 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id k14so2905508pgi.9
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 23:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=P3cKMEI0QZiDtIzUBb9mb4QEwomQWDzPUAB44SXjkIc=;
        b=zh9LfhRvOFdd8XQbek19gNo20cwHX5odDGuONn2Y2XGTDHKOUb8R6oBvwqT+9aNtFW
         Il7TK4yGxkYrIQ2YGSHBk/NRSfYvyFyHOKKXrKt/3kGuqmt+rMO1yMmtLBCZrrLnjNX7
         H9WP+/yy+U+z61iDJ0pJBg9Os3ZtggrOP32vwhiELvjjycMIvyWXHRwWQfXWhKJs/2aC
         OZO7JGwprqR4NSZqXKnz6+ZT408vE8O/dm+eUAkUNc+8dDRH0+YpXq3+SPojbCD9dBrx
         KPd5bngW5nMy++L7rgXGcnn4RhbK+KhSAAHsjJlmpDlX7u3yBzKSsAX8QRb9woMmm8fp
         s1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=P3cKMEI0QZiDtIzUBb9mb4QEwomQWDzPUAB44SXjkIc=;
        b=Yvnz94dg02iSx2cqKUGrAGhTnCuFU3t/cIEn2/ntV37h5ab//X1pMqUciWdekQats/
         sAPfi93GWG5zUew/HyQy88bkQ0mMMvF/WVx1W721G5iFfMslwmETp34DMYOXbr205EDr
         hzmijsYlAAfM+u9k9Q2MyxpdlJoL73J5sl/OFQgio2RR3JxqDBGYD5k+Txs9xX0/9hUR
         RhbXTIb5Vst+06jS996Zx+rEFF+czXShDCbN6ind3goX5NHagK9oanzKVChHxRe5F3nk
         aoySM54afkfkutnuNm9E6fB8pUk8qZb8N3HyhHK7kQ0Q9Tx3wq4hdgXcwFsLSAfPPF/0
         x5+w==
X-Gm-Message-State: AOAM5327+s11kE1HhWcK2auUbeyUFfmMeH1U0tOfjwE5645hSyf67KN4
        V07Q28MB1grTSuFeZs3TDCyk8Wy5j3xZJA==
X-Google-Smtp-Source: ABdhPJwNXaaF/3B3tmBC40W1MaJHvXEDEwkX3vhgxF2VuKpNin+AsQtIyfFngTrVhhH/Bnevg7A4Kw==
X-Received: by 2002:aa7:9093:0:b029:142:2501:39da with SMTP id i19-20020aa790930000b0290142250139damr14674367pfa.41.1600412308646;
        Thu, 17 Sep 2020 23:58:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p11sm1881292pfq.130.2020.09.17.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 23:58:27 -0700 (PDT)
Message-ID: <5f645a93.1c69fb81.7c65e.4d90@mx.google.com>
Date:   Thu, 17 Sep 2020 23:58:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.9-rc5-353-gfc14a2f59553
Subject: next/pending-fixes baseline: 307 runs,
 5 regressions (v5.9-rc5-353-gfc14a2f59553)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 307 runs, 5 regressions (v5.9-rc5-353-gfc14a2f=
59553)

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
v5.9-rc5-353-gfc14a2f59553/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc5-353-gfc14a2f59553
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fc14a2f595533d6cc1d072694d15821dcd3d6a91 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6421f42352d819acbf9dbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6421f42352d819acbf9=
dbc
      failing since 135 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f642522ef3ba93af1bf9db6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f642522ef3ba93af1bf9=
db7
      failing since 44 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
odroid-xu3            | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6429092dae9331dcbf9dd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-=
xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-=
xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6429092dae9331dcbf9=
dd8
      new failure (last pass: v5.9-rc5-318-g177467af003a)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f64245a612e296cd2bf9db3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f64245a612e296=
cd2bf9db9
      failing since 44 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-18 03:07:00.979000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-18 03:07:00.985000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-18 03:07:00.990000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-18 03:07:00.996000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-18 03:07:01.002000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-18 03:07:01.008000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-18 03:07:01.013000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-18 03:07:01.020000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-18 03:07:01.025000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-18 03:07:01.031000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f64259a054406a5bbbf9dc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-35=
3-gfc14a2f59553/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f64259a054406a5bbbf9=
dc7
      failing since 44 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
