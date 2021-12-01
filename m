Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CDC4644DE
	for <lists+linux-next@lfdr.de>; Wed,  1 Dec 2021 03:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241292AbhLAC33 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Nov 2021 21:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346092AbhLAC30 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Nov 2021 21:29:26 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585A1C061574
        for <linux-next@vger.kernel.org>; Tue, 30 Nov 2021 18:26:05 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso19837754pji.0
        for <linux-next@vger.kernel.org>; Tue, 30 Nov 2021 18:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p+T/s/A0Bb7ideIxi4HnU0n1FbcLj4pGMm6bWjeYUWw=;
        b=5CRThis0ifM15sW/Zsd0ZLMtkRGO45myNoXx+5/ED11AyPOaU7XAuQsPE9oulNG6v0
         wXcQ9BfmQ0q7P7B3oiMZYUgqeWhF82A1mns7qr9wTzQhd1hG3TEBm6qpL3RMS7JOsUEC
         TD6ofVqh3E1C/ztxcntr/fWZzUbpnveqxK/sEvuhPMUNvbfA9FekmKqYxuGRJnfCYDID
         QVM8PpijKdmBqnpAOmQ3UcQMslG/77jGWpGjDdCzubkFrYtxCmmbYjchwbRQ6N6Cx725
         UISWol5ylWxhfp6GqM2CB/O0QZX0Qf9d7p9NbFcWya2vefpbSMCI8PZUxqUwy3/alNRh
         CuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p+T/s/A0Bb7ideIxi4HnU0n1FbcLj4pGMm6bWjeYUWw=;
        b=VNTCM1MPUHUiiN3c/HO2wI3au01ioARVmD46XMcvOPEmxtBdk+4SJdC3ZErvbnTzd4
         hU+8L2+OhAz7iFDIKRtxnNagTzp8RiMiciU9c/StTe5fYhWXbLTxAxSRJSwIIwimF1kU
         ASIaQJrAsKkWPmU6S7It0qusUt9M/39eOID8lTTLBEMnAUCzHmEyzgQ/9+QP1GCUqNQv
         LwKwiho7z2x4QGGy/9+KWOjzIHY3178RM1tKm+4g/JFzqFxeojMYY59DdS0Mc9bJtKSY
         L/HgElbSyXhXElczMTRoJ/sZxGiOnSvwepDyrqir+Dlwc2oQPxvzial7Hy343ECuMmJN
         C3pw==
X-Gm-Message-State: AOAM531FgVnTeH4p4uk5o04yUI7bFgN8f7xM10DH3iTI/jUS3yUKkRMB
        /eCsTuRvzCt0uEasBv3xqriXBFYwi5pR+IIz
X-Google-Smtp-Source: ABdhPJx5zItcVwG3f0xeGF4Qd9l/BDun98NkAouRVF8lFgChZnzPrhbnFY9MrXDI63/Zvl9sJGhx9A==
X-Received: by 2002:a17:90a:eb03:: with SMTP id j3mr3609031pjz.149.1638325564767;
        Tue, 30 Nov 2021 18:26:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mu4sm4394757pjb.8.2021.11.30.18.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 18:26:04 -0800 (PST)
Message-ID: <61a6dd3c.1c69fb81.156e4.d620@mx.google.com>
Date:   Tue, 30 Nov 2021 18:26:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.16-rc3-294-g1df8f9137669c
Subject: next/pending-fixes baseline: 305 runs,
 1 regressions (v5.16-rc3-294-g1df8f9137669c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 305 runs, 1 regressions (v5.16-rc3-294-g1df8f9=
137669c)

Regressions Summary
-------------------

platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc3-294-g1df8f9137669c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc3-294-g1df8f9137669c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1df8f9137669ca06141f13e591960c0b860a7b06 =



Test Regressions
---------------- =



platform        | arch | lab           | compiler | defconfig              =
      | regressions
----------------+------+---------------+----------+------------------------=
------+------------
bcm2836-rpi-2-b | arm  | lab-collabora | gcc-10   | multi_v7_defc...MB2_KER=
NEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a6af6ac92da911bf18f6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-2=
94-g1df8f9137669c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc3-2=
94-g1df8f9137669c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a6af6ac92da911bf18f=
6ca
        failing since 20 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =20
