Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 990974AB476
	for <lists+linux-next@lfdr.de>; Mon,  7 Feb 2022 07:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351166AbiBGGPW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Feb 2022 01:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351188AbiBGEGh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Feb 2022 23:06:37 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76238C061A73
        for <linux-next@vger.kernel.org>; Sun,  6 Feb 2022 20:06:36 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso5140924pjt.4
        for <linux-next@vger.kernel.org>; Sun, 06 Feb 2022 20:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HcEgBJIzCv6Ge6kdAPCoU+k/PxaG8cnLRw0+xYDdNBw=;
        b=SLfUXTX8BWATuq0COe0kwGZlCykWw5RVorD5pKpFkfxdEE/87KEwfWiFkFo/w5kpH2
         RAi2qCjJGxZ6GXmAwGexbMUJfhb/7X/xNpuscqMgQD/QjUs8ZyaRywLSwDq8u/xSWMxe
         i453toEF9YSeE6KwOjDvIa/KhNheblyg80zV7BfRZLCX6Q3DQ7n+pFmhs1uvdftMf10E
         umwDlDcAjrkTnhxgeCkKdLaQ+uDl6eUqueWrr3g7kB0k+TKJeiBuIJXt3elZGt651mkv
         z6w9Rkd5OEwG7tjLLQ6L8toI6YNcscI61AM9CQi+McBO5nZfwNIK/QB1elFP52Idps8p
         6D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HcEgBJIzCv6Ge6kdAPCoU+k/PxaG8cnLRw0+xYDdNBw=;
        b=7IahZ9TUbaJj4iGwX3ZHPeadpIZLOb38bmJP3CnrGhbfYAi0tIObBrDAu7E6/pH+eR
         oT0rTq7qPzI/j+TTbxLY2X55QAjOFU8aF62fSo9cAsLlgd3LY97rTaR3Yv4VfOfOBIVz
         ARUMGF9Wf5RGGCDAuCF7cgLBlrPzwcm8mSUWSNBs6EmvzZU6RbSX6paMORvT3Oenq5OZ
         m6p9/YKRBWclziLXIkUZ4PZXdIH0Q+eSFibn0HXo9CETcQ252ejIrKWhD/u15AHyTyOx
         a4XNDsreq1yzNz8PC3P8RdKOUBD7uuSFbahHrtxFxoIa0UUuwsfu/Zfh9sNzh0ILvQiS
         7prA==
X-Gm-Message-State: AOAM533SpmEVHL89zzdpWlWRJoHyuZNHs26PtzxLHYz41/Nv8JzEZajx
        f1Mf4T9ZbR70qft4+0VWa7joumwFquY+a1uP
X-Google-Smtp-Source: ABdhPJxWAdJviDeTf5ThjjYG8zVDGtejmyKwpZlQjVkNIgkuGIp0+/vtMtklv36HrhMMiZF7nfXSvQ==
X-Received: by 2002:a17:902:758c:: with SMTP id j12mr14361507pll.79.1644206795673;
        Sun, 06 Feb 2022 20:06:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q32sm7033961pgm.26.2022.02.06.20.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 20:06:35 -0800 (PST)
Message-ID: <62009acb.1c69fb81.14533.3487@mx.google.com>
Date:   Sun, 06 Feb 2022 20:06:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-rc3-197-g418dccbc3ba5
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 499 runs,
 2 regressions (v5.17-rc3-197-g418dccbc3ba5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 499 runs, 2 regressions (v5.17-rc3-197-g418dcc=
bc3ba5)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =

da850-lcdk      | arm  | lab-baylibre  | gcc-10   | davinci_all_defconfig  =
      | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc3-197-g418dccbc3ba5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc3-197-g418dccbc3ba5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      418dccbc3ba5c617fadec7b4e62f03af644776bb =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62006dc5579cde63dc5d6f0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-1=
97-g418dccbc3ba5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-1=
97-g418dccbc3ba5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62006dc5579cde63dc5d6=
f0e
        failing since 89 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
da850-lcdk      | arm  | lab-baylibre  | gcc-10   | davinci_all_defconfig  =
      | 1          =


  Details:     https://kernelci.org/test/plan/id/6200634aa7657bf0295d6f06

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-1=
97-g418dccbc3ba5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-1=
97-g418dccbc3ba5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6200634aa7657bf=
0295d6f0d
        failing since 14 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-07T00:09:36.671468  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-07T00:09:36.671763  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-07T00:09:36.671944  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-07T00:09:36.712240  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =20
