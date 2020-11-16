Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A352B43BA
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 13:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbgKPM2D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 07:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgKPM2C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 07:28:02 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D4EC0613CF
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 04:28:02 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id c66so13966097pfa.4
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 04:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eVe1Bn3Rs6fbcwl2fKw23qWNzmMSpTGaiplj7GxGV7w=;
        b=jMQXE4cZIGYajoJk271wzNRiYEg1bV0kgyjMfBFKWln3TVh+nkOiv0KMCrWiLD26cd
         J13L58XflG70fXdd6FqdjftvlPCjm5K/SLbAo0FSwf1oi6x5Btgik5CEYwfqJkzMtrsC
         fc6J/FB01l5X0jLG7x7HCO2Ga9y9ZkLl+3VTyV9T2V6NBr3urA854KGTrhM9oJ8Uy6bX
         gISkLFWXPhlL9LmstUEunfsA7WIGKNWtVHF1A0DcIU+Lpb0gdlyDlOZjUrteGqzGej+r
         ADEMoKpQvjdanLaDJnpr/3+Ng3jroUYdMl0hnR2e/jBKy0hAVPnsuWsv2Xo97aJuPrza
         BGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eVe1Bn3Rs6fbcwl2fKw23qWNzmMSpTGaiplj7GxGV7w=;
        b=JCsbgJey65i0K9dddaW8C3fCfQIoZsbLtjktUYNdjvj7CJuWVmiCvZH8BXlxcCBK7t
         UO4cSqlYxnyGj0NTETbvoQErZy030LAUk9N1s70VPBvr50qcwbj6nxvtUCZckWlkd3RF
         rVrwlvkdH3o/AfLGZSlAhZuqn1jrUfVwLrWDp8ixp34EDEUm5vFupsmYS4buFc9ychLz
         pqQGxRO732+ppMTQknUR7YMwWCK+lpTZ6Pe23f/h3sDq9ATMt0+EbRr+TRHmjSRx5nnD
         GKMPUH/P0mu3aHrJP8pWGQkm9uPMJ5kvfSMkip44JHPQMt8fyvfkgpjwjks2RgAjiwLa
         xc/g==
X-Gm-Message-State: AOAM533SHVu2BmvahQJYw7wsFqAuGGK6xWmxr5FtIUOhEesB/ay2w71d
        Rt1qDWJQYYszzi0S77Zs1TckHghJNsZJUQ==
X-Google-Smtp-Source: ABdhPJy3voO4ta3+I8SS3KO/EZZJiLv6drrJBFbvd2CbyVk0Lk4BywjdO8TMHAwqaxT5r7zI7bC4EA==
X-Received: by 2002:a62:27c1:0:b029:196:59dc:8e6 with SMTP id n184-20020a6227c10000b029019659dc08e6mr3816626pfn.72.1605529681674;
        Mon, 16 Nov 2020 04:28:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a23sm18193389pfl.29.2020.11.16.04.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 04:28:00 -0800 (PST)
Message-ID: <5fb27050.1c69fb81.ec337.8206@mx.google.com>
Date:   Mon, 16 Nov 2020 04:28:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc3-639-ga24d51ed9363
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 9 runs,
 5 regressions (v5.10-rc3-639-ga24d51ed9363)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 9 runs, 5 regressions (v5.10-rc3-639-ga24d51ed=
9363)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc3-639-ga24d51ed9363/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc3-639-ga24d51ed9363
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a24d51ed93639dc84304e51a4c6faa533a4a91d4 =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb2253b99949fdb9379b899

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb2253b99949fdb9379b=
89a
        new failure (last pass: v5.10-rc3-420-g5364e201065c) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb225295d9102a14a79b89e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb225295d9102a14a79b=
89f
        new failure (last pass: v5.10-rc3-420-g5364e201065c) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb225275d9102a14a79b89b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb225275d9102a14a79b=
89c
        new failure (last pass: v5.10-rc3-420-g5364e201065c) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb224d8183580f9a079b897

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb224d8183580f9a079b=
898
        new failure (last pass: v5.10-rc3-420-g5364e201065c) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb224f1a5d245dd9979b897

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc3-6=
39-ga24d51ed9363/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb224f1a5d245dd9979b=
898
        new failure (last pass: v5.10-rc3-420-g5364e201065c) =

 =20
