Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B81C488EA4
	for <lists+linux-next@lfdr.de>; Mon, 10 Jan 2022 03:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235951AbiAJC0b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Jan 2022 21:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbiAJC0b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Jan 2022 21:26:31 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA4BC06173F
        for <linux-next@vger.kernel.org>; Sun,  9 Jan 2022 18:26:31 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id n16so10717935plc.2
        for <linux-next@vger.kernel.org>; Sun, 09 Jan 2022 18:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cL5O9YY9L14UFsATxnw10xKMQgd1AM7SwLEr6dJwle4=;
        b=MEt8wREyHnVykTuEQlLVW6giG0spADKtYd7cDSnZSYEBnYKDowXzfPVzj3a48BkaCG
         K92bBlRYNLQKpWy3ihkqH7dk8B/qf2PzYHCcPytYwg/hrIpm4ozJlAOthmsyeMqHhI4z
         blxej/78srdVnKjjALAgvIYeTbQf7csPRyb31Pdxb+i9nyH70t9w5ryV10KeUsTL9YOx
         0Wf9PrszpMFVOK2dM2zMech/JJTIn6Z1URU+K/ALFFtqFT8Prqi9tIcVY7LR0hZdj/74
         nWXVszfqz0nOo1dq0XrmAYbwXpPipvP8/K1S/3+mbozlps+BQG4AhlPlNdM3qwJM9Gm8
         Zucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cL5O9YY9L14UFsATxnw10xKMQgd1AM7SwLEr6dJwle4=;
        b=a+WgOl4Qscf+9KxMksoOK/vfI4Vx8F6C2J86CdKZuLtsxgfcvity0l9QG0Yv9UClXt
         cDidCZPHn7CL7oBRt6REREQMqA+OVlaX1YRvd32BzTaAbwW/6tAJXds+OTR8Z3rjpxwT
         HLmkxIb+OThcX9wVxycP0AEKBj8Ljcc0qLFidzVr31nYmXSQ5hcTBk0/DqGGVcJs/958
         2UBU8INOzMEGtKznVOlJe1kx+UUHYvwOGouQ0ynzg5L/uEwliS/+usL8VUeJQdfD6Jc5
         srg6yXv2sJQG+/HbfxzCwc7lP34Ah2nuUvOaX0s5Vgi5pNydSzs1BhLHtpEa//PBgpHu
         gZyw==
X-Gm-Message-State: AOAM533a5tOtcnkSvyWKaCLnMVXn0FQ8+eLMCWLSzo/mXKLgRLcBKB1G
        YrLsorNOwsZ3A+FcpxpeEN6esKr3U9RzuPsj
X-Google-Smtp-Source: ABdhPJzea/7jzkkh6ABeotyNqg9A27xNWtvMfRXjS3niM10FwhcA/w3UljZFQtx4yi9d+jAe/jT0MA==
X-Received: by 2002:a17:90b:a0f:: with SMTP id gg15mr28149428pjb.8.1641781590469;
        Sun, 09 Jan 2022 18:26:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x4sm4057931pjn.56.2022.01.09.18.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 18:26:30 -0800 (PST)
Message-ID: <61db9956.1c69fb81.e68f4.c3cc@mx.google.com>
Date:   Sun, 09 Jan 2022 18:26:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc8-185-gf94a706f394a
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 491 runs,
 1 regressions (v5.16-rc8-185-gf94a706f394a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 491 runs, 1 regressions (v5.16-rc8-185-gf94a70=
6f394a)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc8-185-gf94a706f394a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc8-185-gf94a706f394a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f94a706f394ab9fc1852538946c9887f2aa08bf3 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61db5e64c4a1ce04b2ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
85-gf94a706f394a/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
85-gf94a706f394a/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61db5e64c4a1ce04b2ef6=
73e
        failing since 60 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =20
