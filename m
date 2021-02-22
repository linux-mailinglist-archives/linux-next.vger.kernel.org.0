Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CDF321013
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 05:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBVEvz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 23:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhBVEvz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Feb 2021 23:51:55 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47FAC061574
        for <linux-next@vger.kernel.org>; Sun, 21 Feb 2021 20:51:14 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id z6so5881696pfq.0
        for <linux-next@vger.kernel.org>; Sun, 21 Feb 2021 20:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0gIDFqhiBX5gm7c5tJ23OnpaYN/iVrSuRjmv6jZhaDs=;
        b=Fixwh0tQHgnjs5QmVx/aU2zEsPDD/miB64A4OEnMl+8ca8cV86ptx1rcCelPEe/D7p
         AthjxuiuTKlph8rRZWSLFwjFrK2c9poeBWOxaSciYhQrTDEUKlHGxYFh94e1fAYbzVvS
         /+OHvQZrbu5xtgmXyKH1Ex1yfF813HXlprysopGeSlGYPjeswbXfBvBawawG8wDJ2bD/
         GhIHFc+1aM5vpTWrzLl5TcZ3a6sR1W0i2EBDCc3jsrxukdoO/IvzcYlTHFLEQq+tF58o
         dNdiVJQ69T1nfnR7qg0ZKbvJfHxr/Kc8nqVG7WI6dqyRY8hcwcGRgeV1+vRoi07lse9X
         hCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0gIDFqhiBX5gm7c5tJ23OnpaYN/iVrSuRjmv6jZhaDs=;
        b=CYFrBtZGxahxgjvR+ETZifKJBpfIjI2wPVaVcUP3jfa6rOraPYyFhnfSNzaIUgSQI6
         KjMIQSBk2TiE9cgoB4y391UDt2tTKWqFFtfrpdzEbPyXxFK1+GlXzGdTTo44hhG3hYrP
         aikT/sIaHMY1hTLbMumkQuZYdw+45lvkCoyd/RQsqf1TRTawaMelwiZTymD8QIfPyFvs
         2lfBrA+LSrRLWC0TADBPuAA7qvWMGQblQ2E/vcWWd/vtkuESUznSYyWQCDg3Fq6hB1iP
         l/wHZ+8YPqaEHbwap8Z9Q3KHAradKEwGDuP8zKkO+dUgZdvqRyIsV80U9JkQyDyROv36
         vomg==
X-Gm-Message-State: AOAM530TJVKRdfEnbwTWxz6URJMaBIO4zDKLPTtoU7/Tup1HOhiIeoDS
        sLJg2WaA8vETo0Lksgy2RBcf7LoWXpachA==
X-Google-Smtp-Source: ABdhPJwTxTqkui91Nm76asLH5aVdjyrbD5zngEvOZkj3xcbVfXYFwTaoevowE7ill1RvMhYFpGd3XQ==
X-Received: by 2002:a05:6a00:847:b029:1b3:b9c3:11fb with SMTP id q7-20020a056a000847b02901b3b9c311fbmr20056798pfk.44.1613969474016;
        Sun, 21 Feb 2021 20:51:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 134sm17630215pfc.113.2021.02.21.20.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 20:51:13 -0800 (PST)
Message-ID: <60333841.1c69fb81.2fa55.6b09@mx.google.com>
Date:   Sun, 21 Feb 2021 20:51:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-5016-ge82d5d2555f2
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 185 runs,
 3 regressions (v5.11-5016-ge82d5d2555f2)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 185 runs, 3 regressions (v5.11-5016-ge82d5d255=
5f2)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

beaglebone-black | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =

imx8mp-evk       | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-5016-ge82d5d2555f2/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-5016-ge82d5d2555f2
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e82d5d2555f206145d3882c1aa76842e89623761 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
bcm2836-rpi-2-b  | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60331a5fcf07d0236daddcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-5016-=
ge82d5d2555f2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-5016-=
ge82d5d2555f2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60331a5fcf07d0236dadd=
cc8
        failing since 17 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
beaglebone-black | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFI=
G_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6033284011836462e5addcbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-5016-=
ge82d5d2555f2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-5016-=
ge82d5d2555f2/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6033284011836462e5add=
cbe
        new failure (last pass: v5.11-2286-g3c15bb8df3365) =

 =



platform         | arch  | lab           | compiler | defconfig            =
        | regressions
-----------------+-------+---------------+----------+----------------------=
--------+------------
imx8mp-evk       | arm64 | lab-nxp       | gcc-8    | defconfig+CON...OMIZE=
_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603306a5b24c0aac40addd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-5016-=
ge82d5d2555f2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-5016-=
ge82d5d2555f2/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603306a5b24c0aac40add=
d14
        new failure (last pass: v5.11-2286-g3c15bb8df3365) =

 =20
