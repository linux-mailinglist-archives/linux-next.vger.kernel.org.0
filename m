Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5304451AB
	for <lists+linux-next@lfdr.de>; Thu,  4 Nov 2021 11:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhKDKrm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Nov 2021 06:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDKrm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Nov 2021 06:47:42 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0F9C061714
        for <linux-next@vger.kernel.org>; Thu,  4 Nov 2021 03:45:04 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id o14so6528813plg.5
        for <linux-next@vger.kernel.org>; Thu, 04 Nov 2021 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8LpGSD5lnOYVqyc301NmVMwvf4b1aZ3xvBfBoGbL1ts=;
        b=Lo5JJiOEQWCUM49e7m9r5RY8gtHmnrTLktcq489LxhHhApUH6Zo+9YwzdPov/yqAmo
         IkM9UfHlRKCacrMBpafQViXc/eFNvbryVdJ5RHpSGfX8ZQr6Cx3Fbj7IvTNeEo2suzi/
         D4enmAhZap8mekVCnA1WnCA3hyfoNyu7CDKQQzj5/V/mh/8fc9qxBSUeQ1w/rP/7xjeZ
         aA74gTlWkioCg1axI2r2Xb/14qBrfX/I9JkiwvU7pwnlYer923O21B8m6JQbKjwW5Ss9
         X7IhTCQ8M0/9meZGPm3z+NUIKSEL8px4o5QokCgSTaMnlrCOXmu2CeIRYbWeNU+OeD7m
         DdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8LpGSD5lnOYVqyc301NmVMwvf4b1aZ3xvBfBoGbL1ts=;
        b=RNEKyfzrY4DC0R/rDmhNf1pWySajJXz6AAzr0e8etqOEo+0CnMtsjba+VK/w5GP8U2
         BbhmP0xrns9uKe+2MPKIGlIbsAzkVWKkptjoPkakgonR2MvXJr2Yuhp8knQ0s0UNJPHX
         rXw0uGQj0XLOROoHWhIgmQ9f/GyutDR/fxn3klAIVn42IJgg9bUkn2aCCiYLyZNQFIgh
         b6Q5PrJK5mjgzgX4wjvD1BfTHmT7Kjdtt3pHQpPGJ7U0w0OWZsC12DqP9lMLXdx4AKY+
         OxJC6KZm66rPfSLv04xwtlW0lr8MEDdEosVUkVSoO+QvVr3HwR0ztdOdX9XBxQ5YzswV
         0pIg==
X-Gm-Message-State: AOAM533dHYJoqGNToewXKwNyMkYXQ4pn8/6pwVQroa3YEEhKNCiyeRgf
        5yRq0oEirjuTfP7gHHQA96+qvsvu2jaoHxXn
X-Google-Smtp-Source: ABdhPJymkX1TzySMjt4/PADjkiNvVa0T5JdUJgrtrg3WC+/EvuDwCtodQW2RMOHZKi3FBUN1+46fBA==
X-Received: by 2002:a17:90a:6b0a:: with SMTP id v10mr21078792pjj.130.1636022703811;
        Thu, 04 Nov 2021 03:45:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13sm7564158pjl.15.2021.11.04.03.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 03:45:03 -0700 (PDT)
Message-ID: <6183b9af.1c69fb81.7f7e.78da@mx.google.com>
Date:   Thu, 04 Nov 2021 03:45:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211104
X-Kernelci-Report-Type: test
Subject: next/master baseline: 687 runs, 1 regressions (next-20211104)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 687 runs, 1 regressions (next-20211104)

Regressions Summary
-------------------

platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211104/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211104
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8a796a1dfca2780321755033a74bca2bbe651680 =



Test Regressions
---------------- =



platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/61837eb0761b88de983358ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211029101439+08e3a=
5ccd952-1~exp1~20211029222017.20)
  Plain log:   https://storage.kernelci.org//next/master/next-20211104/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211104/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61837eb0761b88de98335=
8ee
        failing since 7 days (last pass: next-20211026, first fail: next-20=
211027) =

 =20
