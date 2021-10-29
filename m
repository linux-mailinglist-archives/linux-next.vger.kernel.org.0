Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F2B440043
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 18:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhJ2Q1C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 12:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhJ2Q1C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 12:27:02 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87225C061570
        for <linux-next@vger.kernel.org>; Fri, 29 Oct 2021 09:24:33 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id l1so3286485pfu.5
        for <linux-next@vger.kernel.org>; Fri, 29 Oct 2021 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZGGel7nf+5saJMqTE07Jb+qe11pQV3zGKp1/z2crnNc=;
        b=XWqV4kowkedWMWPT5j3UDl+9eT8hTv3jevpgL+nHpTtWDHtyr5PVx9rs6oaglqY4qi
         6oDBFXvy4C/0xQzsSM3tBYY1J1sriYF9k2VD4vRpDJVyYH3Xg2nEmfKiVFFD/tPIOqcu
         KLG1/X7nGwMShCOaeGxxpv9geG/lLItIdA1EAlkacT2oeBdxxSSfpY+G3n7J15m/jIw0
         m+uMxyBAYY9HrpkonfjCYe76iYmzWbYDFd8CHt7J36flWw1jjdelkoFGwz2a/0xqQd5B
         Tn9HlgSnar77EHKqizlWMyS5yVHfevOhKVUeSm+u9FFkiGE3Z+EX/BU73tmTYx35bORQ
         I1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZGGel7nf+5saJMqTE07Jb+qe11pQV3zGKp1/z2crnNc=;
        b=ChkodkFlFdv0+u642cFxuAToQqCxsUNGjY1IFxOxztJr3qKyL/SRA+5DDzJ0vb23iR
         yQi/99ss160ngLvjeGMAgxALUXkctxs/Xv+TLXqgtSD7O0BU8yaQzkP6kVIR+XIJ98sy
         100LYFsAbmgXE+rThiKle2oc+5n907D/p47vqT1ZSUeFH7rDRuf3v1mNRtMIZkIsPAvd
         gcyQXq8zVPEzDTOrwCB9ASJQQswhmYoNjWGXMnSRNHl1XF3V1TpeP+V0gN/R3QKHd71G
         0iiP+g4ia7U1CLsVtd6cMvFpO8s3sEUiCbGngvH1d0LqT4EGgQjhOTHpZFRD1rzp7DeX
         UUCA==
X-Gm-Message-State: AOAM531KtQgVtYLxfvY0S0cR8k32X9oKn4ffd1d9wAlZz+uSostuRxaI
        q2uQsUIlgznAospQbJ4ku8kP5fSa4291c8EC
X-Google-Smtp-Source: ABdhPJwQEg8BAtrQAodDJvlvXo2qG98Wc/LkjcUPxJ/+KzYXqQJVu/Niv0WpN7G0HXuFQp68vyqGvg==
X-Received: by 2002:a62:844b:0:b0:47b:eb1a:4afc with SMTP id k72-20020a62844b000000b0047beb1a4afcmr11914802pfd.73.1635524672961;
        Fri, 29 Oct 2021 09:24:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c20sm7746908pfl.169.2021.10.29.09.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 09:24:32 -0700 (PDT)
Message-ID: <617c2040.1c69fb81.450db.5afb@mx.google.com>
Date:   Fri, 29 Oct 2021 09:24:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211029
X-Kernelci-Report-Type: test
Subject: next/master baseline: 316 runs, 1 regressions (next-20211029)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 316 runs, 1 regressions (next-20211029)

Regressions Summary
-------------------

platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211029/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211029
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bdcc9f6a568275aed4cc32fd2312432d2ff1b704 =



Test Regressions
---------------- =



platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/617be7ff16226a882a335933

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211023125221+73dae=
b3d507f-1~exp1~20211023125744.17)
  Plain log:   https://storage.kernelci.org//next/master/next-20211029/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211029/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617be7ff16226a882a335=
934
        failing since 1 day (last pass: next-20211026, first fail: next-202=
11027) =

 =20
