Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8E27EEB20
	for <lists+linux-next@lfdr.de>; Fri, 17 Nov 2023 03:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjKQCgS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Nov 2023 21:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjKQCgR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Nov 2023 21:36:17 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88452CE
        for <linux-next@vger.kernel.org>; Thu, 16 Nov 2023 18:36:13 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-581fb6f53fcso858121eaf.2
        for <linux-next@vger.kernel.org>; Thu, 16 Nov 2023 18:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700188572; x=1700793372; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mSZ4qyIvT4x+Lax+TwB8r6HfzRYsRiVzeUWV2Zbj2ng=;
        b=GVEffUN96MJmh+nUjCUOJG/JwrFlwd6HIXG3cWE82wWo8wNUrvZlY2pleP35Xh5kql
         VsciMJU0TwCWjsdckcrFEoE8nprekXWie5DQLhORXWAHHcwe/DEqRbjToslpXauncriW
         E3SqOZW+N5mQbiWiNtW5QhwEwJg5j5F58VvRsjX1DsRTd1PNaHM0msq51Es/M+1S110o
         5sBQts5pOlJZIg/9c4Ur8MP/3uGcvdJT1S5IRd0fkIhhj6vYInUTWnxtIKpC7PCishEZ
         6f9QxxMqnZ111dJev3CoC0OpiTCTyHitnF2YL78OPf/aMEBFhBmwW1jBmyCm5prRV3Dx
         6ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700188572; x=1700793372;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSZ4qyIvT4x+Lax+TwB8r6HfzRYsRiVzeUWV2Zbj2ng=;
        b=TnQyyyb4Nw5b4uLtpYgP3l7pBuO3gVagC7bd/U6WYkqFsPdGZw0ugq16Zj5dh3Npyr
         QRsa3X3RAvmGmn9TOO9/7wGAbSBgRKyR8hQ8DEbxBwmcd/mU4ywtVu9gGMCmP2GRvnHl
         5ksvAtEt4OARgfe2oOhkBN1cVdsKkZhh2wudAxGXEOxy/d6sRt3aiB6OpGZFgOIlYtVr
         mn1O+yVt0lPKhDr0+eLcGYTuq3gYLV0y3/kDnpZ7O91awdUrkoEG7no9wrsPH6Y+8tCG
         5UKuAzGH5JZAy9+rRGPhS6dDjf5ThlGv6fIgC3MOKm36Eak2aSYhZoUfs3Us7w9cGfwW
         6/AQ==
X-Gm-Message-State: AOJu0Yx/LylA67QKqbsbvVeK/NUG027Ovq215GkTvAbrpmXw5bpR1Vhx
        HVnAnf1I+ArZeo9zRB0TOrqqRQx7i+tpe9CY9ag=
X-Google-Smtp-Source: AGHT+IFbeBMvqm8VGDAf6mHy+erEIS3AgjH6jUvJ5cvAMRc+2++/wZKi5oFetXqKHu436j5Z5yYYdQ==
X-Received: by 2002:a05:6358:7e02:b0:16b:cd54:e5c7 with SMTP id o2-20020a0563587e0200b0016bcd54e5c7mr13104150rwm.14.1700188572356;
        Thu, 16 Nov 2023 18:36:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k25-20020a63ba19000000b005b944b20f34sm310081pgf.85.2023.11.16.18.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 18:36:11 -0800 (PST)
Message-ID: <6556d19b.630a0220.fe1f1.146b@mx.google.com>
Date:   Thu, 16 Nov 2023 18:36:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-251-g1da100f819fbe
Subject: next/pending-fixes baseline: 107 runs,
 1 regressions (v6.7-rc1-251-g1da100f819fbe)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 107 runs, 1 regressions (v6.7-rc1-251-g1da100f=
819fbe)

Regressions Summary
-------------------

platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.7-rc1-251-g1da100f819fbe/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.7-rc1-251-g1da100f819fbe
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1da100f819fbef3f6f1982cd0e448694e6ef2956 =



Test Regressions
---------------- =



platform         | arch | lab     | compiler | defconfig          | regress=
ions
-----------------+------+---------+----------+--------------------+--------=
----
beaglebone-black | arm  | lab-cip | gcc-10   | multi_v7_defconfig | 1      =
    =


  Details:     https://kernelci.org/test/plan/id/6556ab3d1a144fa34e7e4a6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-25=
1-g1da100f819fbe/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.7-rc1-25=
1-g1da100f819fbe/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6556ab3d1a144fa34e7e4=
a6f
        new failure (last pass: v6.7-rc1-127-gaea4a488542f) =

 =20
