Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BAD1F1E71
	for <lists+linux-next@lfdr.de>; Mon,  8 Jun 2020 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbgFHRkR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Jun 2020 13:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729964AbgFHRkQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Jun 2020 13:40:16 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBA6C08C5C2
        for <linux-next@vger.kernel.org>; Mon,  8 Jun 2020 10:40:15 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id u5so9076345pgn.5
        for <linux-next@vger.kernel.org>; Mon, 08 Jun 2020 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OeptLRAr/cI5ONk67B3Ges4/1SWUWVESHJFzK8Pqdtw=;
        b=k0wLVwp+5gsQSXyxPjwTHymera9nSro+yIg+0d/XyffAFZyHn1A9hU8BEh1heyBXd3
         Tp+kppFViLte5/ooYmaQ7wIyQzgdDAzeOt70pep+9LFWVy0PMxNz9oLLUock2U3+Tz8t
         NM+LkQpT7ZAIW0Rt5zprK9+bt2SX/EN8Y6n7POyLQcyuxhnQnd/ln3IHaQMv4o7b+3Pj
         w695dpGsEewRSWAcdnAfyU/rcOMARE604iIgvI1YaPjOilwFRLgig2babrisVlapxqwr
         Kv3Q/6Y6gs4XKTPSy+qN4p5wlDoDox3ngNP8Z8LM4iJDjp4l+4gIG6+lOsWBEF03Uaug
         IphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OeptLRAr/cI5ONk67B3Ges4/1SWUWVESHJFzK8Pqdtw=;
        b=rQ++wou4lSXi+mjpxCYQHPMc0+pc57rZOv4RB3GWNWDhacWW545N8V52PdeNw+TGZH
         84QOVNhsjVf/evfuxydE4eLGd5WmzyB4WK2q5BwNecNc8ZPf7EgU85twpZeDdiYxMNsX
         EPkXgaK1DDkuuxgY0B8FP3HpVJRJYUcjPmJxGbXGUTb7rWJFPPrI/v8axfZpyoiaskIc
         4Z91z2iRAcd8xTfFhZED9afCMB2vOAVGD/sNJ2aSuxAWdbgKHLaMfGNKpxpcW9KccSdq
         SxBCA4LUFymd6L6ZMuQnNQF5kn9t+sEYcooTaIv2sKj5W1Mk+Jj3WmjOb1GPeVBYXAlh
         ZALQ==
X-Gm-Message-State: AOAM532dR8NusJp2s9ghm3McQFSgJfU2TAvJ/lPAwgEptitgxtGdPd+9
        JDqzKV4A8vL29RrErJTgect/nl6fuKI=
X-Google-Smtp-Source: ABdhPJydb6sEQpoVcoeSdBeb37tlbVWuYcfytpcNGMlHO/2wzbukRlfYwY684TYz5ouQDfDQQb+vvQ==
X-Received: by 2002:a63:ce0d:: with SMTP id y13mr20861049pgf.90.1591638014011;
        Mon, 08 Jun 2020 10:40:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x2sm7748336pfr.186.2020.06.08.10.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 10:40:13 -0700 (PDT)
Message-ID: <5ede77fd.1c69fb81.c53a8.baa1@mx.google.com>
Date:   Mon, 08 Jun 2020 10:40:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200608
Subject: next/master baseline: 112 runs, 2 regressions (next-20200608)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 112 runs, 2 regressions (next-20200608)

Regressions Summary
-------------------

platform              | arch | lab          | compiler | defconfig         =
| results
----------------------+------+--------------+----------+-------------------=
+--------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-8    | sama5_defconfig   =
| 0/1    =

bcm2837-rpi-3-b       | arm  | lab-baylibre | gcc-8    | bcm2835_defconfig =
| 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200608/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200608
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1713116fa907cc7290020f0d8632ec646d2936f8 =



Test Regressions
---------------- =



platform              | arch | lab          | compiler | defconfig         =
| results
----------------------+------+--------------+----------+-------------------=
+--------
at91-sama5d4_xplained | arm  | lab-baylibre | gcc-8    | sama5_defconfig   =
| 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ede3fedbea1c9edd897bf19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200608/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200608/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ede3fedbea1c9edd897b=
f1a
      failing since 41 days (last pass: next-20200424, first fail: next-202=
00428) =



platform              | arch | lab          | compiler | defconfig         =
| results
----------------------+------+--------------+----------+-------------------=
+--------
bcm2837-rpi-3-b       | arm  | lab-baylibre | gcc-8    | bcm2835_defconfig =
| 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ede434f1d187c7c0c97bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200608/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200608/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ede434f1d187c7c0c97b=
f11
      new failure (last pass: next-20200604) =20
