Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFB32AF1E9
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 14:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgKKNTh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 08:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgKKNTg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 08:19:36 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749C7C0613D1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 05:19:36 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id z3so1580282pfb.10
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 05:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xOEBfNet2IIhnDUe7vU0nGIDIA0pb6oI0zqNSJX3sGc=;
        b=fNBw1IQ/aEq7RWMfIUIzQjT709G+VAIVCghzD6LZK82XXprakxxNWb4sJBxrGI2vf3
         9OufA6LfgQ5zguxV2Czkn5qqPg1hgN0QyGBJrOqPoVyaLxXPBAbUeoQ9//FJZXj8Z20g
         b9HC2Nqm3YH0bAm6Ob4qhyWJ0a9k5qiQw9SQ+cAuxN9abBuS0zCPePBhJ7qyybAf/+be
         tk2neFg9Zr6FRIBElISuzMo4YNBRaF2+R89HG+pXA7GpCd73w6iU00xt6ctHSTxzvavD
         c+AHuV/PO8mMpnfO21bZFV6Yupu+w6vtL8c3cFhZtWHY58i6sbUgwJwT1ORosKNQO0jY
         Dg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xOEBfNet2IIhnDUe7vU0nGIDIA0pb6oI0zqNSJX3sGc=;
        b=rG1QGl7x8NMTkUUmqy1Zq6UUbbtWeTL/5R17pl48sCEihvGwMhsoePY9AzuUNAOBQI
         bYfViGAgLbFcfCzPTOgpdyVeyEXFVxziWhMsOXoyt8A3zu4sqdp/t4xHsFrJZC+pk1dO
         9Y85xQUcuACLXYjqDJJEOQ8vzxx4DXoE/NARpiv+G8DBQTWHdxzqF5XoG76BLG+1/73g
         aGdMXh74SiXAJCL8E6VkTSCuDu1i6kN5/b2OS7Z7TgSC2mOhOZaSP1MG+NF0VxQDYu+0
         T7hrSGaod6u/o9EtlswKYdyrm85xGdc7F0jpEkQzuxRp4O7Z48rRuQ26N7hqn7b+/kEP
         RdSw==
X-Gm-Message-State: AOAM532Y1flMVVbD9d0/8aninQV+3MXeg6PTBidJ6hRRLJUpQLM53XGn
        SYnbvEJGAIIckTq3a7wUHkLazNDyq5E02g==
X-Google-Smtp-Source: ABdhPJwhUXQpRpAYOzagge69HSqwv0tThKwn+Tg1guts4vfhPL/ttc+jfiPVEVu4dzS0//O+BPAfOA==
X-Received: by 2002:a63:2145:: with SMTP id s5mr20483393pgm.288.1605100775648;
        Wed, 11 Nov 2020 05:19:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16sm2749525pfq.179.2020.11.11.05.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 05:19:35 -0800 (PST)
Message-ID: <5fabe4e7.1c69fb81.dfb01.5d3d@mx.google.com>
Date:   Wed, 11 Nov 2020 05:19:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.10-rc3-315-g3c8bf35b8254
Subject: next/pending-fixes baseline: 329 runs,
 4 regressions (v5.10-rc3-315-g3c8bf35b8254)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 329 runs, 4 regressions (v5.10-rc3-315-g3c8bf3=
5b8254)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc3-315-g3c8bf35b8254/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc3-315-g3c8bf35b8254
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3c8bf35b825484117189bf15702deea14bd8b7b2 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabb0e0eeb227d04edb8875

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabb0e0eeb227d04edb8=
876
        failing since 16 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabb1e06b3ab638a4db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabb1e06b3ab638a4db8=
854
        failing since 16 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabb373580929acd6db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabb373580929acd6db8=
855
        new failure (last pass: v5.10-rc3-245-gcb165dbb5aeb) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-gxl-s805x-p241     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabb20442d2b10b78db8857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-3=
15-g3c8bf35b8254/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabb20442d2b10b78db8=
858
        new failure (last pass: v5.10-rc3-245-gcb165dbb5aeb) =

 =20
