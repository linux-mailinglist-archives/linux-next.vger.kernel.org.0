Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF1D4EA4B9
	for <lists+linux-next@lfdr.de>; Tue, 29 Mar 2022 03:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiC2Bpl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Mar 2022 21:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiC2Bpk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2022 21:45:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EBB27B0B
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 18:43:58 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id gp15-20020a17090adf0f00b001c7cd11b0b3so822203pjb.3
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 18:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XZlSjqK7X/uCpR33KQrXOTGtZeI6EV7Ve2uXgt6Vlps=;
        b=0/VSOBtRa7qfF9O+waMxJnYaxBGmjeKnyOTrHiAZu9t82vx1GZihvk0FV7yK0a4uYU
         mpcdCw3SatHjpU5xeBbGK3jMyaPcvDjpzniMMBHPNiqaYhKeF5ntCnpC0h6P/U5K+1jH
         3EjHL2KtOwpgnm3yW7dgNUCxEaVWK4oNtWEdY52s+FaDusKz4ti8Tf0MAr9cOyvZbV/R
         nqF6lK20Y9EdclN5kiIzsbXuUpve3dkVkXmQ4Kaws6QvfyGzoHQLUT6J3+Beey2kYm/h
         yKiz9KYP290Bovq2yIef+SKM9N8zcV88ITQt5rXJlYjKara+b9e92go4B1X+8FwmLprg
         COyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XZlSjqK7X/uCpR33KQrXOTGtZeI6EV7Ve2uXgt6Vlps=;
        b=hNPBa5svA5W5kKL28eU6rpSzDGVrSqsAfB5FDbDMKNmxF9a6fcgjRs25HY2FpmcuYF
         fXOqtnf2xtv+HDT/pud0DbrVfJqrmgo0qTvM2DBWmcy9aY0FV+RzOnQpvJi50bAxMZz6
         HS0ltK8TFCqGt/L+7HslKlfC8HHoICu5wemXfVy/+OXNqmRXM61TBoqAm1/pem0nRLqR
         3S4lqKKoNpNqns8ihJPBuE1tpxwWtPOD3PWTklOTeLYDH5SLWWUhtx/H+6vr6EA0xn1G
         NkgiW2FUwMcatUmRVK6ZJPLbvEt7+KXmzdCIyzPN2fPg6UwrV3f4IEEiKLwVnEKldvre
         2pPQ==
X-Gm-Message-State: AOAM530oLllg+AKugI4h2Lxv3q9giP8UJlQiz2XG42XCepFHfWuHD61g
        c/vTTxrlzd2wcX3JbfFcsF6mNQ+5wexKFQM4Lpg=
X-Google-Smtp-Source: ABdhPJxDnMWSDaalv/lhha5MHYtpGtHvxhWx4yvvrqzQU5Fcwro694qV/qa/4lvPEGkxiV+rv3XFZA==
X-Received: by 2002:a17:90b:314d:b0:1c7:b15b:ddcb with SMTP id ip13-20020a17090b314d00b001c7b15bddcbmr1997245pjb.194.1648518237639;
        Mon, 28 Mar 2022 18:43:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h189-20020a636cc6000000b0039841f669bcsm5318171pgc.78.2022.03.28.18.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 18:43:57 -0700 (PDT)
Message-ID: <6242645d.1c69fb81.4928f.da8c@mx.google.com>
Date:   Mon, 28 Mar 2022 18:43:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-11526-gd877adea8dd9
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 361 runs,
 12 regressions (v5.17-11526-gd877adea8dd9)
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

next/pending-fixes baseline: 361 runs, 12 regressions (v5.17-11526-gd877ade=
a8dd9)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
crypto             | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | gcc-10   | defconfig =
                   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-11526-gd877adea8dd9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-11526-gd877adea8dd9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d877adea8dd9eeb4b0cdf1aee6b2e4c6358ffd32 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6242294902acb5446bae06cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6242294902acb5446bae0=
6cc
        failing since 12 days (last pass: v5.17-rc7-200-gfb8a41b34095, firs=
t fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
asus-C523NA-A20057-coral   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/62422c42d5f2fc5b1bae0682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62422c42d5f2fc5b1bae0=
683
        failing since 13 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624223633218191cc4ae06b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/=
baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624223633218191cc4ae0=
6b1
        failing since 12 days (last pass: v5.17-rc7-200-gfb8a41b34095, firs=
t fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-x360-12b-n4000-octopus  | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/624224d6f5e212fad8ae06bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-col=
labora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624224d6f5e212fad8ae0=
6c0
        failing since 13 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62422926fbdf6fbcb5ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62422926fbdf6fbcb5ae0=
67e
        failing since 42 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62422747251a050ebfae06b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62422747251a050ebfae0=
6b9
        failing since 42 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/624228ec9b5a2ca884ae068f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624228ec9b5a2ca884ae0=
690
        failing since 42 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/624226f8582afab938ae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624226f8582afab938ae0=
687
        failing since 42 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624222cee842a0f10bae0695

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624222cee842a0f10bae0=
696
        new failure (last pass: v5.17-7667-gf25e53282ab9) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62422603b83c415282ae0696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62422603b83c415282ae0=
697
        new failure (last pass: v5.17-7667-gf25e53282ab9) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62421eef8d0e762c16ae06c5

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseli=
ne-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62421ef08d0e762c16ae06e7
        failing since 28 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-28T20:47:18.759481  <8>[   32.537251] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-28T20:47:19.787784  /lava-5963946/1/../bin/lava-test-case
    2022-03-28T20:47:19.799402  <8>[   33.577106] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/624222a83b3ce97822ae06ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-11526=
-gd877adea8dd9/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624222a83b3ce97822ae0=
700
        new failure (last pass: v5.17-7667-gf25e53282ab9) =

 =20
