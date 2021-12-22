Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6C647CC00
	for <lists+linux-next@lfdr.de>; Wed, 22 Dec 2021 05:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242205AbhLVEQs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Dec 2021 23:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242314AbhLVEQr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2021 23:16:47 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A57C061574
        for <linux-next@vger.kernel.org>; Tue, 21 Dec 2021 20:16:47 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id q17so885679plr.11
        for <linux-next@vger.kernel.org>; Tue, 21 Dec 2021 20:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=95tOImqJkHDydld66G+22jN2KCiVAi8ifO/oz5wpbrg=;
        b=DqPsMoRxibQAbW5O15ps39fHC8BPvi8U56FAZKvI84VfBnBsOLbv+Osid7gGivHl25
         CtYiy72MvL1D/ZyKX6OjAV24T/3nuKGLFoxq0RjTroPlUBLunGYjlKdX5D46azwfn+zN
         u2DykMPWP1TnXMwEKZ/iEfjVzOORogRbmDCaOyC0pJlb+wsnSsDV8teruN3RUSCGdStL
         Ph64C3qveOiGBWuF7EAiYn/SduoJ9NJmxqEGpSS/B08tw/+qMEBfGJ2qRc+e3MBNcDHx
         pviLm+Sncqah/ayQP0W1NMGHo5BYO1Ot1L4gqGc62GKlXJ1rOYQhVBUSgshCZd72f/Bf
         Oh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=95tOImqJkHDydld66G+22jN2KCiVAi8ifO/oz5wpbrg=;
        b=x/lFfQSKMZ4LwFMZpkp66y2GfgAmaF7dKHun7YBQo+lcn2uciieEo8TBhhQIfGtU7B
         reTljCIsbgCn5KbYSnfkEeMMgtHNTwDfgy9phPvph4NG6N6uj2pJr4pYjhBUKGUy/8EM
         WKVZQ1H1n1OUDn5xlKBmNvpc/b4oZtsI5seAeU2qKr7+ObkgQyWnHYnzBG0OlC14hyzC
         Z4c5s+f80PE1Ov92tbRGxIQcMH1qswjifd70YCpxAiKZnnX3BhScfD2daxagc5yqltpn
         sMIJ9QyVOwL715HbahT0CKnE7xqiRxUbC5t6I/k7fRpdF+TOHRisTsnm7iRmy2lsthty
         ohYw==
X-Gm-Message-State: AOAM532DiJ4l9Y7Fz/WM8J1oqLhjg8uwo0BK/NrB3sAGVwKuwtuU7c9C
        kFWJKA17MTgxMrZGpYT8xPJyAoBJ1FedvOSU
X-Google-Smtp-Source: ABdhPJwKZ0YwGoG3gHN7qpfc50EsgXhKxQfE7CaxgJ2/e0QFDmo7KxibLE7L4jpusAZgqytcCoeGFQ==
X-Received: by 2002:a17:902:ab02:b0:148:bca5:bab with SMTP id ik2-20020a170902ab0200b00148bca50babmr1418900plb.46.1640146607069;
        Tue, 21 Dec 2021 20:16:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y12sm589801pfe.140.2021.12.21.20.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 20:16:46 -0800 (PST)
Message-ID: <61c2a6ae.1c69fb81.dcb2a.2ac9@mx.google.com>
Date:   Tue, 21 Dec 2021 20:16:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc6-189-gb5f0860e19b1
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 717 runs,
 3 regressions (v5.16-rc6-189-gb5f0860e19b1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 717 runs, 3 regressions (v5.16-rc6-189-gb5f086=
0e19b1)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc6-189-gb5f0860e19b1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc6-189-gb5f0860e19b1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b5f0860e19b1e6ac634308b70049180d800e1619 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c27971335af0fda739711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
89-gb5f0860e19b1/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
89-gb5f0860e19b1/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c27971335af0fda7397=
11f
        failing since 42 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61c26adbac5a911af1397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
89-gb5f0860e19b1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
89-gb5f0860e19b1/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c26adbac5a911af1397=
133
        failing since 0 day (last pass: v5.16-rc5-395-g46f3b5d984fa, first =
fail: v5.16-rc6-155-g25b50ce58687) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61c26e4cff577ee3ee397141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
89-gb5f0860e19b1/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc6-1=
89-gb5f0860e19b1/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseli=
ne-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c26e4cff577ee3ee397=
142
        failing since 1 day (last pass: v5.16-rc5-257-g713f2fcb90ea, first =
fail: v5.16-rc5-395-g46f3b5d984fa) =

 =20
