Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1891F75C746
	for <lists+linux-next@lfdr.de>; Fri, 21 Jul 2023 15:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjGUNCz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jul 2023 09:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjGUNCy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jul 2023 09:02:54 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0392186
        for <linux-next@vger.kernel.org>; Fri, 21 Jul 2023 06:02:53 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b9cd6a0051so12899195ad.1
        for <linux-next@vger.kernel.org>; Fri, 21 Jul 2023 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689944573; x=1690549373;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ALs8zeYZdY5dOMDZFZiCswnnmmqssAms0f7vH1+DJ9A=;
        b=QwIHPbQpIrHUjtjNRwZaArmseJI+mBnY3HQGqJeMmT5slkjBSRIeoJ7XAVk0RqrJ13
         Wi99cJis9dOTj0vvilou0cGPX6iqQV+pydSBI3MW3vvVLg3uOhsGguDzd+oJUTnyeDBv
         6Vq1ORecOHpJbkmPZjX2zR9z5u3alP4/RmOfUJ1fQQ4y+jn/aLoh4BBL+2dypjfg7neC
         omAbsz+ksRFpmtaxMrqLZIq70QlOSehaz9MCcMmXvrXiZf3fMoD33zESHUtSjTNalf/A
         a0dC0b4r8724AY/HmcD17O0onHHzAJpoMpnTL9DCNbY3nw+ycbEAB3FP3VBhrJhI64Pt
         pS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689944573; x=1690549373;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALs8zeYZdY5dOMDZFZiCswnnmmqssAms0f7vH1+DJ9A=;
        b=BGvYoyzH6S/fXD/iEcNXpFkeVRnXrOvTuhKiURcX+kAoq5ejihb8PqGDVMJ7hFXCjr
         xLHc0fo18y/sGlVqPzdcOsy9Es1fbvFUMQB2vGtI8FpO7NA56yeL1QW+anjMegPtVGo8
         Kbl/OOnURs4RoCCgsVkn7qk/7pynFIqpgv4FrRVOkojP0N6h9cVm1nDIdOx7A96nxY+0
         mWLs182d1T7+FAGfnSYxcH/N8sJfNJoDIgsetPjDPB4E34d0eLUnJDQHhx+fvW6IShbw
         d484kyMIdL9qbIYPmS80pxIBjxrwF31WQ3OCi6ZUFC4ChbT2rO1to3u9lcK1c6UYmwV9
         bLIg==
X-Gm-Message-State: ABy/qLarp1cXk1TQiBjgEXFYTHCukwXwR1KRqz3aQgzG4ixAVUEcjvc5
        fDY6KtHrxFyq6Ik/UOul85s17Jb01SL+bIWnHsGdIg==
X-Google-Smtp-Source: APBJJlHtO20TcEXO8Dpu6r8U/uuOTNj1lK+ZP9RUpA+CJ2Qn43Bn2akJQUVDahFGhZ8hzgeLbRQPAg==
X-Received: by 2002:a17:902:ba91:b0:1b7:ed6a:d8a5 with SMTP id k17-20020a170902ba9100b001b7ed6ad8a5mr1280614pls.61.1689944572613;
        Fri, 21 Jul 2023 06:02:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001b89d9a58e9sm3416102plg.132.2023.07.21.06.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:02:51 -0700 (PDT)
Message-ID: <64ba81fb.170a0220.21b04.6104@mx.google.com>
Date:   Fri, 21 Jul 2023 06:02:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230721
X-Kernelci-Report-Type: test
Subject: next/master baseline: 71 runs, 1 regressions (next-20230721)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 71 runs, 1 regressions (next-20230721)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-chromebox-cxi4-puff | x86_64 | lab-collabora | clang-13 | x86_64_defco=
n...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230721/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230721
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ae867bc97b713121b2a7f5fcac68378a0774739b =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-chromebox-cxi4-puff | x86_64 | lab-collabora | clang-13 | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64ba4958ff9569fc298ace26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230721/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230721/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-chr=
omebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ba4958ff9569fc298ac=
e27
        new failure (last pass: next-20230718) =

 =20
