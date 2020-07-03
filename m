Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510F7213BEA
	for <lists+linux-next@lfdr.de>; Fri,  3 Jul 2020 16:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgGCOi1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Jul 2020 10:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCOi1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Jul 2020 10:38:27 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CD7C08C5C1
        for <linux-next@vger.kernel.org>; Fri,  3 Jul 2020 07:38:27 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a9so3569619pjh.5
        for <linux-next@vger.kernel.org>; Fri, 03 Jul 2020 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2kGx0cWHa7QIqYO1dKWa5YiDcU8UjCNEkaL8LzhV8Lw=;
        b=wnXkLCTBpsvRODtIjmh5pvI75xYesyDi091Z6+asEAUnWgS7YJuXHsZOIjZqVxUUuU
         HaZ8MShvPqzlyfYdnR/0B5Gmbk+amTgmbzv5AdLc7gWDkUMFXKUWo52qQ8mCL8nusyhL
         2fjx4QmQlWW7nR7aUzzA2QgFaBgRkZnm1CM0RY6aXIMklWUSSVl2ezZ8jFHzy8+cTuQ/
         twZdJPrNCJrY1qvkXyooR4zslwXSiWlqIbzleubvxwAvyNMyT2MpLMtpqFirYuZok30D
         z7p+6dc181q3QX8ZN/pmYmBAUwdToDUeW2EV/cxfWNlyhppRgD5EDAToLbCJdD0pKZRJ
         bfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2kGx0cWHa7QIqYO1dKWa5YiDcU8UjCNEkaL8LzhV8Lw=;
        b=adBi7lr6KPlkkY0sZ1sZMrt5W1yaR8ghuMZatoF3CXj/KLKfZL8digd7RaQuwMDv93
         UkIm4ghqN5mVByXxmd08V/Qx6H4riIbtwj18Tt3q3gUmWjOObwCSCS4hxHuO3Jq7xy5r
         NfEUhtq69NmBYI+BMr5El8S3+HNFob0Lu3a17aaOZEkpdySlu3Qyq8uljpCPlr/3U5Ze
         wcJR4gQWtFiei4WvRBXk/BPfnPT/S5I16/8Qi+8csvgA6QF30MSG4iLtZTET2sHINn4o
         rNJwSPPN+mMoZcKMdnDU3ZrZIpM/yYwqJg47LiA9H7tQoep6jOBkFyEPTtVG18P0im/f
         K0uQ==
X-Gm-Message-State: AOAM530nDxIVWIeQUSK2kf1GbAAl60upn/fDANKznDiDS+TC3ETHpFlM
        pDvRuWUIQSKBlmuzLXLVboaB/hvWD1E=
X-Google-Smtp-Source: ABdhPJwsxsdNiOVlWw3d4rwMbge1zynfbR40vkZXg0vrUZuuN7A97darY7VX0xSertiqQnvoLqy3IQ==
X-Received: by 2002:a17:902:9a81:: with SMTP id w1mr29618183plp.50.1593787106188;
        Fri, 03 Jul 2020 07:38:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k4sm10781613pjt.16.2020.07.03.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 07:38:25 -0700 (PDT)
Message-ID: <5eff42e1.1c69fb81.49b2.c16a@mx.google.com>
Date:   Fri, 03 Jul 2020 07:38:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200703
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 160 runs, 2 regressions (next-20200703)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 160 runs, 2 regressions (next-20200703)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
vexpress-v2p-ca15-tc1 | arm  | lab-baylibre | gcc-8    | vexpress_defconfig=
 | 3/5    =

vexpress-v2p-ca15-tc1 | arm  | lab-cip      | gcc-8    | vexpress_defconfig=
 | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200703/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200703
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e50b94b3eb0d859a2586b5a40d7fd6e5afd9210 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
vexpress-v2p-ca15-tc1 | arm  | lab-baylibre | gcc-8    | vexpress_defconfig=
 | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5eff0b80bdeb9c7b1a85bb3d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200703/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200703/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eff0b80bdeb9c7b=
1a85bb40
      failing since 27 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform              | arch | lab          | compiler | defconfig         =
 | results
----------------------+------+--------------+----------+-------------------=
-+--------
vexpress-v2p-ca15-tc1 | arm  | lab-cip      | gcc-8    | vexpress_defconfig=
 | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5eff0b66d3be76b73585bb1f

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200703/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200703/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eff0b66d3be76b7=
3585bb22
      failing since 27 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
