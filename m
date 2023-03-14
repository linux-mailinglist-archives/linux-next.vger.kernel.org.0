Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC336B994F
	for <lists+linux-next@lfdr.de>; Tue, 14 Mar 2023 16:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjCNPb2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Mar 2023 11:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjCNPbM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 11:31:12 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A261E1C7
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 08:30:27 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y11so17016120plg.1
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 08:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678807826;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9wNnZicZWo4QxENizOqcBu9Qr1rNU8/lC6obDjQRhE=;
        b=wWe99sB4WODOt9uHllJfNmhY1TR0n/aweoVeZVVn94uQDtS/PMnGHhPsnNprTd14uO
         HqNH9wZtUrwxYwk9QeveIr3dvtsBJDf5KQaJ+v+HA6l00ybQG5EssPfZwX1RqxvBbTR1
         RQ18rRxTKZAABirkNyJdBnpKm9JsfzwHAxcVkbPGIuBusV8UUg82wH8qda/V0CPYvA78
         eJUO0Bmby99pkFlywc9J+HEbLhJMk1xauMZB+HpfVxwFQOYoXGvMyPK8FOlfhY33uvlm
         lT1a/09aRgpZTx/172re8Gwhn7OgEwdNi2JEflhQCQA/qHJ97fk7zpL+SLuyJPxEDOTM
         zVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807826;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9wNnZicZWo4QxENizOqcBu9Qr1rNU8/lC6obDjQRhE=;
        b=vg68gD5N6TtuHpBFF2KBhw3Dm596duY/ZGmrRVPfQi4l6v9Pcd+OaBWcUrrj0N6NBv
         zBBHkvUEwUtPHo5wP4XRmoxueja/ytq6+6V+Xj7Z4AVPJ3tKYbhccBTEBhEOzG2XGA8+
         X1wO4AqUPz7wXJ0/hme6YVAsTf4JDZi6hWxoCJJ5zieufKleqvSbUXsWjw9JXiXaYIqj
         Z6x6JvYXHc2qxk3vEM+7KiSTimLhgt2nnyDOPx/rt4rA9nY1G4/5qRA1bNyIyLRZinIS
         zh3BQwVMTp2udbqtso4OMuXWTaZZYpLTNDOwshxAWPSZV2K/Ly1oIadExtZ6y0V+Gzge
         /9Rw==
X-Gm-Message-State: AO0yUKWFlkk6cfPMy9wVTy+RMI8a74fAj5JA554cPtikpFPyFkuqpu4I
        VFcxAR/FG44YoaKv75SS0NY7QprzdbqVVf8JMrxX2w==
X-Google-Smtp-Source: AK7set8JMBD7VND+QdBlFFmyqq1g2AmTzFod1sHcAuoJkRJ236QQHu2hqKHCfV14ATVJ4csEHmnYSQ==
X-Received: by 2002:a05:6a20:c502:b0:d5:e5e2:36ac with SMTP id gm2-20020a056a20c50200b000d5e5e236acmr303232pzb.19.1678807825919;
        Tue, 14 Mar 2023 08:30:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f21-20020aa782d5000000b00592626fe48csm1747008pfn.122.2023.03.14.08.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:30:25 -0700 (PDT)
Message-ID: <64109311.a70a0220.f80f1.3b6a@mx.google.com>
Date:   Tue, 14 Mar 2023 08:30:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230314
X-Kernelci-Report-Type: test
Subject: next/master baseline: 106 runs, 3 regressions (next-20230314)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 106 runs, 3 regressions (next-20230314)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230314/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230314
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ec0fa9a0a6fac454745c930bdb8619d0a354bac9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/641062eef817d3ddb28c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230314/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230314/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641062eef817d3ddb28c8=
631
        failing since 46 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64105c275b5c4215998c86b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230314/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230314/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105c275b5c4215998c8=
6b9
        failing since 49 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6410624f679ccf9c058c8685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230314/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230314/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410624f679ccf9c058c8=
686
        new failure (last pass: next-20230309) =

 =20
