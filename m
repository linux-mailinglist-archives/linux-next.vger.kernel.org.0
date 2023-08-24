Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F45786745
	for <lists+linux-next@lfdr.de>; Thu, 24 Aug 2023 08:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239874AbjHXF7c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Aug 2023 01:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239912AbjHXF7G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2023 01:59:06 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6917510DD
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 22:59:04 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf6ea270b2so29651945ad.0
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692856743; x=1693461543;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpg8wpdrj6zbvhic2EGTbX8Y3Y3OX7hQ5WPbXJJRvUc=;
        b=qIPTm+lse54KGONFxWK2xyGhsTFZN0JscRAGdnqJQ9I10uQcre20axglG0Kyr9NOK/
         x8tM6+cAcaazZbuTOg5Xz4DV2hNX0uopdCUordNXfatDgz+2Zw26xhlCb50eRh40RyA6
         FPkZC6RXLqQZSlKSqLJbo9BTz7pTKEyRVCASMdZqjogzyEEp8PKzieX37B8bF55Gy6qt
         FJj3tHHEmn8uqxIrr/qFBmXZ+U/EoqiMRBWt/uP8VEjIDiQGKyp3tgPrsiEdOtYA001R
         +7O54svUmU+i2PtMqdI+SsHedZElevg1j/xMwdwQerQNV4Fkv5kcpbQXS+ZSMOrvDaRv
         ASPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692856743; x=1693461543;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lpg8wpdrj6zbvhic2EGTbX8Y3Y3OX7hQ5WPbXJJRvUc=;
        b=K4PeR/dhsa/wJ1ez66/CP/z1IybHaefD9ZtBEzG77QyKvuvVgYV9GOpJIR/KxG9xtw
         mWNIHSUiLBqxAdbRyOgp9OBWtX5YTRfEFYwUeb8jzv8uQ8MPjHFEcn9Kdjl9grCw4heT
         rDPuVDF4CHsizcWAN26FNakgCcLFApEqk+Nw+d0BSJ2saEywIIwmP0wkQ32sUK9PuTIh
         JXh3FUAnFMtlwBYUqMESSHUD6nFUBYV1hw4G0x0iVGFJdHnblQsOpLJXiA9kyQ/sahjt
         UC/iP8ImSFEcb2VsVr0QBfSnXKdEB9T5vIiQqBa0SZOCiTiDIyWx62qulaQpw4dETfRW
         aQxQ==
X-Gm-Message-State: AOJu0YwUlo1JURNdkAS/0jUPwh2l3QgXIzJcmyI+dTcU2/MyL9V67iNO
        JjjnuwL3+3Qj2KPYYQ1Vl88HITJYG32cdlfzdaw=
X-Google-Smtp-Source: AGHT+IFlnqTQhU4nB554Fwl2ZA4sv4cfjhsueRcuB2H6bxE7qtw9UgBt+cGu5Gd/ge9pv+kpwo1kXQ==
X-Received: by 2002:a17:902:d503:b0:1c0:b75f:85f8 with SMTP id b3-20020a170902d50300b001c0b75f85f8mr2941598plg.3.1692856743519;
        Wed, 23 Aug 2023 22:59:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j15-20020a170902da8f00b001bba7aab826sm11845512plx.163.2023.08.23.22.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 22:59:03 -0700 (PDT)
Message-ID: <64e6f1a7.170a0220.42c01.8384@mx.google.com>
Date:   Wed, 23 Aug 2023 22:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.5-rc7-184-g896c392cd4bf1
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 60 runs,
 1 regressions (v6.5-rc7-184-g896c392cd4bf1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 60 runs, 1 regressions (v6.5-rc7-184-g896c392c=
d4bf1)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig | reg=
ressions
------------------------+-------+--------------+----------+-----------+----=
--------
k3-j721e-beagleboneai64 | arm64 | lab-baylibre | gcc-10   | defconfig | 1  =
        =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc7-184-g896c392cd4bf1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc7-184-g896c392cd4bf1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      896c392cd4bf1827d8c56a0ee5c9e7fef76f7e19 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig | reg=
ressions
------------------------+-------+--------------+----------+-----------+----=
--------
k3-j721e-beagleboneai64 | arm64 | lab-baylibre | gcc-10   | defconfig | 1  =
        =


  Details:     https://kernelci.org/test/plan/id/64e6c19821cb9d5a0eb1e3b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc7-18=
4-g896c392cd4bf1/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beag=
leboneai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc7-18=
4-g896c392cd4bf1/arm64/defconfig/gcc-10/lab-baylibre/baseline-k3-j721e-beag=
leboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64e6c19821cb9d5a0eb1e=
3b2
        new failure (last pass: v6.5-rc7-128-g0b86d65557b6f) =

 =20
