Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E056C466399
	for <lists+linux-next@lfdr.de>; Thu,  2 Dec 2021 13:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357979AbhLBM0s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Dec 2021 07:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357905AbhLBM0h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2021 07:26:37 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCD3C061757
        for <linux-next@vger.kernel.org>; Thu,  2 Dec 2021 04:23:14 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id q16so26833164pgq.10
        for <linux-next@vger.kernel.org>; Thu, 02 Dec 2021 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=twVii6lf3BHScgSaoFtI85wzfvZ+s993KVV/1dTxhuU=;
        b=gpDUoaHjeMLBp+ZAGkaQyvbBjEtQryvAU0+D6yFSXkCQnLAkV1SKt91Q+jhI/xjd3z
         3YLTbYWPbz4yfazQ7p3zY2GVFfQa9E+HwlNUi1cOOG+rv1o0ce5ztagyPfIc/bBKpSD3
         +IwkNNFCrAPAkTRAnnlxtfnq4eX4di20+/r/2yf0PihwTPgf32HNDUddR4KyybGEt98U
         gXXNaUpRWA9UMyRkppyJKHecwmiSmPwhQyHP1mGzcpR2VvzpprEUy3n/uph2OuYd4A+4
         JAopPDkHeOp5olqnrYr3bQDx/n1RIXi8koeWRW4aO5JJ0e6IuT5dHB2EUSbIKV2FBYoQ
         vs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=twVii6lf3BHScgSaoFtI85wzfvZ+s993KVV/1dTxhuU=;
        b=ouYd5CuKifM08S4QF0QjAYLU7NjtbFnUjVGfsPF6GcV3X7GLBSXfWn6lHm/7b4riI+
         A9w6SVM0GCy7VzJifbE2mqPLOnZmWkeUTlbJF03X19753hyVo3B6o2sCu7va9KS6j939
         a+N2yCF4mU9jCrNoyWhlmSLoUci+gMLxBuZh4vGqNHq4CJ90AwwGf5tH7tFTUJye6Squ
         pLSickpP8aVnFlm5nwuRTztD9byBWNQ+RL1uW8ieEpEJywwBxXI+Gi3MJJG4tB8Tu9NE
         nQkGcfPDpQkVR+XyaszJF2S1tRm5nEX41HgDKHduhOnELCnHm0xmIU7pJCbI77K8eJ6U
         v6hg==
X-Gm-Message-State: AOAM531w9jel+cmVMefj4eC73uL6uZyv0bDB58BjafhHIwrtu3Qp6TYH
        c4iJxMOKqqc0sSFmmzp4Yd2V37OspNDrmWTr
X-Google-Smtp-Source: ABdhPJzq2W3oWkNYdMDE4kPHxkZE+uhx7frFa4TLVXAvGsoJCPkdjiYlymEdRm7g4/vwgImbF/zGPg==
X-Received: by 2002:a62:80d2:0:b0:4a4:b4e3:a723 with SMTP id j201-20020a6280d2000000b004a4b4e3a723mr12259222pfd.8.1638447794022;
        Thu, 02 Dec 2021 04:23:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g21sm3590152pfc.95.2021.12.02.04.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:23:13 -0800 (PST)
Message-ID: <61a8bab1.1c69fb81.96a40.a48b@mx.google.com>
Date:   Thu, 02 Dec 2021 04:23:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20211202
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 732 runs, 13 regressions (next-20211202)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 732 runs, 13 regressions (next-20211202)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | clang-13 | defconfig=
                    | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | clang-13 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211202/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211202
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9606f9efb1cec7f8f5912326f182fbfbcad34382 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a8839b912a845cae1a9494

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a8839b912a845cae1a9=
495
        new failure (last pass: next-20211201) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a883dcd67c6b6b711a9484

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a883dcd67c6b6b711a9=
485
        failing since 2 days (last pass: next-20211126, first fail: next-20=
211129) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a88b220a6383af641a9490

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a88b220a6383af641a9=
491
        failing since 2 days (last pass: next-20211126, first fail: next-20=
211129) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a8872d6d57239b6a1a94cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a8872d6d57239b6a1a9=
4ce
        failing since 2 days (last pass: next-20211126, first fail: next-20=
211129) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a88410dfec795e761a94cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a88410dfec795e761a9=
4d0
        failing since 2 days (last pass: next-20211126, first fail: next-20=
211129) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a89d7fb83a23e0501a948b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a89d7fb83a23e0501a9=
48c
        failing since 2 days (last pass: next-20211126, first fail: next-20=
211129) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq          | arm   | lab-collabora   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61a8813d8a74d2f1fe1a94b1

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
61a8813d8a74d2f1fe1a94f1
        new failure (last pass: next-20211201)

    2021-12-02T08:17:53.919442  /lava-5124555/1/../bin/lava-test-case<8>[  =
 13.927977] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | clang-13 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a882cfff57df24c91a94d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a882cfff57df24c91a9=
4d2
        failing since 8 days (last pass: next-20211118, first fail: next-20=
211124) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | clang-13 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a884378aa8a4a9dc1a94c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a884378aa8a4a9dc1a9=
4c6
        failing since 8 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a87d42d3bcdf89b01a94d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a87d42d3bcdf89b01a9=
4d7
        failing since 8 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a87f7383a4864a361a9483

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a87f7383a4864a361a9=
484
        failing since 9 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a88013fdf19a6f441a9482

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a88013fdf19a6f441a9=
483
        failing since 9 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a88473c462bb168f1a94a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211202/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a88473c462bb168f1a9=
4a5
        failing since 9 days (last pass: next-20211118, first fail: next-20=
211123) =

 =20
