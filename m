Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1AB2885DD
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 11:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733071AbgJIJSF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 05:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731262AbgJIJSF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 05:18:05 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED3FC0613D2
        for <linux-next@vger.kernel.org>; Fri,  9 Oct 2020 02:18:05 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id k8so6352048pfk.2
        for <linux-next@vger.kernel.org>; Fri, 09 Oct 2020 02:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rkIxCjE71P8Rb21p/VYY+X3j/SqtefP8WGPZ4zBIyOk=;
        b=tOxPo5oY6ErHFEtFcWxDJ4Q04CCWUM2ZtCASsPhdZ/EBtEDMdcwma6luMkGHJnhahj
         CmWGq16lSm5itZJxV6VT14thxxPkwBNDz0FkXp3UARZSzHpX5SV4wNM9Km4f7r53CAWk
         oc3Ldx++o6wajI22oXj580W1kJ97c17Rkg2Oc1tm3ziN/8V0xffx006YeJRDMmWA6mkw
         eB/ZyBzouNvPiREIS8WLBnvCL9Cwx3m4eeHqbFsKDSElPWygnZRHlxXaLbBBtb1CTFXO
         Xpeiacz9PHPtMj0NhRDNcn/GG+ECKcynlcx7Y+4nS4z6XdXbmTSaZnPChpW2nQj4K8OA
         ek2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rkIxCjE71P8Rb21p/VYY+X3j/SqtefP8WGPZ4zBIyOk=;
        b=jPo7dHS46KE3oSG5rVmYsX6CgHFFJacP9nwr5y1fIBUdE+bpN6a9jQKUl65gSPC6So
         exR+6mE9YLNmCiahtT29kCaZixs7+1XBALSIkIXpRZYwUCQ09HH2hoeHUbhRryc6oxBj
         vGQLVatUi7AO+j4ALTJiAHd9FGBJ3ioVdhMvAHy3am/Uz8aqHMM69C9nAGNstJgLvwJi
         zPT/1soFEZER4PXhgtcR7kgtuieGY1Nz0ckS0nIxsXM0yeC/SXsafleyN8BmXu5piLL7
         gE6iHC/G8aG6mj0BJ5tYxTPTcqPuCLZcbjTc40XGqzimtRq4DjIUybgX1lpK/K0Kkj1M
         Rlwg==
X-Gm-Message-State: AOAM531BFhf58VwoTRWah6yod2Hw7mmVlNsAFPWVRFCoTueAvZQjqKWj
        6DruOENJOLbsvUE9pnvqmdJus9idV6Tu+w==
X-Google-Smtp-Source: ABdhPJzgPCiP4pB/MHsKfmx7DYnLe2Cp2xxzoNCsWnVeDIrwTN5pnGF0ABFHco8pWsjkWWvo7a16Ew==
X-Received: by 2002:a17:90b:3884:: with SMTP id mu4mr3545604pjb.29.1602235083952;
        Fri, 09 Oct 2020 02:18:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m34sm10394909pgl.94.2020.10.09.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 02:18:03 -0700 (PDT)
Message-ID: <5f802acb.1c69fb81.d55ac.2bbf@mx.google.com>
Date:   Fri, 09 Oct 2020 02:18:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc8-340-g65849916deb5
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 237 runs,
 2 regressions (v5.9-rc8-340-g65849916deb5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 237 runs, 2 regressions (v5.9-rc8-340-g6584991=
6deb5)

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


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc8-340-g65849916deb5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc8-340-g65849916deb5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      65849916deb5276c8d3989df0070aa65ba223a25 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7fe526b1e67dd1e24ff3f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-34=
0-g65849916deb5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-34=
0-g65849916deb5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7fe526b1e67dd1e24ff=
3f7
      failing since 156 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
panda                 | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f7fe50e2051cec54f4ff413

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-34=
0-g65849916deb5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc8-34=
0-g65849916deb5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f7fe50e2051cec=
54f4ff419
      failing since 65 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-09 04:20:23.830000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-09 04:20:23.835000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-09 04:20:23.841000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-09 04:20:23.847000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-09 04:20:23.853000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-09 04:20:23.858000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-09 04:20:23.864000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-09 04:20:23.870000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-09 04:20:23.876000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-09 04:20:23.881000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =20
