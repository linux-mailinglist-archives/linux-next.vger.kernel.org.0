Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36F864A6C00
	for <lists+linux-next@lfdr.de>; Wed,  2 Feb 2022 07:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234723AbiBBG6k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Feb 2022 01:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiBBG6k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2022 01:58:40 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77203C061714
        for <linux-next@vger.kernel.org>; Tue,  1 Feb 2022 22:58:40 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id n32so17983024pfv.11
        for <linux-next@vger.kernel.org>; Tue, 01 Feb 2022 22:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Hc/sMjgwJi/SiVQ6bUGh4IHW2Urr2tdu0A1y7WfhC6M=;
        b=S5wdyBgEahSNbY1nW1tv/5K1dfwR8iq+URy7UkE18qYUvrxY8mcob+dw2J5zmnJ69e
         EQLy7J1VtU/f7O3Ml6otrHihiykbf4gfprsLckjwQB/g7yQFwbTaMj10vIC8rE3PYX4P
         phogAh0fFj8Kqpn1gJP04jhQ4bE+yXXuzMZVPda+XFSc8KLU5K5yHiD0oN3JLkfwsac2
         W51rnIUY+PFOlK7RdwfhSl0WBH80rkOVuUkdmmLFhhTSnXGi7BvZJuJYqRCChudcSSJr
         D9wSOhw45/2iosmskmucA2Nyw0WLc7vSurGTcSTqCMJ8M5YSYXA+sLQK/al2TACuFxIT
         ne9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Hc/sMjgwJi/SiVQ6bUGh4IHW2Urr2tdu0A1y7WfhC6M=;
        b=zvC5mT+8zrn/fReELIBA32XCNfYXR36FooJq3Uu7J9jJQ0cWkZ/X8Bo0mBAVrHXiag
         ilmHaQxg/pMTnxSeVZTzuDwor5PJBZY6W2vAKSOWzEWGxZ3NIzXUbO1H36CbI53lL7Kg
         K2Osu/8Jq4sCfQdKpzRaE4QTfaWDK3eevYVbpfFGNokDcWe8Iowi/PXQeBHVJtuyraQH
         flStNagS3iobfakSJEQb7ZWbFV7dILtmL6lQQIgLR7EOvrgo9Nyk4MMDZryk0fHnV9Nb
         IqPO8JBUs0Q1HzZrmd+euDhnjb1hE16dP21+iASBQsz+T1mA6jc1kvhoyTIWVyp9ys/S
         Ct6w==
X-Gm-Message-State: AOAM532KqhitYYdLU3AYRR97ljdJKsz4esNKmfnFfFolo6PJZereT+Bn
        cIRdhmlRyu4YdhChbioESYSrtQ4sAOpWd0Hu
X-Google-Smtp-Source: ABdhPJyWADLi4ekTjmRdm+d+MMka3D83ANadOh/eAXFa8006cHbU0TSDPoOPtLrSRT2CJJd/NGZf4w==
X-Received: by 2002:a63:2c07:: with SMTP id s7mr23378830pgs.181.1643785119846;
        Tue, 01 Feb 2022 22:58:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h19sm4722079pjv.38.2022.02.01.22.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 22:58:39 -0800 (PST)
Message-ID: <61fa2b9f.1c69fb81.3f3e9.d06b@mx.google.com>
Date:   Tue, 01 Feb 2022 22:58:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-rc2-283-g4c44843f7a9c
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 543 runs,
 1 regressions (v5.17-rc2-283-g4c44843f7a9c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 543 runs, 1 regressions (v5.17-rc2-283-g4c4484=
3f7a9c)

Regressions Summary
-------------------

platform   | arch | lab          | compiler | defconfig             | regre=
ssions
-----------+------+--------------+----------+-----------------------+------=
------
da850-lcdk | arm  | lab-baylibre | gcc-10   | davinci_all_defconfig | 1    =
      =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc2-283-g4c44843f7a9c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc2-283-g4c44843f7a9c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4c44843f7a9c642de663b537f77bbfa10aabc4ab =



Test Regressions
---------------- =



platform   | arch | lab          | compiler | defconfig             | regre=
ssions
-----------+------+--------------+----------+-----------------------+------=
------
da850-lcdk | arm  | lab-baylibre | gcc-10   | davinci_all_defconfig | 1    =
      =


  Details:     https://kernelci.org/test/plan/id/61f9f30dd1f345ff075d6f34

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
83-g4c44843f7a9c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc2-2=
83-g4c44843f7a9c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f9f30ed1f345f=
f075d6f3b
        failing since 9 days (last pass: v5.16-11577-gffd79fec234d, first f=
ail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-02T02:57:08.871163  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-02T02:57:08.871497  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-02T02:57:08.871683  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-02T02:57:08.913863  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =20
