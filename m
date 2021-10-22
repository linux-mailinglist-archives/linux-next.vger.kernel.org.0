Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94432437968
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 16:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbhJVO6B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 10:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbhJVO6B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 10:58:01 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDE2C061764
        for <linux-next@vger.kernel.org>; Fri, 22 Oct 2021 07:55:43 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d9so3856594pfl.6
        for <linux-next@vger.kernel.org>; Fri, 22 Oct 2021 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6gXuSNEZ2ps8gVN9ZT0GEogKVakVzCNs2KOzJNyFS5w=;
        b=FfeNs2Fc7EYfmC3/xjjW4kh6EgTdCwLDjqueFCwoq7xA2nalhfOnr1ddiouopv7nMu
         qp1vw5QnrtLrOXDJ3dx0Zmv3hCIsllRsVFAgbTbsW2LK6aqGiaovGHzUAMeHYeaDcGNJ
         zJZWOd32UFgjch29+TsO0PnGj09UHFrCn4Nba8OlUoCpAAw03ttJ3OHezl0JxQWKbIyD
         cn3laa5bq1eujzV38VdMDS+0fS8iiK8g08+Z+CnKeJzR1r58qPsS3LLBrBB7o5no4l8r
         6Ms1fSnJrOQ35unAWuNuTbKJivXPiQer6AdXa4+YuAI27t/vM0z60T9goaqgiGWQFM4D
         Id9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6gXuSNEZ2ps8gVN9ZT0GEogKVakVzCNs2KOzJNyFS5w=;
        b=XUhfXy1VG5wk0krnkf5DQDFmHXTMQpT5qcdQ9cyv1ZThZHzB7dNG0ho6ldSDaT8OnK
         s5bKA4r4QdYhzCeRY580+4I/SoouA9tugcMHWJ7ACjqT1YukWeDemrB+1gNft4F5ukBD
         Faq0GU0FGrFgOmIHNgYLkV0OrOzjwOtdbNOgakBp/Cqz3iItvj5gX4n4phSIteIa3iSU
         ivOQuZIy4iKbpkErPcOg+ZtHA2hybMw9fhTPgifWD1qzJ0HPzoZSLKep9CG1PYpE8C3P
         GHUM1KIn+Tk3dFHh64yl42POOiYGymsPpMVfaiHc7WFRdH4guA6IQrkvn6Og/qRybImC
         KM/w==
X-Gm-Message-State: AOAM531ezXU2jsMkEtsiN0+KCsZzQNoVMJBQEPSAVxBVu/O32fPYpbU1
        Wd8SbzEMqQ8UVgq3eSMdvA+dDm69avZ7uLe4
X-Google-Smtp-Source: ABdhPJyn+0yhfX0JedGQUNdnSQ7YgrQliG7qXKxhwdJeDMBAlw+f/OKtb5Q6xBAKLv7hd08Sqj3N6w==
X-Received: by 2002:a63:f05:: with SMTP id e5mr180690pgl.226.1634914542962;
        Fri, 22 Oct 2021 07:55:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l207sm9775861pfd.199.2021.10.22.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 07:55:42 -0700 (PDT)
Message-ID: <6172d0ee.1c69fb81.21b2e.a2e9@mx.google.com>
Date:   Fri, 22 Oct 2021 07:55:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-rc6-297-g9344874edebc
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 384 runs,
 1 regressions (v5.15-rc6-297-g9344874edebc)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 384 runs, 1 regressions (v5.15-rc6-297-g934487=
4edebc)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc6-297-g9344874edebc/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc6-297-g9344874edebc
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9344874edebc5f4360a045cdef5e4ab3cf42e5bd =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | regressions
----------------+-------+---------------+----------+-----------------------=
-------+------------
mt8173-elm-hana | arm64 | lab-collabora | gcc-10   | defconfig+CON...OMIZE_=
BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/617297f2849134d14033594d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc6-2=
97-g9344874edebc/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc6-2=
97-g9344874edebc/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617297f2849134d140335=
94e
        new failure (last pass: v5.15-rc6-265-gc48af0f39374) =

 =20
