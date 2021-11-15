Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910FA44FD76
	for <lists+linux-next@lfdr.de>; Mon, 15 Nov 2021 04:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbhKOD2v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Nov 2021 22:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236599AbhKOD2p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Nov 2021 22:28:45 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501B7C061766
        for <linux-next@vger.kernel.org>; Sun, 14 Nov 2021 19:25:50 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id u11so13305744plf.3
        for <linux-next@vger.kernel.org>; Sun, 14 Nov 2021 19:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zZU7Zmgw9k4j2zupcxsi5abry+GKjfTDtJ7oXm1MBAM=;
        b=bDztazRPKNDecN4WWhYpZeQNO+0SER3x9vIHhMwA9dlPNipletkPTjZEcvygldpeqv
         CxZCNd5LTvhQfVNwAKnl8PzGspfauePHmXeyxq/CrJs4nz1THlsHnZ5IuVLQDzSXD3i5
         UfQ2eBA1rh9Flai9ZCQusXnh5qBH6sF35FuY/nY4uP88l7ZlowjWPaec5jItInzJ3q3Y
         4OCWhDlwhaDKjOVA0D5VVbiKX1/QaZoStA0cuVePkCTurxK6a8gdDQmagaMirvL42v2H
         zPF7KduGHHcryhmWKHfgHE0Q22c5I9T8IjxejIxc5aGt9gbeKs25xDaII8F+WEwrC05O
         aFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zZU7Zmgw9k4j2zupcxsi5abry+GKjfTDtJ7oXm1MBAM=;
        b=B0ZY0r61MWzQ6CT1MWFp5kJqrLvL3xDwnIVsJp67JzoyEgh3BrRaELgeTpnEJhHnyN
         Yt1MKD37qbCPKvpxSAJkaqpc2iKzG3S1htEi0PrSLu6bUttWse6pzJu6WOm3VVJEBKxl
         mloQOtkKcRtJpC5z4S7Tx/ZuCM/2j/gwO9Dow979W7b5SHsN6M7cyCJwvCdGvTgPjPXE
         TQVwgQa02PN65sf54pvhTC7GDYZPw8Sdnho21A1/4WRuvLHQFsAC/dDZf3YYH65UA68D
         YkzXZdYECdq1aGzB8pA74aGH0xcDiss67upfti2skTuLQ0sT3CXSrsYEFgqSrfG2vD2o
         UlXQ==
X-Gm-Message-State: AOAM531hiqUhU1pimFzUjfzBPNd6rzDIgfBLMgSt/fM4fsOHuJBXGT4r
        q/hqWzpRqrGi6qSXV/GjEsRH5UNrCds2fPhp
X-Google-Smtp-Source: ABdhPJyXBbegNp3Livrs7VPcvMXnk91oyIeUApu8g3ep6Pp3i3S6SQBXJYV1dDmUVVJSbVgNM+4FMg==
X-Received: by 2002:a17:903:2348:b0:141:d60b:ee90 with SMTP id c8-20020a170903234800b00141d60bee90mr31368644plh.15.1636946749736;
        Sun, 14 Nov 2021 19:25:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h23sm12934824pfn.109.2021.11.14.19.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 19:25:49 -0800 (PST)
Message-ID: <6191d33d.1c69fb81.80a64.6971@mx.google.com>
Date:   Sun, 14 Nov 2021 19:25:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-13240-g86fd312d9a30
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 668 runs,
 2 regressions (v5.15-13240-g86fd312d9a30)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 668 runs, 2 regressions (v5.15-13240-g86fd312d=
9a30)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-13240-g86fd312d9a30/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-13240-g86fd312d9a30
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      86fd312d9a3085c29cd9d28bbb1e20e63efb92be =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/619199f4454d567388335976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-13240=
-g86fd312d9a30/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-13240=
-g86fd312d9a30/arm64/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619199f4454d567388335=
977
        failing since 2 days (last pass: v5.15-12344-g8c82a56b7923, first f=
ail: v5.15-12549-g95867f15dff8) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6191c69a8701f99ffe3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-13240=
-g86fd312d9a30/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-13240=
-g86fd312d9a30/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6191c69a8701f99ffe335=
8dd
        failing since 11 days (last pass: v5.15-2033-g53a1f94bc3ad, first f=
ail: v5.15-5907-g771bcd3baddd) =

 =20
