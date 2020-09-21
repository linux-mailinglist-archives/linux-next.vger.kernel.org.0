Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AE4272B5A
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 18:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgIUQOJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 12:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbgIUQOJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Sep 2020 12:14:09 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3B3C061755
        for <linux-next@vger.kernel.org>; Mon, 21 Sep 2020 09:14:08 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y1so9455693pgk.8
        for <linux-next@vger.kernel.org>; Mon, 21 Sep 2020 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VBwH0i3IRxJbqW8aQ/Gs9HVKehLLXvnpglb75yk4eEc=;
        b=UODBUj85+xp8f6ClJ0pvpL5bLVL2JKBrO3JGjGeYRwwz/uHkWNSTbvjjD6J20Wk4j/
         OI224DedHR4QbMyps1UqPEC62rpCg+T1Id80xDoMnYHOWqkADcUZkE11YeEIU9ffeZS9
         m3fq5VnQgouHPRyodqpbYvvv33Q1gWGndTGChfp9ON/qe+w+bggSSZISr5IPGQ4xMaon
         Qt1tRa/kaaC/GyJIi1PdYLmDkbu75vLvlkkZ5L1Ak7uh1ZoF+bCvGOqICwcoYt+K+oae
         CaBg4+WdLZ+NrxXLdHWzszsiuakyLXL1/ViIfV3r6IrNxRiuoeMzKtLMTdy5OlBMKArY
         2sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VBwH0i3IRxJbqW8aQ/Gs9HVKehLLXvnpglb75yk4eEc=;
        b=CAHZvaqs6PitMTRM1UkP/esf72UwhYHyledqR7ec20DzYDnIEcXABFSLc+F5L/zXpV
         X611tZ7HAvS18NNNrL2pYkszgwYS9szjpO0T+LVbuX3dXypUZN6zFH66vm6/FLEV7wX0
         2Ht5aZO+qdlMuD7a2PtXq/HzQpNBPRfATaTSuVxsEFiXQSxYCLbVGLZpWv4xO81VtSg7
         HgC47MHiFqA5VST9NGY7VDwzeJZvLPAY4mw5ZLnfcbQ4R76RMRLAMSSB/8z1B3ZzsZSW
         ScOTkKv7wr6et88RKxSz8wmbOzDY3sBv5sVkRR4mk1XdFsb1etBPMs/cQA7CFzaXP+wj
         tn8w==
X-Gm-Message-State: AOAM533RpGU25IYHrX42ughvKws77qoepPgI4aFf8n3jGa0oH323ob1g
        oqh6ZmUyWF3O2cJquwqjmkiE/pjSNa9yoQ==
X-Google-Smtp-Source: ABdhPJwY7koz8gBpSokFOHe1UCTJFph6O6X5c25hGtCbxiHVLdYdOHrWuJjLuf4/pLA4odtuZTaExA==
X-Received: by 2002:a65:6701:: with SMTP id u1mr273109pgf.357.1600704847980;
        Mon, 21 Sep 2020 09:14:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e14sm12304041pgu.47.2020.09.21.09.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:14:07 -0700 (PDT)
Message-ID: <5f68d14f.1c69fb81.4571f.b6c2@mx.google.com>
Date:   Mon, 21 Sep 2020 09:14:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200921
Subject: next/master baseline: 360 runs, 4 regressions (next-20200921)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 360 runs, 4 regressions (next-20200921)

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

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g  | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200921/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200921
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b10b8ad862118bf42c28a98b0f067619aadcfb23 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
   | results
----------------------+------+---------------+----------+------------------=
---+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f68964c3fa0e8ac21bf9dbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200921/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200921/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f68964c3fa0e8ac21bf9=
dbd
      failing since 146 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch | lab           | compiler | defconfig        =
   | results
----------------------+------+---------------+----------+------------------=
---+--------
panda                 | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f689805d295bcbcd2bf9dd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200921/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200921/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f689805d295bcbcd2bf9=
dd6
      failing since 61 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch | lab           | compiler | defconfig        =
   | results
----------------------+------+---------------+----------+------------------=
---+--------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g  | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f689a70400aeeb39dbf9dd5

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200921/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200921/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f689a71400aeeb=
39dbf9e1b
      new failure (last pass: next-20200918)
      4 lines

    2020-09-21 12:19:53.397000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 003bffc4
    2020-09-21 12:19:53.397000  kern  :alert : pgd =3D 3791d835
    2020-09-21 12:19:53.410000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f689a71400a=
eeb39dbf9e1c
      new failure (last pass: next-20200918)
      42 lines

    2020-09-21 12:19:53.422000  kern  :emerg : Process kworker/1:2 (pid: 68=
, stack limit =3D 0x83d9c89a)
    2020-09-21 12:19:53.434000  kern  :emerg : Stack: (0xc2b59d70 to 0xc2b5=
a000)
    2020-09-21 12:19:53.434000  kern  :emerg : 9d60:                       =
              c2b59da2 00000001 ffffffff c0737edc
    2020-09-21 12:19:53.447000  kern  :emerg : 9d80: c2b59df0 ffffff04 ffff=
0a00 c0caae9c 00000016 ed237000 c2b59da2 ed237000
    2020-09-21 12:19:53.459000  kern  :emerg : 9da0: c14c3268 c073bd48 c14c=
3268 ffffff04 ffff0a00 c09f9f9c ed1cac20 ed237000
    2020-09-21 12:19:53.464000  kern  :emerg : 9dc0: 12dc8fff c2b58000 ed1c=
ac00 ffffff04 ffff0a00 c9231c84 ee15ae80 c2b58000
    2020-09-21 12:19:53.477000  kern  :emerg : 9de0: c2b58000 00000002 ed23=
7000 ed1cac20 c19c21d8 ed1cac00 c2ac2000 c073c0c8
    2020-09-21 12:19:53.482000  kern  :emerg : 9e00: c2b59e18 c9231c84 ed23=
7000 00000000 c0cdb284 c14c3268 003bffc4 c9231c84
    2020-09-21 12:19:53.493000  kern  :emerg : 9e20: ffff0a00 c9231c84 003b=
ffc4 c9231c84 c2b58000 c19c105c ed237000 0000004a
    2020-09-21 12:19:53.498000  kern  :emerg : 9e40: c2ac2000 c2ac2000 ed23=
7000 c149abcc c2ac2000 c0cdb328 0000000f 00000000
    ... (31 line(s) more)
      =20
