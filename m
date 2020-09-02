Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51CC25AE0A
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 16:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgIBO5w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 10:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgIBN4t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 09:56:49 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F81C061244
        for <linux-next@vger.kernel.org>; Wed,  2 Sep 2020 06:20:07 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id np15so2181454pjb.0
        for <linux-next@vger.kernel.org>; Wed, 02 Sep 2020 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gRwKAJZ8KzM+C88qCyT9+8XlzUctET1a1PIFvhoqfWQ=;
        b=o+1KJH3y9R25xlP/UHf5epbY7JUNZJcD32XAa5Pgfsw1zdED4QurddrGrHVM00CkI+
         wOIYIRC10HEhsRjRn/X6cCVEMnF5HIb5i8I7GHLS8yUoVEN/Nov7bqzEAu0HZJGkFIB1
         qhXbIR43AiSe36123KYls2ifMAwAL1uPW0JQrGOekKFDUPRNmbkMDBUxG7thOr68ddsE
         7+uesWhPQfoY4dh1xZSO+ul7bs/8gLCWxfYPVMmJDs+OpMgZQFgA8H/2KT1G9nbCpwZ/
         qxRr0874kthO73Mj/8R2gseW/n+QDZkwpdC+BnE20j9aTjURpOJINrrP99pHUPoNuraR
         vlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gRwKAJZ8KzM+C88qCyT9+8XlzUctET1a1PIFvhoqfWQ=;
        b=kiUOl0fCA909YiOwtJP8+45ESMhA3SYAaTcdCXZYXi3ZJJ4UQqATcCwI8j6Eg6JkQt
         RPlHAegbebPdAEniL2r1LO9WUCnarYH1/2a89o55Z+cs3ZEWp0RxZ8ZktkCKZNBSV4N4
         Pr7kcZnvFLGJ9s56WGhWY+tDRMcpYOg2NKqgLBVOooMhtJnoo1FW/Q+s2KisYev1ptsW
         hb9cnDnVJsRYgyVluOaYculd755LYcmyzq8acKe+MU9sFfLwRCGg4XaAV2/wMshcTYUz
         +JPpB5xBftq8c4+sP+RWi0uBSqGGJ7GQ/p3DZEBX9VoAo2a9ZlAy+M6tVCV4uWaYhKjl
         7VCg==
X-Gm-Message-State: AOAM532LWdScl/EWB12bBz0wAon+O02xkDYhpFq/lnb0Sz+ydMGduVh3
        qDqu7t4i5pqODRdeIrAF+4xF6K2O5FhWbA==
X-Google-Smtp-Source: ABdhPJxcOb08oQlDfweDcZdGkmity3Sl+qmZiyySx0ecrrbROVy8+rWe9+dBNTFsrCWHDLrO5gch1w==
X-Received: by 2002:a17:90b:1902:: with SMTP id mp2mr2251953pjb.53.1599052805095;
        Wed, 02 Sep 2020 06:20:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w5sm5435200pgk.20.2020.09.02.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 06:20:04 -0700 (PDT)
Message-ID: <5f4f9c04.1c69fb81.4af30.e866@mx.google.com>
Date:   Wed, 02 Sep 2020 06:20:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200902
Subject: next/master baseline: 238 runs, 4 regressions (next-20200902)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 238 runs, 4 regressions (next-20200902)

Regressions Summary
-------------------

platform                 | arch | lab           | compiler | defconfig     =
     | results
-------------------------+------+---------------+----------+---------------=
-----+--------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig | 2/4    =

rk3288-veyron-jaq        | arm  | lab-collabora | gcc-8    | multi_v7_defco=
nfig | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200902/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200902
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4442749a203151a319a5bb8d0b983b84253a6931 =



Test Regressions
---------------- =



platform                 | arch | lab           | compiler | defconfig     =
     | results
-------------------------+------+---------------+----------+---------------=
-----+--------
imx6q-var-dt6customboard | arm  | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f4f64073cd88fb732081118

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200902/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200902/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f4f64073cd88fb=
73208111b
      new failure (last pass: next-20200828)
      4 lines

    2020-09-02 09:20:54.459000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address ed21f900
    2020-09-02 09:20:54.460000  kern  :alert : pgd =3D (ptrval)
    2020-09-02 09:20:54.460000  kern  :alert : [ed21f900] *pgd=3D3d21141e(b=
ad)
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f4f64073cd8=
8fb73208111c
      new failure (last pass: next-20200828)
      20 lines

    2020-09-02 09:20:54.503000  kern  :emerg : Process kworker/1:3 (pid: 13=
5, stack limit =3D 0x(ptrval))
    2020-09-02 09:20:54.503000  kern  :emerg : Stack: (0xed1adf10 to 0xed1a=
e000)
    2020-09-02 09:20:54.503000  kern  :emerg : df00:                       =
              ed2edda0 ed217680 ef7aa200 c0361748
    2020-09-02 09:20:54.503000  kern  :emerg : df20: eda51e00 ef7aa200 0000=
0008 ed217680 ed217694 ef7aa200 00000008 c1803d00
    2020-09-02 09:20:54.504000  kern  :emerg : df40: ef7aa218 ef7aa200 ffff=
e000 c0361d2c eda51e00 c19edc0c c1374428 c0361a84
    2020-09-02 09:20:54.545000  kern  :emerg : df60: ed217680 eeb5de80 eea0=
d500 00000000 ed1ac000 c0361a84 ed217680 ee91dea4
    2020-09-02 09:20:54.546000  kern  :emerg : df80: eeb5dea4 c0368200 0000=
0001 eea0d500 c03680b0 00000000 00000000 00000000
    2020-09-02 09:20:54.546000  kern  :emerg : dfa0: 00000000 00000000 0000=
0000 c03001a8 00000000 00000000 00000000 00000000
    2020-09-02 09:20:54.546000  kern  :emerg : dfc0: 00000000 00000000 0000=
0000 00000000 00000000 00000000 00000000 00000000
    2020-09-02 09:20:54.546000  kern  :emerg : dfe0: 00000000 00000000 0000=
0000 00000000 00000013 00000000 00000000 00000000
    ... (9 line(s) more)
      =



platform                 | arch | lab           | compiler | defconfig     =
     | results
-------------------------+------+---------------+----------+---------------=
-----+--------
rk3288-veyron-jaq        | arm  | lab-collabora | gcc-8    | multi_v7_defco=
nfig | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f4f626756644b93e608112b

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200902/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200902/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f4f626756644b9=
3e608112f
      new failure (last pass: next-20200828)
      4 lines

    2020-09-02 09:14:08.272000  kern  :alert : pgd =3D ea2708a9
    2020-09-02 09:14:08.272000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f4f62675664=
4b93e6081130
      new failure (last pass: next-20200828)
      42 lines

    2020-09-02 09:14:08.297000  kern  :emerg : Process kworker/1:2 (pid: 62=
, stack limit =3D 0x1311bc0e)
    2020-09-02 09:14:08.297000  kern  :emerg : Stack: (0xc2ad5d70 to 0xc2ad=
6000)
    2020-09-02 09:14:08.309000  kern  :emerg : 5d60:                       =
              c2ad5da2 00000001 ffffffff c0733f0c
    2020-09-02 09:14:08.309000  kern  :emerg : 5d80: c2ad5df0 ffffff04 ffff=
0a00 c0cac96c 00000016 ed356000 c2ad5da2 ed356000
    2020-09-02 09:14:08.322000  kern  :emerg : 5da0: c14ba980 c0737d78 c14b=
a980 ffffff04 ffff0a00 c09f873c ee2d8c20 ed356000
    2020-09-02 09:14:08.334000  kern  :emerg : 5dc0: 12ca9fff c2ad4000 ee2d=
8c00 ffffff04 ffff0a00 77687b43 ed33b640 c2ad4000
    2020-09-02 09:14:08.347000  kern  :emerg : 5de0: c2ad4000 00000002 ed35=
6000 ee2d8c20 c19c12f4 ee2d8c00 ed300000 c07380f8
    2020-09-02 09:14:08.347000  kern  :emerg : 5e00: c2ad5e18 77687b43 ed35=
6000 00000000 c0cdc504 c14ba980 003bffc4 77687b43
    2020-09-02 09:14:08.359000  kern  :emerg : 5e20: ffff0a00 77687b43 003b=
ffc4 77687b43 c2ad4000 c19c0178 ed356000 0000004a
    2020-09-02 09:14:08.372000  kern  :emerg : 5e40: ed300000 ed300000 ed35=
6000 c1492388 ed300000 c0cdc5a8 0000000f 00000000
    ... (31 line(s) more)
      =20
