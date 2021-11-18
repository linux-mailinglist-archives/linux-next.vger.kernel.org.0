Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898CB455906
	for <lists+linux-next@lfdr.de>; Thu, 18 Nov 2021 11:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245231AbhKRK3U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Nov 2021 05:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245182AbhKRK3Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Nov 2021 05:29:16 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66D8C061570
        for <linux-next@vger.kernel.org>; Thu, 18 Nov 2021 02:26:16 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id iq11so4735259pjb.3
        for <linux-next@vger.kernel.org>; Thu, 18 Nov 2021 02:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Aj01fV86d59X3p/MWGC0ju4lLb7ylqEOn3aGvMhIJu0=;
        b=UWzi9s3ODuR5Rye2VBQ7apO+UmgOgeiVUcSd+NOnlUeTAbbwOwpFzW+ZZXDdZSr3r0
         7eQCDLjqyZtxGTsihTVnkj3kgfsnAIe7RAGpIhJLCpCzbJDlQzwUHksRWVcq3wXImpBN
         4MR+G8GLYpvVhQB7rFKmOpFVggx8H4/SvZo5xZTDWeDvVNTlgezs14d9Ad/2un2Y2QKT
         0od6bS7v8NGt16VBe4MpYMvbd9YoExiPrcLQ+hN0S9yigIxqxobRx6edcJTk8WdZmzO1
         5Qrip/u/2kROWidrOQ3ek2ObYaQnt78qzh449T38y3diB8wlKUcEnF0qeSN3LVw+wUqm
         NrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Aj01fV86d59X3p/MWGC0ju4lLb7ylqEOn3aGvMhIJu0=;
        b=Dhk29MxIz4rVlm2RMxgS4Y3LeSo/T+b1CapU/aOR7yfYL89Qjxc6R7b57adCvRGyhk
         w+SyytxIW6+sdShciLEMOqCzqfqF/BH8KzNdYBEN1nBkSmOhDkpuCHOVcxWR3CfFvsWf
         P+Qm/NLHLI+5j3mLvI/iM5TZgtRaspNvLTgMjqIe8rf2Wjpl0dlSmbjJqm6JHcM41cfF
         qF58e9KLiv3Sn0jvtcXBzBtSYPK352VLM8yO09WbMHzrgxd+lvJA5S2xcHd/H/MPnyG9
         D0uvEwrfvuLZIPDeY96ghzlGcXf5WCLIXfbJBOxKrZPeCWYCiiRiyPnRh8yR+6Ok7tD+
         Qc/w==
X-Gm-Message-State: AOAM533njY5B9RPUnjx1Uf9rnPoxaTCGXC6WWJ7AxuJif3zgj5UQRrQu
        ITLVsFAySItTABCNtXsmun5lQEs0UIffPeY+
X-Google-Smtp-Source: ABdhPJz5ap+z3fjDIQ5OBFMfE3g/Bi3GDEEGegCt4N+RuK5B5Luk2ZywGImzGOQ62sCYfdcBYhYTKA==
X-Received: by 2002:a17:903:22c6:b0:141:fac1:b722 with SMTP id y6-20020a17090322c600b00141fac1b722mr66286466plg.23.1637231176004;
        Thu, 18 Nov 2021 02:26:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u11sm2877948pfk.152.2021.11.18.02.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 02:26:15 -0800 (PST)
Message-ID: <61962a47.1c69fb81.16aac.861b@mx.google.com>
Date:   Thu, 18 Nov 2021 02:26:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20211118
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 756 runs, 5 regressions (next-20211118)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 756 runs, 5 regressions (next-20211118)

Regressions Summary
-------------------

platform                 | arch   | lab          | compiler | defconfig    =
            | regressions
-------------------------+--------+--------------+----------+--------------=
------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig+debug | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-broonie  | gcc-10   | multi_v7_defc=
onfig+debug | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-cip      | gcc-10   | multi_v7_defc=
onfig+debug | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie  | gcc-10   | x86_64_defcon=
fig+debug   | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip      | gcc-10   | x86_64_defcon=
fig+debug   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211118/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211118
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5191249f880367a4cd675825cd721a8d78f26a45 =



Test Regressions
---------------- =



platform                 | arch   | lab          | compiler | defconfig    =
            | regressions
-------------------------+--------+--------------+----------+--------------=
------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre | gcc-10   | multi_v7_defc=
onfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/6195f52e07015d012b335931

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195f52e07015d012b335=
932
        new failure (last pass: next-20211117) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
            | regressions
-------------------------+--------+--------------+----------+--------------=
------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-broonie  | gcc-10   | multi_v7_defc=
onfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/6195f9c9aea86a66213358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195f9c9aea86a6621335=
8dd
        new failure (last pass: next-20211117) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
            | regressions
-------------------------+--------+--------------+----------+--------------=
------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-cip      | gcc-10   | multi_v7_defc=
onfig+debug | 1          =


  Details:     https://kernelci.org/test/plan/id/6195f6604d540d6a4f3358f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195f6604d540d6a4f335=
8fa
        new failure (last pass: next-20211117) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
            | regressions
-------------------------+--------+--------------+----------+--------------=
------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie  | gcc-10   | x86_64_defcon=
fig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/6195efc86d22cef2a2335906

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211118/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211118/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195efc86d22cef2a2335=
907
        new failure (last pass: next-20211117) =

 =



platform                 | arch   | lab          | compiler | defconfig    =
            | regressions
-------------------------+--------+--------------+----------+--------------=
------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip      | gcc-10   | x86_64_defcon=
fig+debug   | 1          =


  Details:     https://kernelci.org/test/plan/id/6195ef582aa5b179fc3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211118/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211118/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6195ef582aa5b179fc335=
8dd
        new failure (last pass: next-20211117) =

 =20
