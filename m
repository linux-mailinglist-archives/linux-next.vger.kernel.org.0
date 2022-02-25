Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203154C40FA
	for <lists+linux-next@lfdr.de>; Fri, 25 Feb 2022 10:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbiBYJLh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Feb 2022 04:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbiBYJLg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2022 04:11:36 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFE025D6CB
        for <linux-next@vger.kernel.org>; Fri, 25 Feb 2022 01:11:02 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id l19so4189694pfu.2
        for <linux-next@vger.kernel.org>; Fri, 25 Feb 2022 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6ACHELpBsqzLsJoNSacq7FkuIGTisy7CyXHQrYpo10M=;
        b=D/qA/yIzbTDfbBVtQRHhaLRPqzoq6D97MOf7CKL0rF75/s1Jz2X4+3st/F9B/Dt9o/
         Hic/nJaKrnT5dluKK7gAGfFi0ELm1pHX92WPgC6ZVEWtQtZf0zCUmHrWe0q3l1qeVBRK
         l2CLrG9gRP2kmVmCtFf6mnNTKA2L7p6VZNm1YltrCIdgW6BY4MxmhLTh+WtDLCPwzPqY
         RSii9CXUXjq/XGTtFmjpGRpTxnpzt9CBImBsGTg3hSyiFvvBaczGXQ6g6fyJmNZ7Hw7L
         93FsIG8tmoC2RYBR5SohSwxPb8zR9uYb+uffxbu4boElX9ouhT9uDXsv4gabPFbKFc0H
         k1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6ACHELpBsqzLsJoNSacq7FkuIGTisy7CyXHQrYpo10M=;
        b=ZlaFtylKYkefGeKqqe433qGDVFxppOhCcgIgtZ0K65y8wSuKjHTkSsXKRL0wDOdoio
         PPb7TNVYAFyD3nrE6JyvTNmnAVHYBOu3Zg1gforC4SyGJAOtbmeVBsf6TH9e1zhC1bvT
         plekCAlnQ2nuhKuI0GNyXLT3tovqrN+vSA82N/IzhqaRS3u0+bCdqh04FYk9cUJ+FjEY
         XOhYiM/kZgplwt+IvsUMoBdA0fpFGOrZkFNd2hKtBBUzwxAAMl5SiO2jYyFf3pm4xWnL
         TK0K8K4QcKsztYCXTwJ8KD0Xqtzwm4dc0M2gyELERya/7uFMhRPTdkPCxkmrBrZIdlJv
         s1Kw==
X-Gm-Message-State: AOAM533WPbkZWf/Nv6yR9bMWOEj3/gNbSA93XE+P6iX4CdtFYizFNDwJ
        kK+bKSzBY1Uq9SGP3q7acg+0aSSo1QxwkTFVI+k=
X-Google-Smtp-Source: ABdhPJwuWXJ3TBUhdFsl1m2hRWtOjjZRDSwPSYB1wO1yi1cF+VZE+Msh9BrPjWrQ9bSpcaygSzwTHQ==
X-Received: by 2002:a63:2c14:0:b0:373:7200:d07d with SMTP id s20-20020a632c14000000b003737200d07dmr5398152pgs.617.1645780261254;
        Fri, 25 Feb 2022 01:11:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j9-20020a056a00234900b004f3b1c23497sm2382062pfj.101.2022.02.25.01.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 01:11:00 -0800 (PST)
Message-ID: <62189d24.1c69fb81.b2f68.6ea0@mx.google.com>
Date:   Fri, 25 Feb 2022 01:11:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220224
Subject: next/master baseline: 302 runs, 63 regressions (next-20220224)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 302 runs, 63 regressions (next-20220224)

Regressions Summary
-------------------

platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
fsl-ls2088a-rdb            | arm64  | lab-nxp      | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =

qemu_i386                  | i386   | lab-baylibre | clang-14 | i386_defcon=
fig               | 1          =

qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig               | 1          =

qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig+debug         | 1          =

qemu_i386-uefi             | i386   | lab-baylibre | clang-14 | i386_defcon=
fig               | 1          =

qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig               | 1          =

qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig+debug         | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | clang-14 | x86_64_defc=
onfig             | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...86_kvm_guest | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig             | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+ima         | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+debug       | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+amdgpu      | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | clang-14 | x86_64_defc=
onfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...86_kvm_guest | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+ima         | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+debug       | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | clang-14 | x86_64_defc=
onfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+ima         | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+debug       | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+amdgpu      | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220224/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220224
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      44948bd49d878dad6c9707e34f4a06df73c3a800 =



Test Regressions
---------------- =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
fsl-ls2088a-rdb            | arm64  | lab-nxp      | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/62186aed9acfe059dcc62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186aed9acfe059dcc62=
979
        failing since 0 day (last pass: next-20220214, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62186887fb422d39c6c62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186887fb422d39c6c62=
971
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62186837984e4df61ec62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186837984e4df61ec62=
972
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621868395da672d134c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621868395da672d134c62=
969
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621868720644359c6ac62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621868720644359c6ac62=
977
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6218662ec04d7e749dc62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218662ec04d7e749dc62=
984
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6218651b4056c43c5cc62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218651b4056c43c5cc62=
97a
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621867968ad2fe836dc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621867968ad2fe836dc62=
976
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621868d7da6fdb3645c62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621868d7da6fdb3645c62=
984
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/62186963ca759be643c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186963ca759be643c62=
983
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/621869b20bce75a737c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621869b20bce75a737c62=
970
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621865ca16c0c64e1bc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621865ca16c0c64e1bc62=
969
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62186518f9069e7878c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186518f9069e7878c62=
986
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621867e6ac90584c49c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621867e6ac90584c49c62=
98f
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621868eb58ea7b0ba0c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621868eb58ea7b0ba0c62=
977
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/6218692767574d1d21c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218692767574d1d21c62=
974
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/621869c70bce75a737c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621869c70bce75a737c62=
976
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621865cb6123f63d63c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621865cb6123f63d63c62=
974
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62186516f9069e7878c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186516f9069e7878c62=
983
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621867fc1aebf2cee3c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621867fc1aebf2cee3c62=
96a
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621868c2834a316762c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621868c2834a316762c62=
980
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/62186977df332ecba5c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186977df332ecba5c62=
976
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62186a038488a3a404c629b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186a038488a3a404c62=
9b8
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | clang-14 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621865de16c0c64e1bc6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621865de16c0c64e1bc62=
97b
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+a=
rm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62186519f9069e7878c62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186519f9069e7878c62=
989
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621867fb7c5cbb4686c6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621867fb7c5cbb4686c62=
97b
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62186912d90d3ba4f4c629d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186912d90d3ba4f4c62=
9d3
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/6218698bdf332ecba5c62999

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218698bdf332ecba5c62=
99a
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/62186a1731c795ca8ec62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186a1731c795ca8ec62=
969
        failing since 15 days (last pass: next-20220208, first fail: next-2=
0220209) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_i386                  | i386   | lab-baylibre | clang-14 | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6218625afbf9d7d8b5c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218625afbf9d7d8b5c62=
969
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62186015409fa8588ac629e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186015409fa8588ac62=
9e2
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_i386                  | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/621861e215a3b3c4b9c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621861e215a3b3c4b9c62=
969
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_i386-uefi             | i386   | lab-baylibre | clang-14 | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6218625bfbf9d7d8b5c6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218625bfbf9d7d8b5c62=
96e
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/62185fda2f11868823c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62185fda2f11868823c62=
98f
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_i386-uefi             | i386   | lab-baylibre | gcc-10   | i386_defcon=
fig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/621861e415a3b3c4b9c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621861e415a3b3c4b9c62=
96c
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | clang-14 | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6218620915a3b3c4b9c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/clang-14/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/clang-14/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218620915a3b3c4b9c62=
98f
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62185f12fa4e8f2e69c62984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62185f12fa4e8f2e69c62=
985
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6218608e97a476199ec6299c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218608e97a476199ec62=
99d
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/62186155d3e4846627c6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186155d3e4846627c62=
97c
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/621862bf736477c517c6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621862bf736477c517c62=
97f
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/621863352f70046f91c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621863352f70046f91c62=
969
        failing since 1 day (last pass: next-20220216, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/621863372f70046f91c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621863372f70046f91c62=
96c
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/621863b1ed1b3254b0c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621863b1ed1b3254b0c62=
986
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/6218658e8084c003bbc62a5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218658e8084c003bbc62=
a60
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | clang-14 | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6218624565b2dbb490c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/clang-14/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/clang-14/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218624565b2dbb490c62=
98f
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62185f10fa4e8f2e69c62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62185f10fa4e8f2e69c62=
982
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/621860a3b226246c9cc629a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621860a3b226246c9cc62=
9a7
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/62186157d467ec0ef7c629d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186157d467ec0ef7c62=
9d1
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/621862bdd8750776f4c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621862bdd8750776f4c62=
969
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/621862d2736477c517c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621862d2736477c517c62=
98a
        failing since 1 day (last pass: next-20220216, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62186371781e288b69c6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186371781e288b69c62=
96e
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/621863af01b41cf5c8c62aea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621863af01b41cf5c8c62=
aeb
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/6218658f8084c003bbc62a65

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621865908084c003bbc62=
a66
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | clang-14 | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6218624709f12e7476c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220217053027+192d9=
680c1b1-1~exp1~20220217173116.61)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/clang-14/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/clang-14/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218624709f12e7476c62=
97e
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/62185f4d3118e1104cc6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62185f4d3118e1104cc62=
98d
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/621860a1b226246c9cc62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621860a1b226246c9cc62=
999
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/6218616a34e579e263c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218616a34e579e263c62=
969
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/621862817b4fcc8f78c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621862817b4fcc8f78c62=
98f
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/621862f9d69f208b2dc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621862f9d69f208b2dc62=
969
        failing since 1 day (last pass: next-20220216, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6218634aa3f3a0a3e1c62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218634aa3f3a0a3e1c62=
981
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/621863c11c2ca99da0c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/621863c11c2ca99da0c62=
974
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre | gcc-10   | x86_64_defc=
onfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/6218653fe8da4392cfc6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6218653fe8da4392cfc62=
97b
        failing since 1 day (last pass: next-20220217, first fail: next-202=
20223) =

 =



platform                   | arch   | lab          | compiler | defconfig  =
                  | regressions
---------------------------+--------+--------------+----------+------------=
------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62186fe6833e005b65c62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220224/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62186fe6833e005b65c62=
989
        new failure (last pass: next-20220223) =

 =20
