Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526872B53DA
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 22:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgKPVbU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 16:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgKPVbU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 16:31:20 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B28C0613CF
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 13:31:20 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 131so4858475pfb.9
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N96+XgjwqUHGK6bzZ8npQ39rWis8Ri+Bq956p4nK9eo=;
        b=mczqVqBNzd70OVxuMRZaZp7L8sIUP2ClF9jOidivxOB5XyiLalbewyP25bFEmmIKP6
         /T59O4QYZ8EshnjbX8GQXlk/F6UWGxKwAZ2qlNi6d3EG7sEsBtgPtIShJG2Ms0sCIFR5
         SK/39kReQSUTHrmsQZpktHPl00fuUYrEi3dozWJDy3nsTu9WWBmmT0Eg70wzlVWl/a/Y
         VgFlULV0zCTSphBtyzN4NcTDOc43EzAm8jpfU8teTVrswXNNMqrYKTFU3lnWFNmaNtNg
         flsx/S8YWMQ5lVyLh4rpFThorMUnr/ONSHbdLaBuBDZdJ99oCNtIz7o1aOuJBUFMZRkq
         n4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N96+XgjwqUHGK6bzZ8npQ39rWis8Ri+Bq956p4nK9eo=;
        b=GZdvOVlZNnlDGVFI+IrOz9M9XAs+cpb4zIE2s31wI8icdDvYhpjUpYdkTKgohjZVED
         K7BO1ogdWcUT471ok8UPeQI3/Uw+SHlrxBMUIpJiB4pTirJr+thMbG0JxGsksRAJr2J9
         cAkskcX/IffABqiiDca1y1zzZvKPNix/KZguUX6n9uNNyMxUbt2869g/WkusNO7ZsxRp
         93dHxRPxxR5US1guwUR4C6mIJQL65ttd2KfDhLZ1TF2cDUEbp3BgGKcgXOTlmGmfB2yz
         bOE2OteqjOS1Cnf1ml1N/DZCGpP2GeAJPNedm+4AKCnjb91vUVlnWCyO0uxXHWIE4Y9U
         BlJw==
X-Gm-Message-State: AOAM531Jhzri4/3Eo8DeydcXQeRQzNO5nDtapPV84lphqNLfl0w2Y3KO
        bkUFeXGGHF0tm4SMpIt2zzE2CryWF//XWQ==
X-Google-Smtp-Source: ABdhPJwZuV/j8Zwp2I2xAvwEsaJ3mZi9kjcN7DPQpxnnCBxTIzdTrjt8rdjkMbtBuSOa+o2KO7+ppg==
X-Received: by 2002:a05:6a00:782:b029:18b:99e:1a72 with SMTP id g2-20020a056a000782b029018b099e1a72mr15721635pfu.63.1605562279950;
        Mon, 16 Nov 2020 13:31:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q126sm19136618pfc.168.2020.11.16.13.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 13:31:19 -0800 (PST)
Message-ID: <5fb2efa7.1c69fb81.60a38.a401@mx.google.com>
Date:   Mon, 16 Nov 2020 13:31:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201116
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 10 runs, 3 regressions (next-20201116)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 10 runs, 3 regressions (next-20201116)

Regressions Summary
-------------------

platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
peach-pi          | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =

tegra124-nyan-big | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201116/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201116
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      034307507118f7e1b18f8403c85af2216da2dc94 =



Test Regressions
---------------- =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
peach-pi          | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb2ab34a7803cc3d1d22e61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-peach-pi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-peach-pi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb2ab34a7803cc3d1d22=
e62
        new failure (last pass: next-20201113) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
rk3288-veyron-jaq | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb2ab3233fea48506d22e78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb2ab3233fea48506d22=
e79
        new failure (last pass: next-20201113) =

 =



platform          | arch | lab           | compiler | defconfig            =
        | regressions
------------------+------+---------------+----------+----------------------=
--------+------------
tegra124-nyan-big | arm  | lab-collabora | gcc-8    | multi_v7_defc...G_ARM=
_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb2ab3033fea48506d22e75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201116/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb2ab3033fea48506d22=
e76
        new failure (last pass: next-20201113) =

 =20
