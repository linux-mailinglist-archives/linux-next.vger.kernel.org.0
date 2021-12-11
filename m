Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E259471145
	for <lists+linux-next@lfdr.de>; Sat, 11 Dec 2021 04:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbhLKDib (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Dec 2021 22:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbhLKDib (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Dec 2021 22:38:31 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686A2C061714
        for <linux-next@vger.kernel.org>; Fri, 10 Dec 2021 19:34:55 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id r5so9641365pgi.6
        for <linux-next@vger.kernel.org>; Fri, 10 Dec 2021 19:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iLNwfhqo0sBigYbZARz8NYBFikCddTqs82z84381Kbg=;
        b=B3UhMCT40EK+vSO8AKZHr0Rz4iy6q/uTZ688KyqjXo0dTKl3J1adVueoR9KeUfM1Fq
         spfHjR3pRdxPUqsdwH9nibNF74wbIYhoifa6n41+myWHFloueEfmMDn12txU2S+52JJx
         Wx7BBeFzi816yydML50knFN9UB8HbE0JQdfWJ9fMT6J/I7uvoEQiX73SpgmqlpsFsfll
         OZNDwcwq1xKy+ZpkrP67zzt9dj0mSafuep3oPWVXWWp26bIUs1tiqwgcD2iUSS86f0jx
         4iRBy1GXgz+ojfjFjoQnWP+j5mV4nhgFpuQZj5d++/H/587sa3m3Jm8t8hZwHaXv+x7c
         KjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iLNwfhqo0sBigYbZARz8NYBFikCddTqs82z84381Kbg=;
        b=UIncSFx0Xlxna03+2wjiw+6b/5/fwRpP4UUknwSTDRy0l/sNppT2UUFSZrq2jxrQSn
         uTXospSYGJJFVJwtHwQpTljVV5ZuRZKXf0TEBvUDr1q1mQP98Ewx6dJ+fYrYCUGfwpyw
         HdhGwRCqDOearCZgFLoVw7Ysd31qLeEya/mG/0BuWB3Cu3OrEXRFZFkPFGzyvt+p81bF
         STFH+CyKYOHhVoxi2I0Xjcyxwqy4n1c6OrNbEYW8IV2X1MCZURC11tYi8p1LLW0Jr1R0
         QT3xrtypxEid6lJICqqYiJ64C4BY8XpKR3xQxT3Uh5/SuSWp3XNBGGFi+ObzeptdHO70
         Y6dQ==
X-Gm-Message-State: AOAM530dQx8eediUCaeb3pMZSZdg1kYCZeH2foAGTgdHqgPbYXhDnKGY
        lHpj5rWy78kw+bzArdPwWiLgW7y51BIBsPAE
X-Google-Smtp-Source: ABdhPJzWWDNM664yDNDyl5hJVlViG0kNolcaUoMLPxFro/H6FR66UMnf629v3J+1WjcU1xYtOsYr7Q==
X-Received: by 2002:a65:58cc:: with SMTP id e12mr39724194pgu.59.1639193694641;
        Fri, 10 Dec 2021 19:34:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y18sm4465988pfp.190.2021.12.10.19.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 19:34:54 -0800 (PST)
Message-ID: <61b41c5e.1c69fb81.107ea.e60c@mx.google.com>
Date:   Fri, 10 Dec 2021 19:34:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc4-6579-gea922272cbe5
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 872 runs,
 14 regressions (v5.16-rc4-6579-gea922272cbe5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 872 runs, 14 regressions (v5.16-rc4-6579-gea922272cbe=
5)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | clang-13 | multi_v7_de=
fconfig           | 1          =

meson-g12b-odroid-n2       | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

qemu_arm-virt-gicv3        | arm   | lab-collabora | clang-13 | multi_v7_de=
fconfig           | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | clang-13 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | clang-13 | defconfig  =
                  | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/v5.16-r=
c4-6579-gea922272cbe5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: v5.16-rc4-6579-gea922272cbe5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ea922272cbe547bdf58da2aaf240d59782c6a009 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | clang-13 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e64cae86d0e394397149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm/multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm/multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e64cae86d0e394397=
14a
        failing since 10 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-g12b-odroid-n2       | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3dd852cb8fc9d2439716a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/b=
aseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/b=
aseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3dd852cb8fc9d24397=
16b
        new failure (last pass: next-20211208) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-virt-gicv3        | arm   | lab-collabora | clang-13 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e581c5a9de13a6397130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm/multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-=
virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm/multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-=
virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e581c5a9de13a6397=
131
        new failure (last pass: next-20211207) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3ebfa306844da51397127

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3ebfa306844da51397=
128
        failing since 3 days (last pass: next-20211206, first fail: next-20=
211207) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3f12311b7ca7fba397181

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gi=
cv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3f12311b7ca7fba397=
182
        failing since 3 days (last pass: next-20211206, first fail: next-20=
211207) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e2b6d393efc4d239722b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e2b6d393efc4d2397=
22c
        failing since 3 days (last pass: next-20211206, first fail: next-20=
211207) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | clang-13 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e40d035bf24e0139715d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/base=
line-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/base=
line-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e40d035bf24e01397=
15e
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | clang-13 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e5604999de631139716d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e5604999de6311397=
16e
        failing since 16 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3dd18b076888bf7397180

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3dd18b076888bf7397=
181
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3de802ebf66948339712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseli=
ne-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseli=
ne-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3de802ebf669483397=
12c
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3de80cd548829a3397122

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3de80cd548829a3397=
123
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e0edc58e94be2b397137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e0edc58e94be2b397=
138
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e2b8d393efc4d239722e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e2b8d393efc4d2397=
22f
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b3e5113985dc979c39713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baselin=
e-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/v5.16-rc4-6579-gea=
922272cbe5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baselin=
e-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b3e5113985dc979c397=
13c
        failing since 17 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
