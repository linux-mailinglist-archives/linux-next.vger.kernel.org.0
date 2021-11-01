Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D644412CD
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 05:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhKAEub (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 00:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhKAEub (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 00:50:31 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57083C061714
        for <linux-next@vger.kernel.org>; Sun, 31 Oct 2021 21:47:58 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id r28so16228646pga.0
        for <linux-next@vger.kernel.org>; Sun, 31 Oct 2021 21:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=h1rW+2/2F/ViqgUIePB1csQDkKAmnepK70dHbP5T+2c=;
        b=fG9bSH+EJa+3cFaTh4dz4AvERGlBpLnRbNn5ApHuUSSfkM2Zth3xXwleAKvCCzmbdF
         nfp32ljc+Zo9Hu4k+m6wJmyIocTQE1BKC//PfM5dYQvTIbgspCDQek0Hd42kg/LKobhR
         CR6bG55SOgyolbgF++UBHxdmIdHx5DZPtxQxreWPuWFy/fjr87Fch6MBSTMQzmtr79R/
         7Pm4ywwII4gid0wq6O7AP1FuNQ7UHUlWm0QNkkSLo6yVj3WKm7vH3xgY7kfyKHJvoDkW
         F6aSQ4hnT+/PhY9+68szFaflvYetZuNN3rVLPiYZBSRswD3EFTINEKFC9GX2GyWptzM5
         h6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=h1rW+2/2F/ViqgUIePB1csQDkKAmnepK70dHbP5T+2c=;
        b=hi/inGCJL8NXEqpPyEObX2EAKtjgFjHyrAG6aA3KIrnKpExlOCuBQ8zaKVHPresG7z
         h37Yd6tjS1oj436aqiG8L7a50YRMrlM5LjCJsibpiilj+2MyQd+r7zz6DhMqJgJ6lzZJ
         or9hR6HP4IktZrxnb9983HL8GOUuOAte0PrVfohqy5CoITUBsUyqJjKx7hXQyulMrfDz
         sFlFvsPPXefuZBYXb1Y7BDnT/BS1mL6PcokdKJHpsVJqX/bnvbZbSjkqeeYyyBjiR7bl
         Sr8htMOdFLnEkaurAgf6OaCiy58TQdUklLBTI10MOMV5BdmzW+zgpS9jDcMY15cSZ2hV
         /QNA==
X-Gm-Message-State: AOAM530hlwhHXC4vn8qI44c5rI0sTKLD1p0MKT6+pBPH0fckFcGPuHOI
        LIJldUHwraszFXwAlccDrUdi65dyfmgyDJ6t
X-Google-Smtp-Source: ABdhPJxeke6IOhXRP7BJNEUG3ptRPrHZs1reRuvJSSFhdyBT62fdw8aU1CSVj7Op5oYm9WLVnrYIdg==
X-Received: by 2002:a62:9282:0:b0:47b:d0e9:a3c4 with SMTP id o124-20020a629282000000b0047bd0e9a3c4mr26363278pfd.12.1635742077472;
        Sun, 31 Oct 2021 21:47:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m15sm12089539pjf.49.2021.10.31.21.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 21:47:57 -0700 (PDT)
Message-ID: <617f717d.1c69fb81.30e3f.38a2@mx.google.com>
Date:   Sun, 31 Oct 2021 21:47:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.15-388-g75f097aa9969
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 413 runs,
 2 regressions (v5.15-388-g75f097aa9969)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 413 runs, 2 regressions (v5.15-388-g75f097aa99=
69)

Regressions Summary
-------------------

platform      | arch  | lab          | compiler | defconfig                =
    | regressions
--------------+-------+--------------+----------+--------------------------=
----+------------
rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BAS=
E=3Dy | 1          =

rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig                =
    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-388-g75f097aa9969/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-388-g75f097aa9969
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      75f097aa99691fa885771a1d2fc5badc231aee61 =



Test Regressions
---------------- =



platform      | arch  | lab          | compiler | defconfig                =
    | regressions
--------------+-------+--------------+----------+--------------------------=
----+------------
rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig+CON...OMIZE_BAS=
E=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/617f34c0bcc5b410153358eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-388-g=
75f097aa9969/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-388-g=
75f097aa9969/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/=
baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617f34c0bcc5b41015335=
8ec
        failing since 4 days (last pass: v5.15-rc7-176-gbfbd58926fc5, first=
 fail: v5.15-rc7-202-gc79631111e0b) =

 =



platform      | arch  | lab          | compiler | defconfig                =
    | regressions
--------------+-------+--------------+----------+--------------------------=
----+------------
rk3328-rock64 | arm64 | lab-baylibre | gcc-10   | defconfig                =
    | 1          =


  Details:     https://kernelci.org/test/plan/id/617f3bb4dce48a1d41335967

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-388-g=
75f097aa9969/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-388-g=
75f097aa9969/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/617f3bb4dce48a1d41335=
968
        failing since 4 days (last pass: v5.15-rc7-176-gbfbd58926fc5, first=
 fail: v5.15-rc7-202-gc79631111e0b) =

 =20
