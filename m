Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5193545F1AF
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 17:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhKZQXn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 11:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhKZQVn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 11:21:43 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318A0C061395
        for <linux-next@vger.kernel.org>; Fri, 26 Nov 2021 08:13:29 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so8248283pjj.0
        for <linux-next@vger.kernel.org>; Fri, 26 Nov 2021 08:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qLH8/kJrD0ZPQWnwyUurQH/qqG7KfFIjfU9PQG3Nvt0=;
        b=hfazjd5a8/KAN9vs5fa3PtvfOi/5ONPkXdf2SqaldT897H+UJmlQVbRqbdqyFNTDls
         lE5DWhgs3PfQWcpN9OwdNbFiO4Q5nWUfJs1tR24XesaBtHy57HfZhZJhIpn6moE5Tiwb
         DMLrXeTdXqq8Q3p8oRyk5iBAbo/NaWjJa6i5uzjwRRixAwVZrAEt50n+Ju9ycD/GbPYR
         9Cpq6aPEmgy4enpouo14wKtdeA2lJp1j7GBbR7Dgdoc1qanjikwgzKtkoN+eIRK6WGKR
         kulIhfORqAEUy0C4SShE2XsGnZN3l82W+RlOYxP6vZI++tFuoYyKEJr+D3NV9t/YKuNo
         A4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qLH8/kJrD0ZPQWnwyUurQH/qqG7KfFIjfU9PQG3Nvt0=;
        b=H3Qqbue1itq46B7bTKtVHLQoOyMIPNOPnWoqt9OUn8hBUysIfVZXtiFtb0KcscMhjL
         Wp86IgT2qM7pn3I5LbIDkUOVXLTBeA+4md/X5oiUtReU5ap4jkCQQrsEVdHPn7l3VZLO
         cTD+zc2dtKDEnhIuXIBhamvfWZ8QjSZ4gBKwlJra79qX4xWPFvug14jnmjXYb2bavVUE
         TD8k0y6+Ue41Y2o/iyHEiC6hv6YBNkvdRxZ8WiqEA/j5t9N5GGhBu5iHZhS+Y97Ldjm7
         zJzbg+vSeUMmmRa1qyKR+3dIuFIxqe99A/sthOP2JMjUVSDygWGAa6rwNMFypPHt5gSf
         /myA==
X-Gm-Message-State: AOAM531xMHes8fAl/J8TliSVNVZhdCdw1CE4PDC5XzouyNHnUfMPnDTI
        36KGlEQu9C5EPUrrT4MEb3aP5Um9o/nrFPRV
X-Google-Smtp-Source: ABdhPJzHY7geV67Yr+wYQHJg7ejGOq5XukwMEjzMIrx6fDVTZnOMJA4BKRIFSvbveQsG+CbsrCuc0A==
X-Received: by 2002:a17:902:bb97:b0:144:d5cb:969f with SMTP id m23-20020a170902bb9700b00144d5cb969fmr39068630pls.36.1637943208544;
        Fri, 26 Nov 2021 08:13:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j22sm7893610pfj.130.2021.11.26.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:13:28 -0800 (PST)
Message-ID: <61a107a8.1c69fb81.27ed1.4c8c@mx.google.com>
Date:   Fri, 26 Nov 2021 08:13:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc2-431-geded04af7b26
Subject: next/pending-fixes baseline: 511 runs,
 1 regressions (v5.16-rc2-431-geded04af7b26)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 511 runs, 1 regressions (v5.16-rc2-431-geded04=
af7b26)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc2-431-geded04af7b26/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc2-431-geded04af7b26
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      eded04af7b265c37a3c85b180e99be533c2ab837 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-10   | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61a1031d2cc6e0a2c218f6df

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-4=
31-geded04af7b26/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora=
/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-4=
31-geded04af7b26/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora=
/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
61a1031d2cc6e0a2c218f71b
        new failure (last pass: v5.16-rc2-344-g60d8b4768c0b3)

    2021-11-26T15:53:48.248185  /lava-5084859/1/../bin/lava-test-case<8>[  =
 12.787619] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =20
