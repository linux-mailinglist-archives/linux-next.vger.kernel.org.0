Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D1D27CE4E
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 15:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgI2NBD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 09:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgI2NBC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Sep 2020 09:01:02 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26553C061755
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2020 06:01:01 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id x16so3833535pgj.3
        for <linux-next@vger.kernel.org>; Tue, 29 Sep 2020 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=v9RWCExIFGbiT3lDbOdVUZjuNWAtPVije16lrKfT3oQ=;
        b=NWBSpNDVWI+t+ZexgfRV6iAoCFB2c6mCOoudMr1sHsRdd7ysBT8Ns9EfXEMEa5EriA
         iHyA9zvDNkIo/d77TQnheX1viqgjMgWKrsewUmDC4kdxI9sgMMbzfgVDsmwc+ntkDX/z
         Iaq4PTYUnw30FoDlMu1H4hlhkdJjf3RmAcodHXiGDV7NPbOlqCoLehpABL1oHpeaefQP
         lb5D3trHXQBOcwWjkohgW5X89/32Jh5LOB0ha150Ogrx/IGA38i87IEp7BLhZeRocgog
         s1XiuBm01M4Vpxn/9hl3FUMgIiJ8KOJxRH1tERKiD8ydtwYjGacLNHdcRShnQDW58Q2t
         sPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=v9RWCExIFGbiT3lDbOdVUZjuNWAtPVije16lrKfT3oQ=;
        b=uTZyeIMhYwvf9apnbgpdEzrAPaaJckSppLZaMZi0KhfL8hVtK814dO0Fcq5WQCo5vw
         CRSKO7fVIhS9LS+7WF9hxrHe+A7CAZT4ipMXf5d7G8GghI4R9ZBQKXAhe6pqWWYkgegn
         bXm8EeQOMA4U9gtoQIohQKtSuyYTL8+ko1TEJYGbSK1JMV8uwhXiH3W99UZfI90bCKcv
         MkH8x8EdADWCrKRCsgJbxB4XVsZgWru9lcvG6noYpkj7gq2/v7lQV1EB+ugGv9HIzURb
         XB8CRHQLMrCdUsFcAE4XgDqTuuYDaR/iNznDc0scJgUamqAhe56Gzkj0pOzwliV6ogdk
         WgYw==
X-Gm-Message-State: AOAM531LD2QdcbWNmicdsS8VuW+2mRf7WD0U2GKfzoOHlRzKJOOd7Evn
        WFwIp4Kt/uaD/qUiB7THylhmccyZ3DB6XQ==
X-Google-Smtp-Source: ABdhPJzuKhoqJPMTI3E/2HXnE3LweUQEu8Rk/TqSBhDNjvJEdoHOdTG8+8OU/cW5iV8Qghaq9z1kfA==
X-Received: by 2002:a62:1787:0:b029:151:1a04:894 with SMTP id 129-20020a6217870000b02901511a040894mr3946315pfx.37.1601384460281;
        Tue, 29 Sep 2020 06:01:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 190sm5634629pfy.22.2020.09.29.06.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 06:00:59 -0700 (PDT)
Message-ID: <5f73300b.1c69fb81.5630e.b57e@mx.google.com>
Date:   Tue, 29 Sep 2020 06:00:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200928
Subject: next/master baseline: 430 runs, 2 regressions (next-20200928)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 430 runs, 2 regressions (next-20200928)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
   | results
----------------------+------+---------------+----------+------------------=
---+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
   | 0/1    =

panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200928/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200928
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      663b07a45f972c23ac315fd690874bc00977fe99 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
   | results
----------------------+------+---------------+----------+------------------=
---+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f72fb8983d6b2884cbf9dcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200928/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200928/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f72fb8983d6b2884cbf9=
dd0
      failing since 153 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch | lab           | compiler | defconfig        =
   | results
----------------------+------+---------------+----------+------------------=
---+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f72fbd0ecebc33b8ebf9dc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200928/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200928/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f72fbd0ecebc33b8ebf9=
dc2
      failing since 69 days (last pass: next-20200706, first fail: next-202=
00721)  =20
