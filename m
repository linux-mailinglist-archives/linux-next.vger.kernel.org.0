Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19095460DFF
	for <lists+linux-next@lfdr.de>; Mon, 29 Nov 2021 05:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhK2ETz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Nov 2021 23:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhK2ERx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Nov 2021 23:17:53 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422CEC0613B8
        for <linux-next@vger.kernel.org>; Sun, 28 Nov 2021 19:54:15 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so12906563pjb.5
        for <linux-next@vger.kernel.org>; Sun, 28 Nov 2021 19:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EF21J2CgHT+PVXUP+Qmf3dBtxJgpBPZV2ygr69fEDOY=;
        b=5e23KSH0afdIBUglEqkXI0jlKq6HiZrkiiZAgnCp/HUh+KCsXoQp4JB8pUMvbLtx4s
         lYPzJAtbx+TLq48Qu/JOhCb8xBv2k2DOxf/5/EgA/7IQTvLAL3BB8K+VLbpUkE11XXuK
         mIU3QCo1nXJRx5wf46MkMO0su9g+Pt4ZBxB/r9I+8ZC+5jgtrqn4zayRnXJ0nqERXPCS
         AVzZIg20ttrl0DBsKV3dHfSa//ay7yebpR68u76DBpVoQQIW9dvuqL51SNNs2w/JxFwL
         CQcRirdUh2U0o92FUR1W95+BelxPnkmHD4MLv/n9zuebxaM3hFbFJPmyJw1MxZh3m2An
         uyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EF21J2CgHT+PVXUP+Qmf3dBtxJgpBPZV2ygr69fEDOY=;
        b=HSdNBLuVJSPwsOh6iAXH7MezMCons/mNWxCCSkRNH4XbcJ2KE89nLeyHTM1z+ZxhRh
         py+OTGbnj286SS91+MG61oeA6zCIFdRdOqWvu++JYbmwWFAohTdD3aR5D/YutGXwWkOJ
         2gbiUGENCEsTXJJmjrDbmcg29LiPZuXSHGM1Os6llFwW/KlGD7+0+POry5oAnHaqLSMz
         w7lp5VbpYoXRueAHMh/C8nEKF/TxXZeId4BzEPvkmAQfY+gWBoV9O3stXO37lMK/89Th
         /oEPCRiXISj1EGw2UUFCrL4TMtZ/HaBqWcwXsNQO+L6ktpH6GEIMj/99rSTatWrcZd+q
         395g==
X-Gm-Message-State: AOAM530EqJ286cvPcIQP2aqESr47q/NQH8+8clKdIHOqyd1RvamVADXf
        Bm/283Wgz+PX8ag4yzj5LGpfZcwieRMGVgXJ
X-Google-Smtp-Source: ABdhPJxM2uGN/yxCMQGWV6ol3ZIv7Qe4j9qbNi9u6ENiSTDD8nxv0+g2vgnE9dyUy3XPrajOoBcYKQ==
X-Received: by 2002:a17:902:7086:b0:143:6ba3:9b27 with SMTP id z6-20020a170902708600b001436ba39b27mr56552962plk.60.1638158054682;
        Sun, 28 Nov 2021 19:54:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m18sm15712234pfk.68.2021.11.28.19.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 19:54:14 -0800 (PST)
Message-ID: <61a44ee6.1c69fb81.0e6e.b4bc@mx.google.com>
Date:   Sun, 28 Nov 2021 19:54:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc2-613-g4f1db50ca947f
Subject: next/pending-fixes baseline: 428 runs,
 1 regressions (v5.16-rc2-613-g4f1db50ca947f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 428 runs, 1 regressions (v5.16-rc2-613-g4f1db5=
0ca947f)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
meson-gxbb-p200 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...BIG_END=
IAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc2-613-g4f1db50ca947f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc2-613-g4f1db50ca947f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4f1db50ca947ff1ffb90da2471526610c954b3b6 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig              =
      | regressions
----------------+-------+--------------+----------+------------------------=
------+------------
meson-gxbb-p200 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...BIG_END=
IAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a42280727154bf8718f71c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-6=
13-g4f1db50ca947f/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc2-6=
13-g4f1db50ca947f/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayl=
ibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a42280727154bf8718f=
71d
        new failure (last pass: v5.16-rc2-431-geded04af7b26) =

 =20
