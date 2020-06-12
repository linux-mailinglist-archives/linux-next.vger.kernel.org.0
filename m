Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2221F738D
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 07:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgFLFgC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Jun 2020 01:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgFLFgC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2020 01:36:02 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FCCC03E96F
        for <linux-next@vger.kernel.org>; Thu, 11 Jun 2020 22:36:01 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id h22so12060pjf.1
        for <linux-next@vger.kernel.org>; Thu, 11 Jun 2020 22:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LcIgAl1+0Bfk5jpEyAyA9+8PzP+BtDAE/jyz4mZneKc=;
        b=V8pOUEKSsweKjsu1rUFaw5b7gfB0QRxWUaxJFuyMKaL/p7FZ9JU5woSZpzdkEh3N/V
         3Qj4fpq6fAnoDJoRkpjY7DuoPrAe1Wlfk931+NcTeFtA0Zt3CMF39O0E14oQ7691NlOI
         Wf0/2wNtWsPP4lqFEaTfB+H1UIR36kYOvkK7zX4U2sofBaCp2M79uSADiKjvbxKNaKEW
         exNkDb/eA8FJ/KxS4DuKNNoOgi67u8RJBteuKxRZZ9xp3z8cmhGiuv6EOydhRirHYBki
         gKUaAWwfQimXYk+G6kZNtSOI1xCYoF/IRTMocT+QpUCwjZ2EehYX1As2vcqTabaCNYVH
         83Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LcIgAl1+0Bfk5jpEyAyA9+8PzP+BtDAE/jyz4mZneKc=;
        b=O6jZPzx8gAPpSVrK1vOg6jLtaNtIVQevDkTk3I9e4YU3b1hQNaqtRDoqNJtPCf0PWv
         WKHq7gZ1Uov65gnPmANeZYy0+ZyDbXMjbp9GfLfJj0+vpWeg6QUXZCzSZK49xmUR4Vmr
         Vha5JbB7WJ/yiqEp+jFDUJCO5J9+Bm8XuVl1uzWIfWlHvCO/TUU3WdQMdfP2GXb05wpE
         H43goCjB1Z2/sijcBSGVxaDpcFw4fCCUJPSr31UaJNQv6ypsGz+PcHQUPgILVIpB1kz5
         HBdZKgUWm0t/6FioIaeQbMnU1JHVhUPevfouokP62CW69+iQ/Hed+txwwuvSQj+LrueQ
         UCvw==
X-Gm-Message-State: AOAM531kl2JyLGjbRXxI3o/IEiLc271BchZxoW3xQNSIVWyBGNcvG90q
        vNC4ySBkBRNoLpb0CT75haE6rOki8Uk=
X-Google-Smtp-Source: ABdhPJy6lXHnNAV6tsYU+uQ3zYuDkEFwhzFOBK8n5ctUcDunvoWDN0OOn+orI99cecTcC8k4KAWKBw==
X-Received: by 2002:a17:90a:30e1:: with SMTP id h88mr10736604pjb.43.1591940160327;
        Thu, 11 Jun 2020 22:36:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v186sm4855688pfv.54.2020.06.11.22.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 22:35:59 -0700 (PDT)
Message-ID: <5ee3143f.1c69fb81.2bc46.12eb@mx.google.com>
Date:   Thu, 11 Jun 2020 22:35:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-14413-gf19136b39e47
Subject: next/pending-fixes baseline: 131 runs,
 4 regressions (v5.7-14413-gf19136b39e47)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 131 runs, 4 regressions (v5.7-14413-gf19136b39=
e47)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.7-14413-gf19136b39e47/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.7-14413-gf19136b39e47
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f19136b39e477ce7853148bafce3cb3f8dbbdd1c =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee2de3ae385246c1d97bf29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee2de3ae385246c1d97b=
f2a
      new failure (last pass: v5.7-14137-g60392f4b277d) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee2dccd8f6ff75a6e97bf1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee2dccd8f6ff75a6e97b=
f1c
      failing since 37 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee2db4e9cbceda8d997bf25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee2db4e9cbceda8d997b=
f26
      new failure (last pass: v5.7-13513-ga8195ca429a0) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee2df3cc237bdb96e97bf27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.7-14413-=
gf19136b39e47/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-l=
ibretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee2df3cc237bdb96e97b=
f28
      new failure (last pass: v5.7-14137-g60392f4b277d) =20
