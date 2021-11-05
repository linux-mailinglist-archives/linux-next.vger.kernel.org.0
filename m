Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B03445FAA
	for <lists+linux-next@lfdr.de>; Fri,  5 Nov 2021 07:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhKEGUL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 02:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhKEGUJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 02:20:09 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5C0C061714
        for <linux-next@vger.kernel.org>; Thu,  4 Nov 2021 23:17:30 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id j9so7597462pgh.1
        for <linux-next@vger.kernel.org>; Thu, 04 Nov 2021 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=40IFsXBNxGkQMBbPUYU6my0Mc4BiVKEJumQBuYWuRNI=;
        b=V9fiJu9kgizN+vUzKQ8MY1LAQM6A9eBQBY6XIc1hhZrWJEww6lvBolXS3upRFsZNQt
         XyVJA9hUhmpDBi0qAwYNsFcr6LphXYEdC4uqU4+OEwOyfCljh3SsjAYQ7ftH4xjz6gcr
         Y7Gj1rqGF2kO2OvR/au3R1wZ99gDyBLY6DzBjCLdsRpWd5XDXroHq6lIdL9Uixc4i2Ax
         GzzF2loFWCvo+BMw60SXahigsDOLmhJ68qUBxXW4wEoWTrVP5H+KFX/VPvJeXe0/+8du
         C0CKPYE1Xg+iyZETTrbrnkUvE0dN21o4qrRX6+/rNohkUTvvycA+PcHptoYf6sMJHUA8
         jeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=40IFsXBNxGkQMBbPUYU6my0Mc4BiVKEJumQBuYWuRNI=;
        b=NOjvBJeIpYNaV9ZMcLDsPNx23yvJ4Uy3o6q/JcoTwE7CXZFU/PyrDdBw3HFFcMABKz
         MG57DhFJHbOJSdu8JJIqAA1joWQHGblzaHl4NPhvr4oobk0q15r3ZMRbnwRwpLwDY10V
         z2Xh92oD3MsssbH8Y8Xb3rxqcYECuERKBY2rA/0Xjs2Xx9m5Tpd0z6biGfwB2GguKMge
         JbY+ECstAS1NsZqtV3lwYJTqJNBbRD//UFl46GXOgcBZEJpFECYmRzTxNqz+VuIGvS1w
         fKU25x90H9VR6L1tNu4wdbIpoN7LC5U0s6CmEYG9ssy+RbPS2AJ8P4l1xKnE+U2qFE36
         7XJg==
X-Gm-Message-State: AOAM531dr5j0Acu1lW0qimplQig0RbYbxyu84UoUSG2JYgpvHp7jvmt5
        u4ldcb/C2CnrcJbdXkfWDZJtEvn08s+l6mfi
X-Google-Smtp-Source: ABdhPJywy+WYDRYRKXzt3UTMCVM+yrhCTdpHZgQjn/7byGusNzDn+Kb0Korp4x5L6sK5GxBJ3hm1qg==
X-Received: by 2002:a63:6c44:: with SMTP id h65mr40008827pgc.423.1636093049683;
        Thu, 04 Nov 2021 23:17:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d17sm6308367pfo.40.2021.11.04.23.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 23:17:29 -0700 (PDT)
Message-ID: <6184cc79.1c69fb81.11afa.5f82@mx.google.com>
Date:   Thu, 04 Nov 2021 23:17:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-10251-g42298a382ab9
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 399 runs,
 1 regressions (v5.15-10251-g42298a382ab9)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 399 runs, 1 regressions (v5.15-10251-g42298a38=
2ab9)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig        |=
 regressions
---------------------+-------+--------------+----------+------------------+=
------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto |=
 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-10251-g42298a382ab9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-10251-g42298a382ab9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      42298a382ab96bf39f529d88eccda07ee0048436 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig        |=
 regressions
---------------------+-------+--------------+----------+------------------+=
------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-10   | defconfig+crypto |=
 1          =


  Details:     https://kernelci.org/test/plan/id/618496acef7f86ae5b3358e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-10251=
-g42298a382ab9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-10251=
-g42298a382ab9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/618496acef7f86ae5b335=
8e5
        new failure (last pass: v5.15-7822-g1fca2beef9c6) =

 =20
