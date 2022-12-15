Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5C764D960
	for <lists+linux-next@lfdr.de>; Thu, 15 Dec 2022 11:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiLOKQx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Dec 2022 05:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiLOKQg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Dec 2022 05:16:36 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BF3C3B
        for <linux-next@vger.kernel.org>; Thu, 15 Dec 2022 02:16:04 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id w23so6319672ply.12
        for <linux-next@vger.kernel.org>; Thu, 15 Dec 2022 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GvxCxUJoYyZzHFOvGYK5d5x4pxUh0m2v0dNVpoHfmT8=;
        b=z4/p9FYAG2jpBbJFBc3MF/VKyeBoqen6Hy79hkKhND+TguVDBAlqUZQdEiixtXqapa
         3wI4SeXeYjVAquGsxQUQLlxujVSZF2cLSqIrgSuXX9Mb79vXy0HIsekE0ScU0LmeHOhn
         kSUAzFlGI5S5NRe+Y2f4d+FHWsNvJ5AAlQszWQ8DicaR6HdAMzQFjgXKMd3LQf+IBE7u
         49eWdHrPVlWhqyYIxAIE03j0hgWOEny0/MBTxildkuW1H9uX6lN+DYrs4mAnIH1vNNDc
         3W6X6ib2zm9JXzllGdu9reiFhieL7wiDrAZe9hV4d9yTX9TNnFsJ82FdiLR4BHiX9kh+
         jXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvxCxUJoYyZzHFOvGYK5d5x4pxUh0m2v0dNVpoHfmT8=;
        b=pJKGYQ0+tzwv+n4JxVQKO6NaO/MGbSDUkBj4AAbGbDQ+BK0Nf6YXoPTuSYHvHaX0uc
         H8Fpld1r2tBAFwfTeDW+YeHw5usL7AqEYzuy7v06Cc3xsGM0ZbO5K5VXcL+AVED7nAz8
         /dFfY5XMxRX90ZFjHSVAqU2Op/t3ASAyAqpYSGOzk/tKQLUakb+tPfOARKkMIKDtvSuH
         1Mb5v0cKjFgVIv5orJCZtKB6L6s0YMEThIacbxKdbQ56ro1K8yOMJjLXOri5VqAzLjbB
         f+Toc8UIgaFVYlE9U+o+ifcbF/gu+ZrBYNLD3xkjkZpi6VQnBsr4w+iCPqtmooUXnjl8
         K7NA==
X-Gm-Message-State: ANoB5pkE41Q8FJk+HWl0whoHHyavTDEIoTW5RiDB4mjd394WPxEekM7T
        HsVwA80u3okYChpCtPp8LQTDoDApEmEMusUq2J6DHg==
X-Google-Smtp-Source: AA0mqf5r8VHbz8wtQSPHXOPbDV/8vqIeKpBvtVwM37YiTMyakXwM8uFnZX0M0dSbCjBEFMrAKWwx6w==
X-Received: by 2002:a05:6a20:9393:b0:a9:1472:c480 with SMTP id x19-20020a056a20939300b000a91472c480mr33680502pzh.17.1671099363245;
        Thu, 15 Dec 2022 02:16:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902e14d00b00176b3c9693esm3385604pla.299.2022.12.15.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 02:16:02 -0800 (PST)
Message-ID: <639af3e2.170a0220.9c42b.718b@mx.google.com>
Date:   Thu, 15 Dec 2022 02:16:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-10792-g244d284981da
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 279 runs,
 4 regressions (v6.1-10792-g244d284981da)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 279 runs, 4 regressions (v6.1-10792-g244d28498=
1da)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =

qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-10792-g244d284981da/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-10792-g244d284981da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      244d284981dad836e9983898a926aa3ab91a6bb9 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/639ac74383f65a516f2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639ac74383f65a516f2ab=
cfb
        failing since 229 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/639abb46776e6801b92abd33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639abb46776e6801b92ab=
d34
        failing since 64 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie   | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/639abdf6f8375acb792abd80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639abdf6f8375acb792ab=
d81
        failing since 2 days (last pass: v6.1-rc8-154-g2d38c60cb87b, first =
fail: v6.1-2435-g5c02e5d167d0) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/639acb3eb4f3d00d872abd07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-10792-=
g244d284981da/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221209.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/639acb3eb4f3d00d872ab=
d08
        new failure (last pass: v6.1-6378-g44d433ee7540) =

 =20
