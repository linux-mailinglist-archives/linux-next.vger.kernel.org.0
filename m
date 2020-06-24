Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D34206D7F
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 09:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389686AbgFXHW4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 03:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389724AbgFXHWy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 03:22:54 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62120C061573
        for <linux-next@vger.kernel.org>; Wed, 24 Jun 2020 00:22:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k6so694995pll.9
        for <linux-next@vger.kernel.org>; Wed, 24 Jun 2020 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PFrOoGmcJnQKyk6KLk0emIflGVCGPTEAW2b+O89fC+w=;
        b=wtUR40S6SOKojMKmaDbnz6i73uJ1aWHiAIbHyKqUCrdGr2H2eLgix3lwkdc7k3m2VK
         ErPvriSu7fZDsamZ6gU0chkmWJuXTWaiII0UYe6YvVQ4RVtPKPGQWiCPWQKPAM7sf2XX
         DYvdKYBQDndpDpUxZYinhIZ9H/ZZFYrxex2oN+4ABPMjAwwUy00nnd5iDJgGiAjfpood
         PPffxDU31wXSVQZ42dqokx94iGRLclXGHRvw2yE5TfRG5RJTYDiRtm43TljJt3JPlhQ2
         SCx1W9GYgfzZk55LvEtIm1XqyNRVOOZ1dsOBGPwtgyxeoQoPcMOz4Ie+WL58LGBDjfdN
         wFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PFrOoGmcJnQKyk6KLk0emIflGVCGPTEAW2b+O89fC+w=;
        b=Is97l3vNeGWSt5716bvBu9MtDzVoko6pR4TheuXRySSRYEDjz+5BDiemi87aPzul9e
         FCN+rv/bCUrhfm5pNxWR2iSnfjHH6yBLRCjd3iLy7uwtYOWRGx7wJdQJz+EfZVps1tKj
         g638tahkN6ojuofIg2T5GLTlCej4Lgg7Kq2tuvc9N7b9hybMXO5J2TwWr2UUWPPz8ZOK
         wUvwQqsnKaEwkEO5pa5C1ealGEYqcQb4y595KTIfrnlZFQTW4QpH+EJy41RNdWlVduwr
         LfsHSKKzhwt5+SbtasHr8O/UfRZehTiWctERSLuEShSHIz2+jCrYVMG1a+CdQSzkIA12
         ZKNQ==
X-Gm-Message-State: AOAM531I7zlVZfz/cImd9uiA4iFph9CKsFAEEZEPX3hn4xCK9WSDwcrv
        7wDYAjyR/Lv5pU9r+FHpigQofanqEVQ=
X-Google-Smtp-Source: ABdhPJx4vIy/8HzpXEIS4PlV+yI9lRXJF3jW+X4g6eQJi32PoI0Ah6fHf5mpgD+lRhG9ELTtHbCOHw==
X-Received: by 2002:a17:902:44:: with SMTP id 62mr27287836pla.104.1592983372512;
        Wed, 24 Jun 2020 00:22:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s197sm19042442pfc.188.2020.06.24.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 00:22:51 -0700 (PDT)
Message-ID: <5ef2ff4b.1c69fb81.4f69b.bac9@mx.google.com>
Date:   Wed, 24 Jun 2020 00:22:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc2-376-g1c7e639860a8
Subject: next/pending-fixes baseline: 159 runs,
 1 regressions (v5.8-rc2-376-g1c7e639860a8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 159 runs, 1 regressions (v5.8-rc2-376-g1c7e639=
860a8)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc2-376-g1c7e639860a8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc2-376-g1c7e639860a8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1c7e639860a8c025e73c4e18ab7b6b8116175659 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | results
----------------+-------+--------------+----------+-----------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef2c2fd93032302cd97bf09

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-37=
6-g1c7e639860a8/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc2-37=
6-g1c7e639860a8/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef2c2fd93032302=
cd97bf0c
      new failure (last pass: v5.8-rc2-295-g0780e0d6abd0)
      1 lines =20
