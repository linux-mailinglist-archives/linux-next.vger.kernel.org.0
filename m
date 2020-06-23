Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32239204EB7
	for <lists+linux-next@lfdr.de>; Tue, 23 Jun 2020 12:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbgFWKDQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 06:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgFWKDP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 06:03:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD376C061573
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2020 03:03:14 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so8923128pls.2
        for <linux-next@vger.kernel.org>; Tue, 23 Jun 2020 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=siQpIxoUk0QK81dO1l4z82yp+usJLiLAQhIF1y0jEms=;
        b=SMAroGG2lUl1QHZEaMZDU1ZycZtI8Fsm3uYPusA0i4uhnUC0aYi3OXs1B+vwhar0e0
         VhDJS6t6iq13Rz5qwNYdlK5qnKaCiV8XnYzPXCpZ9UdJjyztlZRaWNRPYveqtBp67cF0
         16tjL310N4V4Z3fPQ+grpCBrk/shl0A6WR2V1FHdYKPnptlSL/oQiUJLnHtGMOlkoMP2
         +dPkuY9VYVwHVxry66dohAmwF9fu6+i3vk1+cEKMHVky35N5Y5/YAFTjnyeVtYGj/3nm
         W+ZzmMOKMF3QeENpzTie/ElZRMAYDCct8pOTDEJOxpNvYbRXuE8bVGZQMYkV1jLgICx7
         GogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=siQpIxoUk0QK81dO1l4z82yp+usJLiLAQhIF1y0jEms=;
        b=BIF8cRy8VBR8I4H2UiKZuE+jfOyIvb+W4wh1sAMAaNft6xjleADK21KnUngr91kxCd
         JkJlMO4AJFF9DNytx5oRPYhmbLk7PhYbLH0A56zUrJCT+S/l9c6bFiUXFjGE858jxvhF
         Eq8W4cJRVzbOfK9Fl1+p88CpwX02kE5EFTIW09tmIzyAMicFapd2J4X2O1a4+2al0vGN
         n/GGG3W3FKOp6keuk5jJYXpfEgn6DivadN1aHIZ59zhwJ6dYPnACyAmSBNEzbwBPAcEB
         /Wh4BvATeYjyS3Dhr2JlxSAscQXsDbiAxI78c6eQd5iSJgfGp7hkbOg9jKvVQ4BudXT2
         ExYw==
X-Gm-Message-State: AOAM533S5XfaYth8zbsQveZCZAiDe9CvVnpgNnSpwq9lFaLmX/TI3vM8
        WqGyt/uBymN76Hcx+Eb3CD784b1iyPI=
X-Google-Smtp-Source: ABdhPJxTKfPCnl/DcJEBkjUmxadkPEwkT568vXNODG6HRdvH38JJckIVD/AYyiPWTMyMXQ0x3rQz9w==
X-Received: by 2002:a17:902:44:: with SMTP id 62mr23291063pla.104.1592906593933;
        Tue, 23 Jun 2020 03:03:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f23sm1959175pja.8.2020.06.23.03.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 03:03:13 -0700 (PDT)
Message-ID: <5ef1d361.1c69fb81.22a18.6579@mx.google.com>
Date:   Tue, 23 Jun 2020 03:03:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc2-295-g0780e0d6abd0
Subject: next/pending-fixes baseline: 159 runs,
 1 regressions (v5.8-rc2-295-g0780e0d6abd0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 159 runs, 1 regressions (v5.8-rc2-295-g0780e0d=
6abd0)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc2-295-g0780e0d6abd0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc2-295-g0780e0d6abd0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0780e0d6abd002e8a1acdca06d6edc61e95a1356 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef19e77ccd65501bc97bf27

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-29=
5-g0780e0d6abd0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-29=
5-g0780e0d6abd0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ef19e77ccd6550=
1bc97bf2c
      new failure (last pass: v5.8-rc1-586-ga2825885ceeb)
      2 lines =20
