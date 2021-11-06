Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93D5446CF8
	for <lists+linux-next@lfdr.de>; Sat,  6 Nov 2021 09:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhKFINX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 6 Nov 2021 04:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhKFINX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 6 Nov 2021 04:13:23 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B08C061570
        for <linux-next@vger.kernel.org>; Sat,  6 Nov 2021 01:10:42 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p18so12445460plf.13
        for <linux-next@vger.kernel.org>; Sat, 06 Nov 2021 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZwS0BnjlzxpqNTJPRdvPb/ylxWwj2PxCQfYOjZQQ+0E=;
        b=GO4SRoWzXdbK8uXy4g+VECc+EQwiw+69d+hPpJpqJP0nxLBQfNpuL+1IH2CLpq1kMf
         UOlZHGilX5kLAaA3wC2CKk/3cH6trI4b6DGEzVQb/BR7nNjTpGucCaF20/ROa1+DbRo/
         gwZ0RlrAgUvzkuk0UkDUP+8uPwdWvW3sAu0h+u0BoKSy0vg9HMd4bEd9c14s7r0i5kZS
         fS5MowWNOgqAXk1GEsKnCh2FPdD1c0O2+p8FtfJlWh7iwT0Yp2S6DUkXB9KEelswgftx
         E6Qul4hG6qyXZC2MyCAzI6rFLHFgALuAWtVV2YYYhD8+Gt15AQ1Z/GP6fS9bBwzcsV2t
         jm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZwS0BnjlzxpqNTJPRdvPb/ylxWwj2PxCQfYOjZQQ+0E=;
        b=2/5Np86QF9gTfnJHofRYkzqZKLMYQe8mztcsd6mWWxvqufh1oFAHNS8LDFFS6fLALl
         UcsKmt1AT5XUEn55rTu/wyckHHdeIGMua7Ei/6RmJ6ALWTUVRd31zCyzBLBiOWjd5oSx
         enR62zSv13nkly3SycCpWwg6wTbnEcv3UQHH+g1qEUqOBgyhYeeMlBWS27FIZSF1Qic8
         ns0xU4wxqNlr18OphqRGdsiec60aZmuryCZ9boEE8QJHk4HuqAvxIRsteXhlqhO8k3nf
         Qj+EE/uoLADgiDsCx5+LQrjRGghxixZuh/KOpYBXU8CTqGapJy/pEt6IhaOJMrDxrQtm
         oirQ==
X-Gm-Message-State: AOAM532PBKQN3Ac638SehSnbw659Dm3+19cutAOBzp6StVUSyhSKfEi/
        +KjuzsysGh+DW8B0xE/QW3rfbk7XvTWiVP3I
X-Google-Smtp-Source: ABdhPJwF2LQPXMmGI0NDnl8dnWZM44yC/3/qOluIhT56ZvimDCtPMLR2fJXYW/66NI46Iz0B2gyWzQ==
X-Received: by 2002:a17:902:c412:b0:141:f710:2a94 with SMTP id k18-20020a170902c41200b00141f7102a94mr34251060plk.1.1636186242062;
        Sat, 06 Nov 2021 01:10:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x1sm9531050pfr.148.2021.11.06.01.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 01:10:41 -0700 (PDT)
Message-ID: <61863881.1c69fb81.bb6dd.dd19@mx.google.com>
Date:   Sat, 06 Nov 2021 01:10:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211106
X-Kernelci-Report-Type: test
Subject: next/master baseline: 808 runs, 1 regressions (next-20211106)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 808 runs, 1 regressions (next-20211106)

Regressions Summary
-------------------

platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211106/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211106
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6a37ebbe07bf72cd5fd791d67a664f37c8f17a13 =



Test Regressions
---------------- =



platform  | arch | lab          | compiler | defconfig          | regressio=
ns
----------+------+--------------+----------+--------------------+----------=
--
beagle-xm | arm  | lab-baylibre | clang-13 | multi_v7_defconfig | 1        =
  =


  Details:     https://kernelci.org/test/plan/id/618602ee2bf14619ed335925

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211029101439+08e3a=
5ccd952-1~exp1~20211029222017.20)
  Plain log:   https://storage.kernelci.org//next/master/next-20211106/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211106/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618602ee2bf14619ed335=
926
        failing since 9 days (last pass: next-20211026, first fail: next-20=
211027) =

 =20
