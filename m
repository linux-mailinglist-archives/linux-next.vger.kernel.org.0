Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7CD2635D3
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 20:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgIISVz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 14:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgIISVy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 14:21:54 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAD8C061573
        for <linux-next@vger.kernel.org>; Wed,  9 Sep 2020 11:21:53 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q4so1742985pjh.5
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2020 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XK0R1xi+j9PSrORZ39bI8Ha5FpyyIpsLlb9jtn/Lvj0=;
        b=oHY2G0ukeAV+hiGrQ32N4q4RwJOSvzvpsdFBGbOxd5jqTQa+dy8okFRaFW1BlPzNFU
         GYcAbUOmx/Nznn3JQdg40Q1IMIyUl82HQHFWzSZGhk0kCWxipif28zzPXFV1D1CHeEhu
         U/FBowmBMShRcpY21W7gBlUBY5lwMfgAFyfjDavfxHBSaV/g44kRgon01ZKPa9s4mSIV
         utxYcKIYPacXqqbKYsaSuBNLwP6DrrHw6xL2rzcLiIFZ9jY8cIQ6u4PtxvhHN2bTdR/E
         rwcvl3e7hxN2lV4jY9csiDO/NPt/d6vWBCwuzhBFJaXX1KbiWXUYRjBGbo9s1I6dA54B
         sVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XK0R1xi+j9PSrORZ39bI8Ha5FpyyIpsLlb9jtn/Lvj0=;
        b=OMKtdwEo+BmMsEeNAMQulHUUVqheKr1koUC6LqKfM81idO5dp6ehK0Kb3y3aCocHdb
         gA39mryvvN1xT2+1sF+1yiyeiF4Io7zVGfgIInEvAC7Px0thjjiIv8I3qNXiVXbDSCu7
         0aNO/Qpiocsy5FTq+JcpuTLFXgmS1HLflaXzE8SpBkY/OSouT0xV8oqhNcOSOBzMQvIb
         SFz/G/2F93s2m4NZ5umi7ekh1h2CycK+S2ussMYE3OevPG2kv5HjVtFBtJjmIPUzUqXr
         PvCv9AzVpmAHo6T6GUu6KBA4/WSohoOOR1WaNvQetDuI5kcn+U6U7tH7J00hfZy6cV00
         IC9A==
X-Gm-Message-State: AOAM532LGYurguTDe5JL5sb9/xfv/gIuG9vdY1opkfwoj6rpEzYnEaZF
        fOQtHbpW59sONLZDbElqyKeS4sgxgIqR5A==
X-Google-Smtp-Source: ABdhPJyoPRNDqFhU4dILFS3zBjVNwIl58YFBMjdO0CM+Gtm9ctKU8xgV0mslrjzBKurMAnMTcJDKMA==
X-Received: by 2002:a17:90a:54f:: with SMTP id h15mr1921579pjf.191.1599675711741;
        Wed, 09 Sep 2020 11:21:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n26sm3341666pff.30.2020.09.09.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 11:21:50 -0700 (PDT)
Message-ID: <5f591d3e.1c69fb81.3fb24.9444@mx.google.com>
Date:   Wed, 09 Sep 2020 11:21:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200909
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 287 runs, 4 regressions (next-20200909)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 287 runs, 4 regressions (next-20200909)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 0/1    =

panda                | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =

panda                | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200909/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200909
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7204eaa2c1f509066486f488c9dcb065d7484494 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f58e3cdbf241a8026d3537d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200909/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200909/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f58e3cdbf241a8026d35=
37e
      new failure (last pass: next-20200818)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
panda                | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f58e668fd46e2d9f1d35384

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200909/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200909/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f58e668fd46e2d=
9f1d35388
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-09 14:27:45.158000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-09 14:27:45.164000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-09 14:27:45.170000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-09 14:27:45.176000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-09 14:27:45.182000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-09 14:27:45.188000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-09 14:27:45.194000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-09 14:27:45.200000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-09 14:27:45.206000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-09 14:27:45.212000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
panda                | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f58e6f61dc970f1a8d3537a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200909/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200909/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f58e6f61dc970f=
1a8d3537e
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-09 14:30:08.068000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-09 14:30:08.074000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-09 14:30:08.079000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-09 14:30:08.085000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-09 14:30:08.090000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-09 14:30:08.096000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-09 14:30:08.102000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-09 14:30:08.108000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-09 14:30:08.114000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-09 14:30:08.119000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
panda                | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f58e8cdf8ab447e97d35397

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200909/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200909/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f58e8cdf8ab447e97d35=
398
      failing since 49 days (last pass: next-20200706, first fail: next-202=
00721)  =20
